<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RateProject.aspx.cs" Inherits="IIS.InvestmentSystem.forms.Proekt.RateProject" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ics-form ics-form-edit">
        <h2 class="ics-form-header ics-form-header-edit">Оценка проекта</h2>
        <div>
	        <div class="clearfix">
                <asp:Label style="font-size: 20px;" ID="ctrlНазвание" runat="server" />
            </div>
            <div class="clearfix">
                <asp:Label style="font-size: 20px;" ID="ctrlNPV" runat="server" />
            </div>
            <div class="clearfix">
                <asp:Label style="font-size: 20px;" ID="ctrlIRR" runat="server" />
            </div>
            <div class="clearfix">
                <asp:Label style="font-size: 20px;" ID="ctrlPI" runat="server" />
            </div>
            <div class="clearfix">
                <asp:Button runat="server" ID="AcceptButton" Text="Принять" OnClick="AcceptButton_Click"/>
                <asp:Button runat="server" ID="DeclineButton" Text="Отклонить" OnClick="DeclineButton_Click"/>
            </div>
        </div>
        <br />
    </div>
</asp:Content>

