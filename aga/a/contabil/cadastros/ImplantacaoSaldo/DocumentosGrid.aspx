<%@ Page Title="Implantação de saldos" Language="C#" Inherits="aga.a.contabil.cadastros.ImplantacaoSaldo.ImplantacaoSaldoDocumentosGridPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="IMPLANTAODESALDOS" Title="Implantação de saldos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_DOCUMENTOS.IMPLSALDOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORIGEM = 46)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO" Level="20" Order="10"  />
    <wes:PartialView runat="server" ID="TOTAIS" Title="Totais" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="1" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="IMPLANTAODESALDOS" ChromeState="Normal" ViewPath="~/Views/ImplantacaoSaldos/Index.cshtml" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO" Level="20" Order="15"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SALDOSINICIAIS" class="active"><a data-toggle="tab" href="#tabSALDOSINICIAIS">Saldos iniciais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTO"><a data-toggle="tab" href="#tabDOCUMENTO">Documento</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabSALDOSINICIAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SALDOSINICIAIS" Title="Saldos iniciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="IMPLANTAODESALDOS" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CT_LANCAMENTOS.IMPLSALDOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO" Level="20" Order="20"  />
    <wes:AjaxForm runat="server" ID="LANAMENTO" Title="Lançamento" Subtitle="Lançamento" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="SALDOSINICIAIS" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CT_LANCAMENTOS.IMPLSALDOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO" Level="20" Order="43"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="DOCUMENTO" Title="Documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="IMPLANTAODESALDOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_DOCUMENTOS.IMPLSALDOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_CADASTROS_IMPLANTACAOSALDO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $('#portlet_LANAMENTO > div:first div.caption span:first').remove();
            </script>
        <style>
            #ctl00_Main_TOTAIS_UpdatePanel{
    display: -webkit-box;
}

            </style>
      </asp:Content>
    