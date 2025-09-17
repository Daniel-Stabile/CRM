<%@ Page Title="Provisões contábeis saúde" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Provisões contábeis saúde" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ABRANGENCIA IN ('B','D','G','H')) AND (A.TIPOREGISTRO = 24) AND EXISTS (SELECT HANDLE FROM EMPRESAS B WHERE B.HANDLE = A.EMPRESA AND B.INTEGRARSAUDE = 'S')" FormUrl="~/aga/a/f/aga_t1216_at7818_hsff429d6c.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_MOVIMENTACOES_CONTABEIS__PROVISOES_CONTABIL_SAUDE_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    