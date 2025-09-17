<%@ Page Title="Dados da empresa" Language="C#" CodeFile="~/Erp/Cadastro/Empresa.aspx.cs" Inherits="cadastroempresaPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMDADOSDAEMPRESA" Title="Dados da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_FILIAIS.CADASTRO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @FILIAL" UserDefinedCommandsVisible="True" PageId="ERP_A_CADASTRO_EMPRESAS_FORM" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    