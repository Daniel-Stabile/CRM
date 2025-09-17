<%@ Page Title="Ajuste manual de marcadores" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.e.AjusteMarcadores.AjusteManualMarcadores" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row"><div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AJUSTEMANUALDEMARCADORES" class="active"><a data-toggle="tab" href="#tabAJUSTEMANUALDEMARCADORES"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ajuste manual de marcadores")%></span></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONJUNTOSPARTES"><a data-toggle="tab" href="#tabCONJUNTOSPARTES"><i style="margin-right: 5px" class=""></i><span><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Conjuntos/Partes")%></span></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabAJUSTEMANUALDEMARCADORES">
                        <div class="row">
    <wes:SimpleGrid runat="server" ID="AJUSTEMANUALDEMARCADORES" Title="Ajuste manual de marcadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_VEICULODESGASTES.AJUSTEMANUALMARCADORES.GRID" DefaultFilterName="Filtro Ajuste Manual de Marcadores" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_AJUSTE_MANUAL_MARCADORES" Level="20" Order="10"  /></div>
          <div class="row">
            <div class="tabbable-line">
              <ul class="nav nav-tabs"></ul>
              <div class="tab-content"> <div class="row">
    <wes:AjaxForm runat="server" ID="EDITARAJUSTEMANUALDEMARCADORES" Title="Editar ajuste manual de marcadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AJUSTEMANUALDEMARCADORES" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="MF_VEICULODESGASTES.AJUSTESMANUALMARCADORES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_AJUSTE_MANUAL_MARCADORES" Level="20" Order="40"  /></div>
          <div class="row">
            <div class="tabbable-line">
              <ul class="nav nav-tabs"></ul>
              <div class="tab-content"></div>
            </div>
          </div></div>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tabCONJUNTOSPARTES">
                        <div class="row">
    <wes:AjaxForm runat="server" ID="CONJUNTOSPARTES" Title="Conjuntos/Partes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AJUSTEMANUALDEMARCADORES" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="MF_VT_CONJUNTOSPARTES.CONJUNTOSPARTES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_AJUSTE_MANUAL_MARCADORES" Level="20" Order="30"  /></div>
          <div class="row">
            <div class="tabbable-line">
              <ul class="nav nav-tabs"></ul>
              <div class="tab-content"></div>
            </div>
          </div>
        </div>      
      </div>
    </div>
  </div>
        </div></div>
      </asp:Content>
    