<%@ Page Title="Cálculos de depreciação do bem" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="BEM" Title="Bem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AT_ITENS.COMPACTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="CALCULOS_DEPRECIACAO_BENS" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLCULOS" class="active"><a data-toggle="tab" href="#tabCLCULOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cálculos Societário")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CALCULOSFISCAIS"><a data-toggle="tab" href="#tabCALCULOSFISCAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cálculos Fiscais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RATEIODEPRECIAO"><a data-toggle="tab" href="#tabRATEIODEPRECIAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Rateio depreciação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MLTIPLOSCRITRIOSDECLCULO"><a data-toggle="tab" href="#tabMLTIPLOSCRITRIOSDECLCULO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Múltiplos critérios de cálculo")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCLCULOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLCULOS" Title="Cálculos Societário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMCALCULOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE)) AND A.CRITERIOCALCULO = (SELECT CRITERIOCALCULOPADRAO FROM AT_PARAMETROS WHERE EMPRESA = @EMPRESA)" FormUrl="~/aga/a/f/aga_t1292_at6465_hs7aae37cc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CALCULOS_DEPRECIACAO_BENS" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCALCULOSFISCAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CALCULOSFISCAIS" Title="Cálculos Fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMCALCULOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE)) AND A.CRITERIOCALCULO = (SELECT CRITERIOCALCULOFISCAL FROM AT_PARAMETROS WHERE EMPRESA = @EMPRESA)" FormUrl="~/aga/a/f/aga_t1292_at6465_hs7aae37cc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CALCULOS_DEPRECIACAO_BENS" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabRATEIODEPRECIAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RATEIODEPRECIAO" Title="Rateio depreciação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_ITEMRATEIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1779_at6467_hs2d97172a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CALCULOS_DEPRECIACAO_BENS" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabMLTIPLOSCRITRIOSDECLCULO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MLTIPLOSCRITRIOSDECLCULO" Title="Múltiplos critérios de cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_ITEMCRITERIOSCALCULO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3943_at6468_hs2d3d7747.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CALCULOS_DEPRECIACAO_BENS" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    