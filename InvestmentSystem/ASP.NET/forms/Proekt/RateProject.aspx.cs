using ICSSoft.STORMNET.Web.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IIS.InvestmentSystem.forms.Proekt
{
    public partial class RateProject : System.Web.UI.Page
    {
        private Проект project;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var pk = Guid.Parse(Request["id"]);
                project = new Проект();
                project.SetExistObjectPrimaryKey(pk);
                BridgeToDS.GetDataService().LoadObject(Проект.Views.ПроектE, project);

                ctrlНазвание.Text = string.Format("Название проекта: {0}", project.Название);
                var indexes = Utils.GetIndexes(project);
                ctrlNPV.Text = string.Format("NPV = {0}", indexes[0]);
                ctrlIRR.Text = string.Format("IRR = {0}", indexes[1]);
                ctrlPI.Text = string.Format("PI = {0}", indexes[2]);
            }
            catch
            {

            }
        }

        protected void AcceptButton_Click(object sender, EventArgs e)
        {
            project.Статус = СтатусПроекта.Принят;
            BridgeToDS.GetDataService().UpdateObject(project);
            Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }

        protected void DeclineButton_Click(object sender, EventArgs e)
        {
            project.Статус = СтатусПроекта.Отклонен;
            BridgeToDS.GetDataService().UpdateObject(project);
            Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }
    }
}