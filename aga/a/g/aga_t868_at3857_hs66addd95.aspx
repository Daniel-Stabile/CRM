<%@ Page Title="Cadastradas (itens)" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Cadastradas (itens)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.REQUISICAOPAI IN (SELECT B.HANDLE FROM CP_REQUISICOESPAI B WHERE 
((B.STATUS = 1 OR B.STATUS IS NULL) AND B.USUARIOINCLUIU = @USUARIO AND B.LIBERADA = 'N'))" FormUrl="~/aga/a/f/aga_t868_at3857_hs66addd95.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADASITENS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    