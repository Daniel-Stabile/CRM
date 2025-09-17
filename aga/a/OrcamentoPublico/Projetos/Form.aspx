<%@ Page Title="Cadastramento de projetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMOP_PROJETOS" class="active"><a data-toggle="tab" href="#tabFORMOP_PROJETOS">Projeto</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AES"><a data-toggle="tab" href="#tabAES">Ações Orçamentárias</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEISPELAUNIDADE"><a data-toggle="tab" href="#tabRESPONSVEISPELAUNIDADE">Responsáveis pela Unidade</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabFORMOP_PROJETOS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMOP_PROJETOS" Title="Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PROJETOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_PROJETOS_FORM" Level="20" Order="100"  /></div>
      </div>
      <div class="tab-pane" id="tabAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AES" Title="Ações Orçamentárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_PROJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE) AND A.CATEGORIA = @CAMPO(CATEGORIA)" FormUrl="~/aga/a/OrcamentoPublico/AcoesProjetos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_PROJETOS_FORM" Level="20" Order="110"  /></div>
      </div>
      <div class="tab-pane" id="tabRESPONSVEISPELAUNIDADE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEISPELAUNIDADE" Title="Responsáveis pela Unidade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-users" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_PROJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_RESPONSAVEISUNIDADE.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ResponsaveisUnidade/ProjetoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_PROJETOS_FORM" Level="20" Order="120"  /></div>
      </div>
      <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_PROJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ANEXOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/Anexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_PROJETOS_FORM" Level="20" Order="130"  /></div>
      </div>
    </div>
  </div>
</div>
      
        <script type="text/javascript">
              const projectTitle = document.querySelector("#ctl00_Main_FORMOP_PROJETOS_PageControl_GERAL_GERAL_NOME").value;
const projectType = parseInt(document.querySelector("#ctl00_Main_FORMOP_PROJETOS_PageControl_GERAL_GERAL_CATEGORIA").getAttribute("key"));
const types = ["Projeto / Atividade / Operação","Projeto","Atividade","Operação Especial"];
document.querySelector(".nav-tabs:first-child li:first-child a").innerText = projectTitle + ` (${types[projectType]})`;

            </script>
        <style>
            img {
    border-radius: 8px !important;
}

            </style>
      </asp:Content>
    