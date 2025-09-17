<%@ Page Title="Tabela de Processos Administrativos/Judiciais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="TABELADEPROCESSOSADMINISTRATIVOSJUDICIAIS" Title="Tabela de Processos Administrativos/Judiciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R1070.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.TOTALIZADORR2010 = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="PORTALREINF_A_REGISTROS_REINF_R1070" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    