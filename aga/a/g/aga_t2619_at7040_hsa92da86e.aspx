<%@ Page Title="Pendentes" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Pendentes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_ORDEMSERVICOS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TMSLNGPOLO IS NULL AND A.STATUS &lt;&gt; 3 AND A.ADIANTAMENTO IS NULL 
AND A.STATUS &lt;&gt; 4
AND (EXISTS(SELECT HANDLE FROM MF_PARAMETROS WHERE EMPRESA = A.EMPRESA
AND SISTEMATMSNATECNOLOGIABENNER = 'N') 
         OR A.PAGADOR IS NOT NULL
        )" FormUrl="~/aga/a/f/aga_t2619_at7040_hsa92da86e.aspx" UserDefinedDisableRowSelection="False" PageId="MF_AGREGADOORDENSMANUTENCAO__PENDENTES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    