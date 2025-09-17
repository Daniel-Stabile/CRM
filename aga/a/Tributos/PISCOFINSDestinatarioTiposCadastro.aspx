<%@ Page Title="Configurações PIS/COFINS - Por destinatário - Tipos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="CATEGORIA" Title="Configurações PIS/COFINS - Por destinatário - Tipos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCCONFIGURACAOCATEGORIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="A_TRIBUTOS_PISCOFINSDESTINATARIO_TIPOS_CADASTRO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRODUTOSNCM" class="active"><a data-toggle="tab" href="#tabPRODUTOSNCM"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos - NCM")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLIENTES"><a data-toggle="tab" href="#tabCLIENTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Clientes")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPRODUTOSNCM">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRODUTOSNCM" Title="Produtos - NCM" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATEGORIA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCCONFIGURACAONCM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CATEGORIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/PISCOFINSDestinatarioNCM.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="A_TRIBUTOS_PISCOFINSDESTINATARIO_TIPOS_CADASTRO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCLIENTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLIENTES" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATEGORIA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCCONFIGURACAOCLIENTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CATEGORIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/tributos/PISCOFINSDestinatarioClientes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="A_TRIBUTOS_PISCOFINSDESTINATARIO_TIPOS_CADASTRO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    