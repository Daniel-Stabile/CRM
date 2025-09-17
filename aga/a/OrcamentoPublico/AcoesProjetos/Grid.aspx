<%@ Page Title="Cadastramento de Ação do Projeto" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDOP_ACOESPROJETOS" class="active"><a data-toggle="tab" href="#tabGRIDOP_ACOESPROJETOS">Ações do Projeto</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AESATIVIDADE"><a data-toggle="tab" href="#tabAESATIVIDADE">Ações Atividade</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AESOPERAOESPECIAL"><a data-toggle="tab" href="#tabAESOPERAOESPECIAL">Ações Operação Especial</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabGRIDOP_ACOESPROJETOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="GRIDOP_ACOESPROJETOS" Title="Ações do Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CATEGORIA = 1 AND ( SELECT HANDLE FROM Z_GRUPOUSUARIOS U WHERE U.HANDLE = @USUARIO AND ( U.CENTROCUSTOREQUISICAO = A.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcoesProjetos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_GRID" Level="20" Order="100"  /></div>
      </div>
      <div class="tab-pane" id="tabAESATIVIDADE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AESATIVIDADE" Title="Ações Atividade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 2 AND ( SELECT HANDLE FROM Z_GRUPOUSUARIOS U WHERE U.HANDLE = @USUARIO AND ( U.CENTROCUSTOREQUISICAO = A.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcoesProjetos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_GRID" Level="20" Order="110"  /></div>
      </div>
      <div class="tab-pane" id="tabAESOPERAOESPECIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AESOPERAOESPECIAL" Title="Ações Operação Especial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 3 AND ( SELECT HANDLE FROM Z_GRUPOUSUARIOS U WHERE U.HANDLE = @USUARIO AND ( U.CENTROCUSTOREQUISICAO = A.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcoesProjetos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_GRID" Level="20" Order="120"  /></div>
      </div>
    </div>
  </div>
</div>
      
        <style>
            img {
    border-radius: 8px !important;
}

            </style>
      </asp:Content>
    