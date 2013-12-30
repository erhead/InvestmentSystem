﻿$(document).ready(function () {
    //привязываем календарь
    $('.datepicker:enabled').datepicker({ changeMonth: true, changeYear: true });
    //привязываем фильтр вводимых значений (календарь сам не ограничивает ввод)
    $(".datepicker").mask("99.99.9999");
    $(".datepicker_readonly").mask("99.99.9999");
    $('.datepicker').keypress(function () {
        $('.datepicker').datepicker('hide');
    });

    var textareas = $('textarea[class*="maxlength-"]');
    $.each(textareas, function (i, textarea) {
        var classList = $(textarea).attr('class').split(/\s+/);
        $.each(classList, function (index, item) {
            if (item.indexOf('maxlength-') == 0) {
                var l = item.toString().substring('maxlength-'.length, item.length);

                // Можно включить отображение количества символов и всякие красивости
                // но это правится на конкретном прикладном проекте
                $(textarea).maxlength({ maxCharacters: l, status: false, events: ['change'] });
            }
        });
    });

    $(".info_area").each(function (index, info_area) {
        var elCollapsable = $(".collapsable", $(info_area));
        var elExpandCollapseButton = $(".expand_btn, .collapse_btn", $(info_area));

        var expanded = $(info_area).hasClass("expanded");

        if (expanded) {
            Expand2CollapseBtnAndViceVersa(elExpandCollapseButton);
        }
        else {
            elCollapsable.hide();
        }

        elExpandCollapseButton.click(function () {
            Expand2CollapseBtnAndViceVersa($(this));
            elCollapsable.slideToggle("fast");

            return false;
        });
    });
});

function ShowHideNavigate() {
    'use strict';
    var treeView = $('.page-form').hasClass('treeview-visible');
    if (treeView) {
        $('.page-form').removeClass('treeview-visible');
        $('.page-form').addClass('treeview-hidden');
        $('#treeviewHideSpan').addClass('Hide');
        $('#treeviewShowSpan').removeClass('Hide');

        $.cookie('treeView', '0', { path: '/' });
        $('.v_border').addClass('Hide');
    } else {
        $('.page-form').addClass('treeview-visible');
        $('.page-form').removeClass('treeview-hidden');
        $('#treeviewHideSpan').removeClass('Hide');
        $('#treeviewShowSpan').addClass('Hide');

        $('#masterPageContentBlock').addClass('treeview-visible');
        $.cookie('treeView', '1', { path: '/' });
        $('.v_border').removeClass('Hide');
    }

    $(window).trigger('scroll');
}

/**
 * Блокировка Ajax лукапа.
 * 
 * @deprecated Следует использовтаь jQuery.icsMasterEditorAjaxLookup('block')
 */
function BlockAjaxLookUp(nameValueControl) {
    $.ics.console.error('Method BlockAjaxLookUp is obsolete! Use jquery.icsMasterEditorAjaxLookup instead.');
    $('#' + nameValueControl).icsMasterEditorAjaxLookup('block');
}

/**
 * Разблокировка Ajax лукапа.
 *
 * @deprecated Следует использовтаь jQuery.icsMasterEditorAjaxLookup('unblock')
 */
function UnBlockAjaxLookUp(nameValueControl) {
    $.ics.console.error('Method UnBlockAjaxLookUp is obsolete! Use jquery.icsMasterEditorAjaxLookup instead.');
    $('#' + nameValueControl).icsMasterEditorAjaxLookup('unblock');
}