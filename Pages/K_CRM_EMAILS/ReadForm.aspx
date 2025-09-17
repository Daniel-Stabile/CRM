<%@ Page Title="E-mail" Language="C#" CodeFile="~/Pages/K_CRM_EMAILS/ReadForm.aspx.cs" Inherits="K_CRM_EMAILSReadFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_EMAILLIDO" Title="Email Lido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_EMAILS_LIDOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_EMAILS_READFORM" Level="50" Order="10"  />
        <wes:AjaxForm runat="server" ID="K_EMAIL" Title="Mensagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_EMAILLIDO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_EMAILS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(EMAIL)" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_EMAILS_READFORM" Level="50" Order="20"  />
        <wes:AjaxForm runat="server" ID="K_MENSAGEM" Title="Mensagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_EMAILLIDO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_EMAILS.RESPOSTA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(EMAIL) " UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_EMAILS_READFORM" Level="50" Order="30"  />
        </div>
    
      </asp:Content>
    