<%@ Page Title="Identificação do Rendimento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="IDENTIFICAODORENDIMENTO" Title="Identificação do Rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_IDENTIFICACAORENDIMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_IDENTIFICACAORENDIMENTO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="INFORMAESRELATIVASAORENDIMENTOPAGOCREDITADO" Title="Informações Relativas ao Rendimento Pago/Creditado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="IDENTIFICAODORENDIMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010INFORENDIMENTOPGTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010IDENTIFICACAORENDIMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/InfoPagamento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_IDENTIFICACAORENDIMENTO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    