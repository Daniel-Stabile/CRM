<%@ Page Title="Documentos para ajustes" Language="C#" Inherits="aga.a.contabil.simulacao.DocumentosAjustesPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_SIMULACAODOCUMENTO.AJUSTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/Contabil/Simulacao/Documentos/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_SIMULACAO_DOCUMENTOS_AJUSTES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_SIMULACAOLANCAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Contabil/Simulacao/Documentos/Lancamento/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_SIMULACAO_DOCUMENTOS_AJUSTES" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    