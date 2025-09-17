<%@ Page Title="Escopo do Produto" Language="C#" CodeFile="~/Pages/K_CRM_PESSOAOPORTUNIDADES/NovaOportunidadeProdEscopo.aspx.cs" Inherits="K_CRM_PESSOAOPORTUNIDADESNovaOportunidadeProdEscopoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_ESCOPODOPRODUTO" Title="Escopo do Produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_VT_PO_ESCOPO.NOVAOPORTUNIDADE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADEPRODESCOPO" Level="50" Order="10"  />
        <wes:ActionView runat="server" ID="K_CONTRATO" Title="Contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_ESCOPODOPRODUTO" ChromeState="Normal" Controller="CrmPessoaOportunidades" Action="ContratoERecurso" PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_NOVAOPORTUNIDADEPRODESCOPO" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    