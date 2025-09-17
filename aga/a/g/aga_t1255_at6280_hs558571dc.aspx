<%@ Page Title="Itens em recuperação de ICMS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Itens em recuperação de ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="'S' = (SELECT  B.CALCULAICMS FROM CT_CONTAS B WHERE B.HANDLE = A.CONTA      )
AND A.RECUPERAICMS = 2 
AND A.DATASAIDA IS NULL  
AND (A.COMPOSICAO = 1
          OR 
          (A.COMPOSICAO = 2 AND A.CONCLUSAOCOMPOSICAO IS NOT NULL AND  A.RECUPERAICMSCOMPEMANDAMENTO = 'N')
         OR
          (A.COMPOSICAO = 3 AND A.RECUPERAICMSCOMPEMANDAMENTO = 'S')
        ) 
AND (SELECT COUNT(Z.HANDLE) 
            FROM AT_ITEMCREDITOSICMS Z 
        WHERE Z.ITEM = A.HANDLE)    &lt;   A.NUMEROPARCELASRECUPERAICMS" FormUrl="~/aga/a/f/aga_t1255_at6280_hs558571dc.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_EM_RECUP_ICMS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    