<%@ Page Title="Usuários" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDUSUARIOS" Title="Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_Z_GRUPOUSUARIOS.CADASTRO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT USUARIO FROM Z_GRUPOUSUARIOEMPRESAS WHERE EMPRESA = @EMPRESA)" FormUrl="~/Erp/Cadastro/Usuario.aspx" UserDefinedDisableRowSelection="False" PageId="ERP_A_CADASTRO_USUARIOS" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    