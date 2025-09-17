<%@ Page Title="Concluídas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Concluídas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_ORDEMSERVICOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TMSLNGPOLO IS NOT NULL 
OR A.STATUS = 4
OR A.ADIANTAMENTO IS NOT NULL)
AND (EXISTS(SELECT HANDLE FROM MF_PARAMETROS WHERE EMPRESA = A.EMPRESA
AND SISTEMATMSNATECNOLOGIABENNER = 'N') 
         OR A.PAGADOR IS NOT NULL
        )" FormUrl="~/aga/a/f/aga_t2619_at7041_hs828d409b.aspx" UserDefinedDisableRowSelection="False" PageId="MF_AGREGADOORDENSMANUTENCAO__CONCLUIDAS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    