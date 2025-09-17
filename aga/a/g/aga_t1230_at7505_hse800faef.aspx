<%@ Page Title="Projetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Projetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PROJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/Contabil/Projetos/Projeto.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__PROJETOS_GRID" Level="20" Order="1"  />
        <wes:AjaxForm runat="server" ID="PROJETO" Title="Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRID" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PROJETOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CT_CARGA_PLANOS__PROJETOS_GRID" Level="20" Order="11"  />
        <wes:SimpleGrid runat="server" ID="ALADASPORFILIAL" Title="Alçadas por filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROJETO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FILIAIS.ALCADA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="((SELECT COUNT(ALCADA.HANDLE) FROM CP_GRUPOALCADAS ALCADA WHERE ALCADA.FILIAL = A.HANDLE AND ALCADA.EHALCADAPROJETO = 'S') &gt; 0)" FormUrl="~/aga/a/f/aga_t720_at7560_hsdef18963.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__PROJETOS_GRID" Level="20" Order="21"  />
        </div>
    
      </asp:Content>
    