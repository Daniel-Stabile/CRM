<%@ Page Title="Totalizadores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R5001INFORMAESDASBASESEDOSTRIBUTOSCONSOLIDADOSPORCONTRIBUINTE" class="active"><a data-toggle="tab" href="#tabR5001INFORMAESDASBASESEDOSTRIBUTOSCONSOLIDADOSPORCONTRIBUINTE">R-5001 - Informações das bases e dos tributos consolidados por contribuinte</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO"><a data-toggle="tab" href="#tabR5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO">R-5011 - Informações de bases e tributos consolidadas por período de apuração</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R9001BASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA"><a data-toggle="tab" href="#tabR9001BASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA">R-9001 - Bases e tributos - contribuição previdenciária</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA"><a data-toggle="tab" href="#tabR9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA">R-9011 - Consolidação de bases e tributos - Contribuição previdenciária</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R9005BASESETRIBUTOSRETENESNAFONTE"><a data-toggle="tab" href="#tabR9005BASESETRIBUTOSRETENESNAFONTE">R-9005 - Bases e tributos - retenções na fonte</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="R9015CONSOLIDAODASRETENESNAFONTE"><a data-toggle="tab" href="#tabR9015CONSOLIDAODASRETENESNAFONTE">R-9015 - Consolidação das retenções na fonte</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabR5001INFORMAESDASBASESEDOSTRIBUTOSCONSOLIDADOSPORCONTRIBUINTE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R5001INFORMAESDASBASESEDOSTRIBUTOSCONSOLIDADOSPORCONTRIBUINTE" Title="R-5001 - Informações das bases e dos tributos consolidados por contribuinte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R5001.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Registros/Cadastro/R5001.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_TOTALIZADORES" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabR5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO" Title="R-5011 - Informações de bases e tributos consolidadas por período de apuração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R5011.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Registros/Cadastro/R5011.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_TOTALIZADORES" Level="20" Order="60"  /></div>
      </div>
      <div class="tab-pane" id="tabR9001BASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R9001BASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA" Title="R-9001 - Bases e tributos - contribuição previdenciária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9001.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Registros/Cadastro/R9001.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_TOTALIZADORES" Level="20" Order="70"  /></div>
      </div>
      <div class="tab-pane" id="tabR9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R9011CONSOLIDAODEBASESETRIBUTOSCONTRIBUIOPREVIDENCIRIA" Title="R-9011 - Consolidação de bases e tributos - Contribuição previdenciária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9011.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Registros/Cadastro/R9011.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_TOTALIZADORES" Level="20" Order="80"  /></div>
      </div>
      <div class="tab-pane" id="tabR9005BASESETRIBUTOSRETENESNAFONTE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R9005BASESETRIBUTOSRETENESNAFONTE" Title="R-9005 - Bases e tributos - retenções na fonte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9005.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Registros/Cadastro/R9005.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_TOTALIZADORES" Level="20" Order="90"  /></div>
      </div>
      <div class="tab-pane" id="tabR9015CONSOLIDAODASRETENESNAFONTE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="R9015CONSOLIDAODASRETENESNAFONTE" Title="R-9015 - Consolidação das retenções na fonte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R9015.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Registros/Cadastro/R9015.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_TOTALIZADORES" Level="20" Order="100"  /></div>
      </div>
    </div>
  </div>
</div>
      
        <script type="text/javascript">
              $( document ).ready(function() {
    $('[href="#tabR5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO"]').trigger("click");
});

            </script>
      </asp:Content>
    