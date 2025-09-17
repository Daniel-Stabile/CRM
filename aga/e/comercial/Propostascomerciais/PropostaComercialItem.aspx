<%@ Page Title="Itens da proposta" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITEMPROPOSTA" class="active"><a data-toggle="tab" href="#tabITEMPROPOSTA">Itens da proposta</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="COMISSOES"><a data-toggle="tab" href="#tabCOMISSOES">Comissões</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="APONTAMENTOS"><a data-toggle="tab" href="#tabAPONTAMENTOS">Faixas de itens de apontamento</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabITEMPROPOSTA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ITEMPROPOSTA" Title="Itens da proposta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_CM_CONTRATOITENS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIALITEM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabCOMISSOES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="COMISSOES" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMPROPOSTA" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOITEMCOMISSOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2041_at2373_hsb8767d0f.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIALITEM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabAPONTAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="APONTAMENTOS" Title="Faixas de itens de apontamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEMPROPOSTA" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOITEMFAIXAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2042_at2374_hsbd39c989.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIALITEM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    