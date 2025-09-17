<%@ Page Title="Validações Contábeis" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Contabil.Validacao.Validacao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="VALIDAESCONTBEIS" Title="Validações Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_VALIDACOES.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_VALIDACAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="REGRASVERIFICADAS_1" Title="Regras verificadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="VALIDAESCONTBEIS" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="GN_GRUPOLOGITENS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_VALIDACAO" Level="20" Order="30"  />
        <wes:AjaxForm runat="server" ID="INFORMAESADICIONAIS" Title="Informações adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REGRASVERIFICADAS_1" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_GRUPOLOGITENS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_VALIDACAO" Level="20" Order="40"  />
        </div>
    
      </asp:Content>
    