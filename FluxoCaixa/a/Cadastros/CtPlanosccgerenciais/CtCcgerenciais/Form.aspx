<%@ Page Title="Centro de Custo" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMCT_CCGERENCIAIS" Title="Centro de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CCGERENCIAIS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FLUXOCAIXA_CADASTROS_CTPLANOSCCGERENCIAIS_CTCCGERENCIAIS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="CENTROSDECUSTO" Title="Centros de custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMCT_CCGERENCIAIS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CCGERENCIALCC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CENTROCUSTOGERENCIAL = @CAMPO(HANDLE) AND A.TIPO = @CAMPO(TIPO))" FormUrl="~/FluxoCaixa/Cadastros/CtPlanosccgerenciais/CtCcgerenciais/CtCcgerencialcc/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FLUXOCAIXA_CADASTROS_CTPLANOSCCGERENCIAIS_CTCCGERENCIAIS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    