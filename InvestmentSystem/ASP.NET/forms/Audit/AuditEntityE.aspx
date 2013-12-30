﻿<%--flexberryautogenerated="true"--%>
<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="AuditEntityE.aspx.cs" Inherits="ICSSoft.STORMNET.Business.Audit.Objects.AuditEntityE" %>

<%-- Autogenerated section start [Register] --%>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<%-- Autogenerated section end [Register] --%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ics-form ics-form-edit">
        <h2 class="ics-form-header ics-form-header-edit">Данные записи аудита</h2>
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
  <asp:Label CssClass="descLbl" ID="ctrlObjectPrimaryKeyLabel" runat="server" Text="Идентификатор" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlObjectPrimaryKey" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlObjectPrimaryKeyValidator" runat="server" ControlToValidate="ctrlObjectPrimaryKey"
ErrorMessage="Не указано: ObjectPrimaryKey" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlObjectType_NameLabel" runat="server" Text="Тип объекта" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlObjectType_Name" runat="server" ReadOnly="true">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlObjectType_NameValidator" runat="server" ControlToValidate="ctrlObjectType_Name"
ErrorMessage="Не указано: ObjectType.Name" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlOperationTimeLabel" runat="server" Text="Время операции" EnableViewState="False">
</asp:Label>
<div class="descTxt">
    <ac:DatePicker ID="ctrlOperationTime" runat="server"/>
</div>
<asp:RequiredFieldValidator ID="ctrlOperationTimeValidator" runat="server" ControlToValidate="ctrlOperationTime"
ErrorMessage="Не указано: OperationTime" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlOperationTypeLabel" runat="server" Text="Тип операции" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlOperationType" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlOperationTypeValidator" runat="server" ControlToValidate="ctrlOperationType"
ErrorMessage="Не указано: OperationType" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlExecutionResultLabel" runat="server" Text="Результат" EnableViewState="False">
</asp:Label>
<asp:DropDownList ID="ctrlExecutionResult" CssClass="descTxt" runat="server">
	<asp:ListItem>Неизвестно</asp:ListItem>
<asp:ListItem>Не выполнено</asp:ListItem>
<asp:ListItem>Выполнено</asp:ListItem>
<asp:ListItem>Ошибка</asp:ListItem>

</asp:DropDownList>
<asp:RequiredFieldValidator ID="ctrlExecutionResultValidator" runat="server" ControlToValidate="ctrlExecutionResult"
ErrorMessage="Не указано: ExecutionResult" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlSourceLabel" runat="server" Text="Источник" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlSource" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlSourceValidator" runat="server" ControlToValidate="ctrlSource"
ErrorMessage="Не указано: Source" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlUser_NameLabel" runat="server" Text="Имя" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlUser_Name" runat="server" ReadOnly="true">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlUser_NameValidator" runat="server" ControlToValidate="ctrlUser_Name"
ErrorMessage="Не указано: User.Name" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlUser_LoginLabel" runat="server" Text="Логин" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlUser_Login" runat="server" ReadOnly="true">
</asp:TextBox>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlCreateTimeLabel" runat="server" Text="Создание" EnableViewState="False">
</asp:Label>
<div class="descTxt">
    <ac:DatePicker ID="ctrlCreateTime" runat="server"/>
</div>
</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlCreatorLabel" runat="server" Text="Создатель" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlCreator" runat="server">
</asp:TextBox>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlEditTimeLabel" runat="server" Text="Редактирование" EnableViewState="False">
</asp:Label>
<div class="descTxt">
    <ac:DatePicker ID="ctrlEditTime" runat="server"/>
</div>
</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlEditorLabel" runat="server" Text="Редактор" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlEditor" runat="server">
</asp:TextBox>

</div>
<asp:ScriptManager ID="ScriptManager1" runat="server" >
</asp:ScriptManager>

<div style="clear: left">
	<ac:HierarchicalListView ID="ctrlAuditFields" runat="server"/>
</div>
<br/>

</div>
<!-- autogenerated end -->
            <%-- Autogenerated section end [Controls] --%>
        </div>
    </div>
</asp:Content>
