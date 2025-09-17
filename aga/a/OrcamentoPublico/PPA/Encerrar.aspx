<%@ Page Title="Encerrar PPA" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ENCERRARCONCLUR" Title="Encerrar / Concluir" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_VT_ENCERRARPLANEJAMENTO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_PPA_ENCERRAR" Level="20" Order="10"  />
        </div>
    
        <style>
              .control-label.name.empty {
    display: none;
}

#ctl00_Main_ENCERRARCONCLUR_PageControl_GERAL_GERAL > div:nth-child(3) > div
{
    border-radius: 6px !important;
    border: 1px solid #ddd;
    padding: 8px;
}

#ctl00_Main_ENCERRARCONCLUR_PageControl_GERAL_GERAL > div:nth-child(3) {
    
    display: flex;
    gap: 10px;
}

              </style>
      </asp:Content>
    