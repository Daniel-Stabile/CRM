<%@ Page Title="Ponto de Controle" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Indicadores" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="PONTODECONTROLE" Title="Ponto de Controle" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_INDICADORPONTOSCONTROLE.INDICADORES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_INDICADORES_INDICADORPONTOCONTROLE" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS" class="active"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PONTODECONTROLE" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOANEXOS.INDICADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADORPONTOCONTROLE = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Anexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GESTAOPROJETOS_MAPAESTRATEGICO_INDICADORES_INDICADORPONTOCONTROLE" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $(() => {
 ocultarPainelComandosInferior();
});


const ocultarPainelComandosInferior = () => Benner.Page.PONTODECONTROLE.hideFooterCommandsBar();

            </script>
      </asp:Content>
    