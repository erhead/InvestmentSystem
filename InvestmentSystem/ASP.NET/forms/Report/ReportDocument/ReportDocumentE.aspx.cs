﻿/*flexberryautogenerated="true"*/
namespace IIS.Flexberry.Reports.Forms
{
    using ICSSoft.STORMNET;
    using ICSSoft.STORMNET.FunctionalLanguage;
    using ICSSoft.STORMNET.Web.Controls;
    using ICSSoft.STORMNET.Windows.Forms;

    using IIS.Flexberry.Reports.Core.Objects;

    public partial class ReportDocumentE : BaseEditForm<ReportDocument>
    {
        /// <summary>
        /// Конструктор формы
        /// </summary>
        public ReportDocumentE()
            : base("ReportDocumentE")
        { 
        }

        /// <summary>
        /// Путь до формы.
        /// </summary>
        public static string FormPath
        {
            get { return "~/forms/Report/ReportDocument/ReportDocumentE.aspx"; }
        }

        /// <summary>
        /// Вызывается самым первым в Page_Load
        /// </summary>
        protected override void Preload()
        {
            var langDef = ExternalLangDef.LanguageDef;
            Function onlyTemplatesLimit = langDef.GetFunction(
                langDef.funcEQ,
                new VariableDef(langDef.StringType, "ElementType"),
                EnumCaption.GetCaptionFor(ReportElementType.ReportDocument));
            ctrlType.LimitFunction = onlyTemplatesLimit;
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