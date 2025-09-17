<%@ Page Title="Disponíveis" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Disponíveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_RECURSOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 1 OR A.TIPO = 4) AND (A.TIPOREGISTRO = 1) AND (A.ATIVO = 'S') AND (A.HANDLE NOT IN (SELECT B.VEICULO FROM MF_AGENDA B WHERE B.STATUS = 4)) AND (A.EMMANUTENCAO = 'N') AND ((A.LOCALFILIAL IN @FILIAIS) OR  ((A.LOCALFILIAL IS NULL) AND A.FILIAL IN @FILIAIS) )" FormUrl="~/aga/a/f/aga_t2340_at4530_hs718ddf24.aspx" UserDefinedDisableRowSelection="False" PageId="MF_VEICULOS_MODULO__VEICULOS_DISPONIVEIS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    