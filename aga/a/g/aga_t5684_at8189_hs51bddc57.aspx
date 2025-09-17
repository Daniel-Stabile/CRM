<%@ Page Title="Canceladas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITEMMOVIMENTACAOREQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
   (A.STATUS = 4) AND 
   (
      (A.USUARIOINCLUIU = @USUARIO) OR 
      (A.USUARIOALTERACAO = @USUARIO) OR 
      (A.HANDLE IN (SELECT ITEMMOVIMENTACAOREQUISICAO FROM PD_ASSINATURAS 
                     WHERE USUARIO= @USUARIO AND ITEMMOVIMENTACAOREQUISICAO = A.HANDLE)
      ) 
   ) 
)" FormUrl="~/aga/a/f/aga_t5684_at8189_hs51bddc57.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_MOVIMENTACAOREQUISICOES__CANCELADAS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    