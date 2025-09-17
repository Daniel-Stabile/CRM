<%@ Page Title="Ordem de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Suprimentos.RessuprimentosPage, Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">

        <wes:AjaxForm
            runat="server"
            ID="Filtro"
            Title="Filtro"
            Subtitle=""
            DisplayCommandExecutedDefaultMessage="false"
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="12"
            FontIcon=""
            ShowTitle="false"
            ProviderWidgetUniqueId=""
            ChromeState="Normal"
            CanDelete="True"
            CanUpdate="True"
            CanInsert="True"
            EntityViewName="CP_VTFILTRORESSUPRIMENTOS.FORM"
            FormMode="None"
            IncludeRecordInRecentItems="True"
            UserDefinedCommandsVisible="True"
            PageWidgetHandle="22699"
            Level="20"
            Order="10" />


        <wes:SimpleGrid runat="server" ID="Ressuprimentos" Title="Ressuprimento" BootstrapCols="12" ChromeState="Fixed"  UserDefinedDisableRowSelection="true" UserDefinedPageSize="10000" CanView="false" UserDefinedSelectColumnVisible="true" />
        </div>
    
      </asp:Content>
      