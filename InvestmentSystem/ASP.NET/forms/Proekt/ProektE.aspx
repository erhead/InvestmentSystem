﻿<%--flexberryautogenerated="true"--%>
<%@ Page Language="C#" MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="ProektE.aspx.cs" Inherits="IIS.InvestmentSystem.ПроектE" %>

<%-- Autogenerated section start [Register] --%>

<%-- Autogenerated section end [Register] --%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ics-form ics-form-edit">
        <h2 class="ics-form-header ics-form-header-edit">Проект</h2>
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
  <asp:Label CssClass="descLbl" ID="ctrlНазваниеLabel" runat="server" Text="Название" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlНазвание" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlНазваниеValidator" runat="server" ControlToValidate="ctrlНазвание"
ErrorMessage="Не указано: Название" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlДатаНачалаLabel" runat="server" Text="Дата начала" EnableViewState="False">
</asp:Label>
<div class="descTxt">
    <ac:DatePicker ID="ctrlДатаНачала" runat="server"/>
</div>
<asp:RequiredFieldValidator ID="ctrlДатаНачалаValidator" runat="server" ControlToValidate="ctrlДатаНачала"
ErrorMessage="Не указано: ДатаНачала" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlДатаОкончанияLabel" runat="server" Text="Дата окончания" EnableViewState="False">
</asp:Label>
<div class="descTxt">
    <ac:DatePicker ID="ctrlДатаОкончания" runat="server"/>
</div>
<asp:RequiredFieldValidator ID="ctrlДатаОкончанияValidator" runat="server" ControlToValidate="ctrlДатаОкончания"
ErrorMessage="Не указано: ДатаОкончания" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>

<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlНачальнаяИнвестицияLabel" runat="server" Text="Начальная инвестиция" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlНачальнаяИнвестиция" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlНачальнаяИнвестицияValidator" runat="server" ControlToValidate="ctrlНачальнаяИнвестиция"
ErrorMessage="Не указано: НачальнаяИнвестиция" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>

<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlСтатусLabel" runat="server" Text="Статус" EnableViewState="False">
</asp:Label>
<asp:DropDownList ID="ctrlСтатус" CssClass="descTxt" runat="server">
	<asp:ListItem>Новый</asp:ListItem>
<asp:ListItem>Принят</asp:ListItem>
<asp:ListItem>Отклонен</asp:ListItem>

</asp:DropDownList>
</div>
<div class="clearfix">
  <asp:Label CssClass="descLbl" ID="ctrlСтавкаДисконтированияLabel" runat="server" Text="Ставка дисконтирования (%)" EnableViewState="False">
</asp:Label>
<asp:TextBox CssClass="descTxt" ID="ctrlСтавкаДисконтирования" runat="server">
</asp:TextBox>

<asp:RequiredFieldValidator ID="ctrlСтавкаДисконтированияValidator" runat="server" ControlToValidate="ctrlСтавкаДисконтирования"
ErrorMessage="Не указано: СтавкаДисконтирования" EnableClientScript="true" ValidationGroup="savedoc">*</asp:RequiredFieldValidator>

</div>
<asp:ScriptManager ID="ScriptManager1" runat="server" >
</asp:ScriptManager>

<div style="clear: left">
	<ac:AjaxGroupEdit ID="ctrlЭлементДенежногоПотока" runat="server" ReadOnly="false" />
</div>
<br/>

</div>
<!-- autogenerated end -->
            <%-- Autogenerated section end [Controls] --%>
        </div>
    </div>
</asp:Content>
