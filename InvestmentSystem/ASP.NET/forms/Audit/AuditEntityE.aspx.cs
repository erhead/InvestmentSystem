﻿/*flexberryautogenerated="true"*/
namespace ICSSoft.STORMNET.Business.Audit.Objects
{
    using System.Linq;

    using ICSSoft.STORMNET;
    using ICSSoft.STORMNET.Web.Controls;

    /// <summary>
    /// Формы для детального просмотра данных по аудируемой операции
    /// </summary>
    public partial class AuditEntityE : BaseEditForm<AuditEntity>
    {
        /// <summary>
        /// Конструктор формы
        /// </summary>
        public AuditEntityE()
            : base("AuditEntityE", GetConnectionStringName())
        {
        }

        /// <summary>
        /// Получение имени строки подключения, откуда данные будут получаться
        /// </summary>
        /// <returns>
        /// Имя строки подключения
        /// </returns>
        private static string GetConnectionStringName()
        {
            return AuditService.Current.AuditConnectionStringName;
        }

        /// <summary>
        /// Путь до формы.
        /// </summary>
        public static string FormPath
        {
            get { return "~/forms/Audit/AuditEntityE.aspx"; }
        }

        /// <summary>
        /// Вызывается самым первым в Page_Load
        /// </summary>
        protected override void Preload()
        {
            ReadOnly = true;
        }

        /// <summary>
        /// Здесь лучше всего писать бизнес-логику, оперируя только объектом данных
        /// </summary>
        protected override void PreApplyToControls()
        {
        }

        /// <summary>
        /// Здесь лучше всего изменять свойства контролов на странице, которые не обрабатываются WebBinder
        /// </summary>
        protected override void PostApplyToControls()
        {
            if (ReadOnly)
            {
                SaveAndCloseBtn.Visible = false;
                SaveBtn.Visible = false;
                wb.SetReadOnlyForm(this.Controls, View, true);
            }

            string backURL = Request["ReturnUrl"];
            if (string.IsNullOrEmpty(backURL))
            {
                SaveAndCloseBtn.Visible = false;
                CancelBtn.Visible = false;
            }

            Page.Validate();
        }

        /// <summary>
        /// Вызывается самым последним в Page_Load
        /// </summary>
        protected override void Postload()
        {
            if (DataObject != null)
            {
                var showList = AuditService.Current.ShowPrimaryKey
                    ? DataObject.AuditFields.Cast<DataObject>().ToList()
                    : DataObject.AuditFields.Cast<AuditField>().Where(x => x.MainChange == null).Cast<DataObject>().ToList();
                
                ctrlAuditFields.InitControl(
                    showList,
                    AuditField.Views.AuditFieldE,
                    Information.ExtractPropertyPath<AuditField>(x => x.MainChange));
            }
        }

        /// <summary>
        /// Валидация объекта для сохранения
        /// </summary>
        /// <returns>true - продолжать сохранение, иначе - прекратить</returns>
        protected override bool PreSaveObject()
        {
            return base.PreSaveObject();
        }

        /// <summary>
        /// Нетривиальная логика сохранения объекта
        /// </summary>
        /// <returns>Объект данных, который сохранился</returns>
        protected override DataObject SaveObject()
        {
            return base.SaveObject();
        }
    }
}