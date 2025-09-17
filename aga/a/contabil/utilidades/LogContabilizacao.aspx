<%@ Page Title="Log de ocorrências na contabilização" Language="C#" Inherits="aga.a.Contabil.LogContabilizacao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LOGDEOCORRNCIASNACONTABILIZAO" Title="Log de ocorrências na contabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OCORRENCIAS_CONTABILIZACAO_SERVIDOR.DATASOURCE.GRID" DefaultFilterName="Filtro ocorrências" Mode="FixedRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_UTILIDADES_LOGCONTABILIZACAO" Level="20" Order="10"  />
        </div>
    
        <style>
              .ClassOK
{
    font-size: 10px!important;
    color: #26C281!important
    
}
.ClassError
{
    font-size: 10px!important;
    color: #FFFFFF!important;
    
}
.popover
{
    width: 75%!important;
}




              </style>
      </asp:Content>
    