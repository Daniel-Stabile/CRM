<%@ Page Title="Balanço Patrimonial" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="BALANOPATRIMONIAL_1" Title="BP - Balanço patrimonial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_DEMONSTRACOES.BP.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.DEMONSTRATIVO=1" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_BALANCO_PATRIMONIAL" Level="20" Order="30"  />
        <wes:ActionView runat="server" ID="BALANOPATRIMONIAL" Title="DEMONSTRATIVO BALANÇO PATRIMONIAL" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="fa fa-table" ShowTitle="false" ProviderWidgetUniqueId="BALANOPATRIMONIAL_1" ChromeState="Normal" Controller="DemonstracoesContabil" Action="BalancoPatrimonial" PageId="AGA_A_CONTABIL_BALANCO_PATRIMONIAL" Level="20" Order="40"  />
        </div>
    
      </asp:Content>
    