<%@ Page Title="Cadastro de registros de necessidade" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_636180039272029687" Title="Registro de necessidades &gt;&gt; Cadastro de registros de necessidade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_INT_COMANDOS_CADASTRAR_ITENS_SOLICITACAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_INT_CADASTRAR_ITENS_NECESSIDADE" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_636180016667823442" Title="Registro de necessidades &gt;&gt; Cadastro de registros de necessidade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="WIDGETID_636180039272029687" ChromeState="Normal" EntityViewName="PORTAL_INT_ITENS_SOLICITACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SOLICITACAO = @CAMPO(HANDLE)" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_CADASTRAR_ITENS_NECESSIDADE" Level="20" Order="2"  />
        </div>
    
      </asp:Content>
    