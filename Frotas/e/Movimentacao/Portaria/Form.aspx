<%@ Page Title="Portaria" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PORTARIA" Title="Portaria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_AGENDA.CADASTRA_PORTARIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CADASTRO_MOVIMENTACAO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PORTARIA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_AGENDA.PORTARIA_AUDITORIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CADASTRO_MOVIMENTACAO" Level="20" Order="30"  />
        </div>
    
        <style>
                  .disabled{
        pointer-events:none
    }

              </style>
      </asp:Content>
    