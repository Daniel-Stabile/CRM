<%@ Page Title="Entradas - REG.F130: ATIVO IMOBILIZADO-AQUISIÇÃO" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Entradas - REG.F130: ATIVO IMOBILIZADO-AQUISIÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PCCREDITOATIVOAQUISICAO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFDPC_ENTRADAS__ED_CARGA_EFDPC_ENTRADAS_REGISTROS130_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6371" Title="REG.F139: PROCESSOS REFERENCIADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCCREDITOATIVOPROCESSOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CREDITOATIVOAQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4131_at6371_hs82e7e929.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFDPC_ENTRADAS__ED_CARGA_EFDPC_ENTRADAS_REGISTROS130_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    