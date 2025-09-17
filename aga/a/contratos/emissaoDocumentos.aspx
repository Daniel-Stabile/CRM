<%@ Page Title="Emissão de contratos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.apontamento.EmissaoDocumentos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="EMISSODEDOCUMENTOS" Title="Emissão de documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_MODELOS_DOCUMENTO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO IS NULL AND A.TIPO = 1" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_EMISSAOCONTRATOS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSGERADOS" Title="Documentos gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_MODELOS_DOCUMENTOS_GERADOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="((A.CONTRATO = @RASTRO(CN_CONTRATOS) AND @RASTRO(CN_CONTRATOADITIVOS) = -1) OR (@RASTRO(CN_CONTRATOS) &gt; 0 AND @RASTRO(CN_CONTRATOADITIVOS) = A.ADITIVO)) AND A.DOCUMENTO IS NOT NULL" FormUrl="~/aga/a/contratos/documentos/detalhesEmissao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_EMISSAOCONTRATOS" Level="20" Order="6"  />
        </div>
    
      </asp:Content>
    