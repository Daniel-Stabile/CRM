<%@ Page Title="Planejamento Estratégico" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PLANEJAMENTOESTRATGICO" class="active"><a data-toggle="tab" href="#tabPLANEJAMENTOESTRATGICO">Planejamento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CICLOS"><a data-toggle="tab" href="#tabCICLOS">Ciclos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PERSPECTIVAS"><a data-toggle="tab" href="#tabPERSPECTIVAS">Perspectivas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ATRIBUTOS"><a data-toggle="tab" href="#tabATRIBUTOS">Atributos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabPLANEJAMENTOESTRATGICO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PLANEJAMENTOESTRATGICO" Title="Planejamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOSESTRATEGICOS.CADASTRO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOSESTRATEGICOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabCICLOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CICLOS" Title="Ciclos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PLANEJAMENTOESTRATGICO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOCICLOS.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTOESTRATEGICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/PlanejamentoCiclos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOSESTRATEGICOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPERSPECTIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PERSPECTIVAS" Title="Perspectivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PLANEJAMENTOESTRATGICO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOPERSPECTIVAS.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTOESTRATEGICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/PlanejamentoPerspectivas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOSESTRATEGICOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabATRIBUTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ATRIBUTOS" Title="Atributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PLANEJAMENTOESTRATGICO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOATRIBUTOS.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTOESTRATEGICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/PlanejamentoAtributos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOSESTRATEGICOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PLANEJAMENTOESTRATGICO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOANEXOS.PLANEJAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANEJAMENTOESTRATEGICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Anexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GESTAOPROJETOS_MAPAESTRATEGICO_PLANEJAMENTOSESTRATEGICOS_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    