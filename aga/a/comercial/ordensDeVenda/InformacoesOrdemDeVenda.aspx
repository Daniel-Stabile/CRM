<%@ Page Title="Informações de ordem de venda" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.atendimentoOrdensVenda.InformacoesOrdemDeVenda" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INFORMAESDEORDEMDEVENDA" Title="Informações de ordem de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_ORDEMVENDAENTREGAS.INFORMACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_ORDENSDEVENDA_INFORMACOESORDEMDEVENDA" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INFORMAESDEORDEMDEVENDA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDEMVENDAITEMLOTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMVENDAENTREGA = @CAMPO(HANDLE) AND A.ORDEMVENDAITEM = @CAMPO(ITEM)" PageId="AGA_A_COMERCIAL_ORDENSDEVENDA_INFORMACOESORDEMDEVENDA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    