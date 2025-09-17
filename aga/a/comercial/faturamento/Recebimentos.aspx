<%@ Page Title="Recebimentos" Language="C#" Inherits="aga.a.comercial.faturamento.FaturamentoRecebimentosPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="GERARRECEBIMENTOS" Title="Recebimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_VT_DOCRECEBIMENTOS.FILTRO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="COMERCIAL_FATURAMENTO_RECEBIMENTOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="PARCELAS" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GERARRECEBIMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_DOCUMENTORECEBIMENTOS.FORMFATURAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="15" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(DOCUMENTO)" FormUrl="~/aga/a/comercial/Faturamento/Recebimento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_FATURAMENTO_RECEBIMENTOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    