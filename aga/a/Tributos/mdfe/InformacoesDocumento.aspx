<%@ Page Title="Informações do documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESDODOCUMENTO" Title="Informações do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEINFORMACAODOCUMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_MDFE_INFORMACOESDOCUMENTO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRODUTOSPERIGOSOS" class="active"><a data-toggle="tab" href="#tabPRODUTOSPERIGOSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos perigosos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="UNIDADESDETRANSPORTE"><a data-toggle="tab" href="#tabUNIDADESDETRANSPORTE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Unidades de transporte")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPRODUTOSPERIGOSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRODUTOSPERIGOSOS" Title="Produtos perigosos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESDODOCUMENTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEPRODUTOPERIGOSO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAODOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/ProdutosPerigosos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFE_INFORMACOESDOCUMENTO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabUNIDADESDETRANSPORTE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="UNIDADESDETRANSPORTE" Title="Unidades de transporte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESDODOCUMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_MDFEUNIDADETRANSPORTE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INFORMACAODOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/mdfe/UnidadesTransporte.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_MDFE_INFORMACOESDOCUMENTO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    