<%@ Page Title="Seleção de Documentos Devolução" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Comercial.Faturamento.Devolucao.SelecaoDocumentosDevolucaoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTRO" Title="filtro" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS.GRID" DefaultFilterName="Itens devolução" Mode="Fixed" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="GRIDDOCUMENTOADEVOLVER" Title="Seleção de  Itens Devolução" UserDefinedSelectColumnVisible ="true" UserDefinedDisableRowSelection="true" DisplayRowCommand="True" UserDefinedCriteriaWhereClause=""/>
        </div>
    
      </asp:Content>
    