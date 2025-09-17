<%@ Page Title="Centro de Custo" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMCT_PLANOSCCGERENCIAIS" Title="Plano de Centro de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PLANOSCCGERENCIAIS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FLUXOCAIXA_CADASTROS_CTPLANOSCCGERENCIAIS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="CENTRODECUSTO" Title="Centro de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMCT_PLANOSCCGERENCIAIS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CCGERENCIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.TIPO = @CAMPO(HANDLE))" FormUrl="~/FluxoCaixa/a/Cadastros/CtPlanosccgerenciais/CtCcgerenciais/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FLUXOCAIXA_CADASTROS_CTPLANOSCCGERENCIAIS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    