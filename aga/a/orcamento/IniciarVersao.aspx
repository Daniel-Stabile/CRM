<%@ Page Title="Iniciar versão" Language="C#" Inherits="aga.a.orcamento.IniciarVersao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_VERSOESORCAMENTOS.INICIARVERSAO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_INICIARVERSAO" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="INICIARVERSO" Title="Iniciar versão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="COMANDOS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOOBJETOS.INICIAR_VERSAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE in (SELECT B.OBJETO FROM CN_OBJETOENTREGAS B  WHERE  @DATAPARTE(ANO,B.DATA) = ( SELECT  @DATAPARTE(ANO,W.MESFINAL) FROM CT_VERSOESORCAMENTOS W WHERE HANDLE = @CAMPO(HANDLE) ))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_INICIARVERSAO" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    