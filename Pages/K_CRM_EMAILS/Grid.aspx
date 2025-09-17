<%@ Page Title="Emails" Language="C#" CodeFile="~/Pages/K_CRM_EMAILS/Grid.aspx.cs" Inherits="K_CRM_EMAILSGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
                  <asp:UpdatePanel ID="PnlBotaoEnviar" runat="server">
        <ContentTemplate>
        <div class="portlet light">
            <div class="row">
                <asp:LinkButton ID="BtnNovoEmail" runat="server"
                    OnClick="BtnNovoEmail_Click"
                    CssClass="btn btn-action green"
                    Visible="True">
<i
    class="fa fa-plus btn-action"></i>Nova Mensagem
                </asp:LinkButton>
            </div>
        </div>
            </ContentTemplate>
    </asp:UpdatePanel>
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_EMAILSNOLIDOS" class="active"><a data-toggle="tab" href="#tabK_EMAILSNOLIDOS">E-mails Não Lidos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_EMAILSLIDOS_1"><a data-toggle="tab" href="#tabK_EMAILSLIDOS_1">Emails Lidos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_EMAILS"><a data-toggle="tab" href="#tabK_EMAILS">E-mails Enviados</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabK_EMAILSNOLIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_EMAILSNOLIDOS" Title="E-mails Não Lidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_EMAILS_LIDOS.MAIN.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @USUARIO AND A.LIDO = 'N'" FormUrl="~/Pages/K_CRM_EMAILS/ReadForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_EMAILS_GRID" Level="50" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabK_EMAILSLIDOS_1">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_EMAILSLIDOS_1" Title="Emails Lidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_EMAILS_LIDOS.LIDOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO = @USUARIO AND A.LIDO = 'S'" FormUrl="~/Pages/K_CRM_EMAILS/ReadForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_EMAILS_GRID" Level="50" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabK_EMAILS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_EMAILS" Title="E-mails Enviados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="K_CRM_EMAILS.MAIN.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REMETENTE = @USUARIO" FormUrl="~/Pages/K_CRM_EMAILS/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_EMAILS_GRID" Level="50" Order="50"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    