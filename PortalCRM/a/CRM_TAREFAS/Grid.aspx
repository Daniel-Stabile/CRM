<%@ Page Title="Tarefas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDWIDGET_635709299157935690" Title="Relação de Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_TAREFAS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" DefaultFilterName="PADRAO" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA AND 
(
   A.ACAORELACIONAMENTO IS NULL AND A.OPORTUNIDADE IS NULL 
  OR
  (A.STATUS &lt;&gt; 1)
)
" FormUrl="~/PortalCRM/a/CRM_TAREFAS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="GRIDPAGEID_635709299157935690" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    