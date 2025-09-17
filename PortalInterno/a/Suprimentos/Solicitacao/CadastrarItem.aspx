<%@ Page Title="Cadastro de itens" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_636180137986203486" Title="Adicionar itens na solicitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PORTAL_INT_CADASTRAR_ITEM_SOLICITACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_INT_CADASTRO_ITEM_SOLICITACAO" Level="20" Order="1"  />
        </div>
    
        <style>
              .select2-container .select2-selection--single .select2-selection__rendered .selected-item {
    display: inline;
}

#select2-ctl00_Main_WIDGETID_636180137986203486_formView_PageControl_GERAL_GERAL_UNIDADE_ctl01_select-container .select2-selection__clear {
    display: none;
}

              </style>
      </asp:Content>
    