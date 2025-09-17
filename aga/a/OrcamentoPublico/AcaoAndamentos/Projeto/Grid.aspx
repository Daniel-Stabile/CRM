<%@ Page Title="Ação Andamentos dos projetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AESEMANDAMENTO" class="active"><a data-toggle="tab" href="#tabAESEMANDAMENTO">Ações em Andamento Projetos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R"><a data-toggle="tab" href="#tabR">Ações em Andamento Atividades</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R_1"><a data-toggle="tab" href="#tabR_1">Ações em Andamento Operação Especial</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabAESEMANDAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AESEMANDAMENTO" Title="Ações em Andamento Projetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACAOANDAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 1 AND (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcaoAndamentos/Projeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACAOANDAMENTOSPROJETO" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabR">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R" Title="Ações em Andamento Atividades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACAOANDAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 2 AND (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcaoAndamentos/Projeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACAOANDAMENTOSPROJETO" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabR_1">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R_1" Title="Ações em Andamento Operação Especial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACAOANDAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 3 AND (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcaoAndamentos/Projeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACAOANDAMENTOSPROJETO" Level="20" Order="30"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    