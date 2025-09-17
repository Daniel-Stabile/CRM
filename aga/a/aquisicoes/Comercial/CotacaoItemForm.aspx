<%@ Page Title="Cotação" Language="C#" CodeFile="~/aga/a/aquisicoes/Comercial/CotacaoItemForm.aspx.cs" Inherits="ComercialCotacaoItemFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COTAO" Title="Cotação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="LC_AQUISICAOCOTACOESITEM.COTACAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.AQUISICAOITEM=@CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="LC_AQUISICOES_COTACAO_ITEM_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    