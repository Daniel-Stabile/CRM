<%@ Page Title="Auditoria de projetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="AUDITORIADEPROJETOS" Title="Auditoria de projetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_PROJETOAUDITORIAS.AUDITORIA.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/gestaoProjetos/AuditoriaProjeto.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AUDITORIA_PROJETOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    