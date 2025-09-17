<%@ Page Title="Histórico de abertura/fechamento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Histórico de abertura/fechamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_CONTROLEABASTECIMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS IN (2,3)) AND
((A.CENTROMANUTENCAO IN (SELECT HANDLE FROM MA_CENTROSMANUTENCAO WHERE FILIAL = @FILIAL)) OR (@FILIAL = 0))" FormUrl="~/aga/a/f/aga_t4678_at7054_hsab7d7936.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONTROLEABASTECIMENTO__HISTORICOCONTROLES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    