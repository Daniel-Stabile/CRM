<%@ Page Title="Projetos Gerenciais" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMCT_PROJETOSGERENCIAIS" Title="Projetos Gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PROJETOSGERENCIAIS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FLUXOCAIXA_CADASTROS_CTPROJETOSGERENCIAIS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="PROJETOS" Title="Projetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMCT_PROJETOSGERENCIAIS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PROJETOGERENCIALPROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/FluxoCaixa/a/Cadastros/CtProjetogerencialprojetos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FLUXOCAIXA_CADASTROS_CTPROJETOSGERENCIAIS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    