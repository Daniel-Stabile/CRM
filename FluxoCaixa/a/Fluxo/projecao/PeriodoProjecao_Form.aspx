<%@ Page Title="PERÍODOS PROJEÇÃO" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PERODOSPROJEO" Title="PERÍODOS PROJEÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_PERIODOSPROJECAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FX_PERIODOSPROJECAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="CONTASDEEXCEO" Title="CONTAS EXCEÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PERODOSPROJEO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_PERIODOCONTASEXCECAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PERIODOPROJECAO = @CAMPO(HANDLE)" FormUrl="~/FluxoCaixa/a/Fluxo/projecao/PeriodoContasExcecao_Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FX_PERIODOSPROJECAO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    