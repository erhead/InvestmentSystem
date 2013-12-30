(function ($) {
    'use strict';

    var namespace = 'colresize',
        rowsSelector = '>tr,>thead>tr,>tbody>tr',
        cellsSelector = 'td,th',
        gripsContainerSelector = '.colresize-grips-container',
        gripsSelector = '.colresize-grip, .colresize-ie-fake-grip',

        $document = $(document),
        $head = $('head'),
        $window = $(window);

    function getVisible($elements) {
        return $elements.filter(function (index) {
            var $element = $($elements[index]);
            return $element.css('display') != 'none'
                && $element.css('visibility') != 'hidden';
        });
    }

    $.fn.colresize = function (options) {

        options = $.extend({
            customizable: false,
            minWidth: 10,
            defaultWidth: 70,
            useDefaultWidth: false,
            widths: []
        }, options);

        var $empty = $();

        // Обработка каждой таблицы в коллекции
        this.each(function (index, table) {
            if (getRow($(table)).length > 0) {
                setColumnsWidth(options, table);
                createGrips(options, table, options.customizable);
            } else {
                $empty = $empty.add(table);
            }
        });

        options.tables = this.not($empty);
    };

    function getRow($table) {
        /// <summary>Возвращает коллекцию ячеек таблицы, соответствующую первой строке</summary>
        /// <param name="table" type="Object">Таблица (объект jQuery)</param>
        /// <returns type="Object">Коллекция ячеек (объект jQuery)</returns>
        var $rows = getVisible($table.find(rowsSelector)),
            len = $rows.length;
        for (var i = 0; i < len; i++) {
            var $result = getVisible($($rows[i]).children(cellsSelector));
            if ($result.length > 0)
                return $result;
        }
        return $([]);
    }

    function removeGrips($table) {
        $table.prev(gripsContainerSelector).remove();
    }

    function createGrips(options, table, customizable) {
        /// <summary>Создать грипы для управления шириной с помощью мыши</summary>
        /// <param name="table" type="Object">Таблица (DOM-объект)</param>
        /// <returns type="Object">Созданный контейнер</returns>

        var $table = $(table);
        $table.addClass('colresize-table');
        removeGrips($table);
        if (customizable) {
            $table.on('mousemove.' + namespace, onTableMouseMove);
        }

        // Добавление контейнеров и грипов в него
        $table.before('<div class="colresize-grips-container"></div>');
        var $gripsContainer = $table.prev(gripsContainerSelector);
        $gripsContainer.data({
            'options': options,
            'table': table
        });

        // todo: 'colresize-ie-fake-grip' создаются в случае отключенного ресайза, так как без них
        // todo: глючит wolv в ie
        var gripsClass = customizable ? "colresize-grip" : "colresize-ie-fake-grip";
        var cells = getRow($table);
        cells.each(function (index, element) {
            $gripsContainer.append('<div class="' + gripsClass + '"></div>');
            if (customizable) {
                var grip = $($gripsContainer.children(gripsSelector)[index]);
                grip.on('mousedown.' + namespace, onGripMouseDown);
                grip.data('cell', $(element));
            }
        });
    }

    function getParentBlock($table) {
        /// <summary>Возвращает родительский блочный элемент для нахождения границ видимости</summary>
        /// <param name="$table" type="Object">Таблица (jQuery-объект)</param>
        /// <returns type="Object">Родитель (jQuery-объект)</returns>
        var $div = $table.parents('div:first');
        if ($div.length > 0) {
            return $div;
        }
        return $window;
    }

    function checkIfCellIsWithinBorders($cell, $block) {
        /// <summary>Проверяет, находится ли правая граница ячейки в области видимости</summary>
        /// <param name="$cell" type="Object">Ячейка (jQuery-объект)</param>
        /// <param name="$block" type="Object">Родительский элемент (jQuery)</param>
        /// <returns type="Boolean">true, если находится</returns>
        var cellWidth = $cell.outerWidth();
        var cellOffset = $cell.offset().left;
        var blockOffset = $block.offset().left;
        return (cellOffset + cellWidth >= blockOffset - 1 &&
            cellOffset + cellWidth <= blockOffset + $block.width() + 1);
    }

    function allocateGrips(table) {
        /// <summary>Расположить грипы согласно текущей ширине колонок таблицы</summary>
        /// <param name="table" type="Object">Таблица (DOM-объект)</param>
        var $table = $(table);
        var $cells = getRow($table);
        var $grips = $table.prev(gripsContainerSelector).children(gripsSelector);
        var $parentBlock = getParentBlock($table);
        var top = Math.max($table.offset().top, $parentBlock.offset().top);
        $cells.each(function (index, element) {
            var $grip = $($grips[index]);
            $grip.data('index', index);
            var $element = $(element);

            var left = $element.offset().left + $element.outerWidth();
            // Если элемент не виден, то отображать его не надо
            if (checkIfCellIsWithinBorders($element, $parentBlock)) {
                $grip.css('display', 'block');
            } else {
                left = 0;
                $grip.css('display', 'none');
            }
            $grip.offset({
                top: top,
                left: left - $grip.width() / 2
            });
        });
    }

    function adjustGripsHeight(table) {
        /// <summary>Настроить высоту грипов по высоте таблицы</summary>
        /// <param name="table" type="Object">Таблица (DOM-объект)</param>
        var $table = $(table);
        var height = Math.min($table.height(), getParentBlock($table).height());
        var $grips = $table.prev(gripsContainerSelector).children(gripsSelector);
        $grips.each(function (index, element) {
            $(element).height(height);
        });
    }

    function onGripMouseDown(e) {
        /// <summary>Обработчик зажатия левой кнопки мыши на грипе</summary>
        /// <param name="e" type="Object">Объект события</param>
        if (e.which != 1)
            return true;

        var $grip = $(e.target);
        var $container = $grip.closest(gripsContainerSelector);
        var options = $container.data('options');

        var $table = $($container.data('table'));
        $table.off('mousemove.' + namespace);
        clearTimeout($table.data('mouseMoveTimerId'));

        // Сохранение координат для вычисления смещения
        $head.data({
            'colresizeInitialMouseX': e.pageX,
            'colresizeInitialX': $grip.offset().left
        });

        options.tables.each(function (index, element) {
            syncGripsPosition(element);
        });
        // Поиск грипов, имеющих такой же индекс, в других таблицах, чтобы
        // их тоже перемещать
        var childIndex = $grip.data('index') + 1;
        var $draggedGrips = options.tables
                .prev(gripsContainerSelector)
                .children('.colresize-grip:nth-child(' + childIndex + ')');

        $head.data('colresizeDraggedGrips', $draggedGrips);

        // Установка левой границы перемещения грипа с учетом
        // минимальной ширины, отступов и толщины границ
        var $cell = $grip.data('cell');
        var leftBound = $cell.offset().left + options.minWidth + $cell.outerWidth() - $cell.width();
        $head.data('colresizeLeftBound', leftBound);

        $document
            .on('mousemove.' + namespace, onGripMouseMove)
            .on('mouseup.' + namespace, onGripMouseUp);

        $draggedGrips.addClass('colresize-dragged-grip');
        $head.append('<style id="colresizeCursorStyle" type="text/css">*{cursor:' +
            'col-resize' + '!important}</style>');

        // Чтобы отключить выделение текста во время перетаскивания
        return false;
    }

    function onGripMouseMove(e) {
        /// <summary>Обработчик перетаскивания грипа</summary>
        /// <param name="e" type="Object">Объект события</param>
        if (e.which != 1)
            return;

        var $grips = $head.data('colresizeDraggedGrips');
        var dX = e.pageX - $head.data('colresizeInitialMouseX');
        $grips.each(function (index, element) {
            var $grip = $(element);
            var oldOffset = $grip.offset();
            $grip.offset({
                top: oldOffset.top,
                left: Math.max($head.data('colresizeInitialX') + dX, $head.data('colresizeLeftBound'))
            });
        });
    }

    function onGripMouseUp(e) {
        /// <summary>Обработчик отпускания левой кнопки мыши после перетаскивания</summary>
        /// <param name="e" type="Object">Объект события</param>
        if (e.which != 1) {
            return;
        }

        var $grips = $head.data('colresizeDraggedGrips');
        $head.data('colresizeDraggedGrips', undefined);

        $grips.each(function (index, element) {
            $($(element).closest(gripsContainerSelector).data('table')).on('mousemove.' + namespace, onTableMouseMove);
        });

        $grips.removeClass('colresize-dragged-grip');
        $head.children('#colresizeCursorStyle').remove();

        $document
            .off('mousemove.' + namespace)
            .off('mouseup.' + namespace);

        var $cell = $grips.data('cell');
        var $container = $grips.closest(gripsContainerSelector);
        var options = $container.data('options');
        var colIndex = $grips.data('index');

        // Вычисление изменения ширины колонки (равно перемещению грипа)
        var dWidth = $grips.offset().left - $head.data('colresizeInitialX');

        var newWidth = $cell.width() + dWidth;

        options.widths[colIndex] = newWidth;

        // Установка новой ширины этой колонки в таблицах
        options.tables.each(function (index, t) {
            setColumnsWidth(options, t);
            allocateGrips(t);
            adjustGripsHeight(t);
        });

        // Если задана обратная связь для изменения размера колонок, то вызываем ее
        if (typeof options.onResize === 'function') {
            var eventArgs = {
                currentTarget: options.tables[0]
            };
            options.onResize(eventArgs);
        }
    }

    function syncGripsPosition(table) {
        allocateGrips(table);
        adjustGripsHeight(table);
    }

    function onTableMouseMove(e) {
        /// <summary>Установка позиции грипов</summary>
        var $table = $(e.currentTarget);
        $table.off('mousemove.' + namespace);
        syncGripsPosition(e.currentTarget);

        // Привязка события обработки движения мыши произойдет через 2 с,
        // так как часто обновлять позицию не имеет смысла, и при этом падает производительность
        $table.data('mouseMoveTimerId', setTimeout(function () {
            $table.on('mousemove.' + namespace, onTableMouseMove);
        }, 2000));
    }

    function setColumnsWidth(options, table) {
        /// <summary>Установить ширину колонок таблицы из настроек</summary>
        /// <param name="options" type="Object">Настройки</param>
        /// <param name="table" type="Object">Таблица (DOM-объект)</param>
        var $table = $(table);

        // Костыль для IE и Opera, для борьбы с некорректным изменением
        // ширины ячейки при содержании в ней div'а с width:inherit
        var $divs = $table.find('div:visible');
        var attrs = [];
        $divs.each(function (index, element) {
            attrs[index] = $(element).css('display');
        });
        $divs.css('display', 'none');

        var tableWidth = 0;

        var $row = getRow($table);
        $row.last().addClass('colresize-last-column');

        var len = $row.length;
        for (var i = 0; i < len; i++) {
            tableWidth += options.widths[i] + $($row[i]).outerWidth() - $($row[i]).width();
        }

        $table.width(tableWidth);

        $row.each(function (index, element) {
            var $cell = $(element);

            if (typeof options.widths[index] === 'undefined' || options.widths[index] === null) {
                options.widths[index] = options.useDefaultWidth ? options.defaultWidth : $cell.width();
            }

            if (index == $row.length - 1) {
                $cell.removeClass('colresize-last-column');
            }
            $cell.width(options.widths[index]);
        });

        $divs.each(function (index, element) {
            $(element).css('display', attrs[index]);
        });
    }

})(jQuery)