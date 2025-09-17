<%@ Page Title="Itens do fornecedor" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ITEMDOFORNECEDOR" Title="Item do fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VARIACAOFORNECEDORES.ITEMDOFORNECEDOR.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_FORNECEDORES_ITENSDOFORNECEDOR" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MARGEMDELUCRO" class="active"><a data-toggle="tab" href="#tabMARGEMDELUCRO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMBALAGENS"><a data-toggle="tab" href="#tabEMBALAGENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Embalagens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OUTROSCDIGOSNOFORNECEDOR"><a data-toggle="tab" href="#tabOUTROSCDIGOSNOFORNECEDOR"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Outros códigos no fornecedor")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabMARGEMDELUCRO">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="MARGEMDELUCRO" Title="Margem de lucro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMDOFORNECEDOR" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_MARGEMDELUCRO.MARGENSDELUCRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOFORNECEDOR = @CAMPO(HANDLE)" PageId="AGA_A_GENERICOS_FORNECEDORES_ITENSDOFORNECEDOR" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabEMBALAGENS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="EMBALAGENS" Title="Embalagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMDOFORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VARIACAOFORNECEDOREMBALAGEM.EMBALAGENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOFORNECEDOR = @CAMPO(HANDLE) AND A.FORNECEDOR = @CAMPO(FORNECEDOR)" PageId="AGA_A_GENERICOS_FORNECEDORES_ITENSDOFORNECEDOR" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabOUTROSCDIGOSNOFORNECEDOR">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OUTROSCDIGOSNOFORNECEDOR" Title="Outros códigos no fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMDOFORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VARIACAOFORNECEDORESCODIGOS.CODIGOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOFORNECEDOR = @CAMPO(HANDLE)" PageId="AGA_A_GENERICOS_FORNECEDORES_ITENSDOFORNECEDOR" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    