﻿<%--flexberryautogenerated="true"--%>
<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="ReportDocumentE.aspx.cs" Inherits="IIS.Flexberry.Reports.Forms.ReportDocumentE" %>

<%-- Autogenerated section start [Register] --%>

<%-- Autogenerated section end [Register] --%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ics-form ics-form-edit">
        <h2 class="ics-form-header ics-form-header-edit">Документ отчёта</h2>
        <div class="ics-form-toolbar ics-form-toolbar-edit ics-sticky">
            <asp:ImageButton ID="SaveBtn" runat="server" SkinID="SaveBtn" OnClick="SaveBtn_Click" AlternateText="<%$ Resources: Resource, Save %>" ValidationGroup="savedoc" />
            <asp:ImageButton ID="SaveAndCloseBtn" runat="server" SkinID="SaveAndCloseBtn" OnClick="SaveAndCloseBtn_Click" AlternateText="<%$ Resources: Resource, Save_Close %>" ValidationGroup="savedoc" />
            <asp:ImageButton ID="CancelBtn" runat="server" SkinID="CancelBtn" OnClick="CancelBtn_Click" AlternateText="<%$ Resources: Resource, Cancel %>" />
        </div>
        <div class="ics-form-controls ics-form-controls-edit">
            <%-- Autogenerated section start [Controls] --%>
<!-- autogenerated start -->
<div>
	<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlTypeLabel" runat="server" Text="Тип отчёта" EnableViewState="False">
</asp:Label>
<ac:MasterEditorAjaxLookUp ID="ctrlType" CssClass="descTxt" runat="server" ShowInThickBox="True" Autocomplete="true" />

<asp:RequiredFieldValidator ID="ctrlTypeValidator" runat="server" ControlToValidate="ctrlType"
ErrorMessage="Не указано: Type" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlNameLabel" runat="server" Text="Название" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlName" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlNameValidator" runat="server" ControlToValidate="ctrlName"
ErrorMessage="Не указано: Name" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlOwnerLabel" runat="server" Text="Владелец" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlOwner" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlOwnerValidator" runat="server" ControlToValidate="ctrlOwner"
ErrorMessage="Не указано: Owner" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlDescriptionLabel" runat="server" Text="Описание" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlDescription" runat="server">
</asp:TextBox>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlIsSharedLabel" runat="server" Text="Общий" EnableViewState="False">
</asp:Label>
<asp:CheckBox ID="ctrlIsShared" CssClass="descTxt" runat="server" Text=""/>
</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlContentStorageLabel" runat="server" Text="Тип хранения" EnableViewState="False">
</asp:Label>
<asp:DropDownList ID="ctrlContentStorage" CssClass="descTxt" runat="server">
	<asp:ListItem>База данных</asp:ListItem>
<asp:ListItem>Файловая система</asp:ListItem>

</asp:DropDownList>
<asp:RequiredFieldValidator ID="ctrlContentStorageValidator" runat="server" ControlToValidate="ctrlContentStorage"
ErrorMessage="Не указано: ContentStorage" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlContentPathLabel" runat="server" Text="Путь к отчёту" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlContentPath" runat="server">
</asp:TextBox>

</div>

</div>
<!-- autogenerated end -->
            <%-- Autogenerated section end [Controls] --%>
        </div>
    </div>
</asp:Content>

