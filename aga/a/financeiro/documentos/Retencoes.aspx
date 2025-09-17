<%@ Page Title="Retenções" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.Documentos.Retencoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="IMPOSTOS" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RETENCOES" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="INFORMAESIMPOSTOS" Title="Informações impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="IMPOSTOS" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="RETENCOES" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="RETENODETERCEIROS" Title="Retenção de terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="IMPOSTOS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOSTERCEIROS.RETENCAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RETENCOES" Level="20" Order="25"  />
        <wes:AjaxForm runat="server" ID="DOCUMENTOGERADO" Title="Documento gerado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INFORMAESIMPOSTOS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.RETENCOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(DOCUMENTOGERADO)" UserDefinedCommandsVisible="True" PageId="RETENCOES" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="VENCIMENTOS" Title="Vencimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOGERADO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.RETENCOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RETENCOES" Level="20" Order="40"  />
        </div>
    
        <script type="text/javascript">
              const AssociarEventoFoco = () => $("tr #CMD_EDITAR_record").each(function() {
    linkAtual = $(this).attr('href').replace('javascript:', '');
    $(this).attr('href','javascript:$("#INFORMAESIMPOSTOS").attr("tabindex",-1);$("#INFORMAESIMPOSTOS").css("outline", "none");$("#INFORMAESIMPOSTOS").focus();' + linkAtual );
});

              </script>
      </asp:Content>
    