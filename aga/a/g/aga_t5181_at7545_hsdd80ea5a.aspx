<%@ Page Title="Registros de log com erro" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Registros de log com erro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_ED_AUDITORIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOESCRITURACAO = 1 AND A.RESULTADOEXECUCAO &lt;&gt; 1" FormUrl="~/aga/a/f/aga_t5181_at7545_hsdd80ea5a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUDITORIA_SPED_EFD_ICMS__AUDITORIA_SPED_EFD_ICMS_ERROS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    