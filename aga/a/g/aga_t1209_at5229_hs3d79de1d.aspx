<%@ Page Title="Operacões" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Operacões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_OPERACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHFISCAL = 'S' AND A.EHFATURAMENTO = 'S'
AND (A.EHCONTASPAGAR = 'N' OR A.EHCONTASPAGAR IS NULL)
AND (A.EHCONTASRECEBER = 'N' OR A.EHCONTASRECEBER IS NULL))" FormUrl="~/aga/a/f/aga_t1209_at5229_hs3d79de1d.aspx" UserDefinedDisableRowSelection="False" PageId="IE_TABELAS_AUXILIARES_IMPORTACAO__OPERACOES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    