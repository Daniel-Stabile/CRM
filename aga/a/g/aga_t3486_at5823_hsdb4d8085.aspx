<%@ Page Title="Condições para regras" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Condições para regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_REGRAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPO = 'P' AND A.GRUPO IN (SELECT HANDLE FROM GN_GRUPOREGRAS WHERE MODULO = 2 
AND PROCESSO = 3)" FormUrl="~/aga/a/f/aga_t3486_at5823_hsdb4d8085.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_VALIDACOES__CONDICOES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    