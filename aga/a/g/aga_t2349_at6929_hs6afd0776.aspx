<%@ Page Title="Fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_RECURSOPARTES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="LOCAL = 3 AND (A.PARTEPNEU = 2) AND (A.TIPOREGISTRO = 1) AND (A.EMPRESA = (SELECT EMPRESAMESTRE FROM EMPRESAS WHERE HANDLE = @EMPRESA) OR A.EMPRESA = @EMPRESA)" FormUrl="~/aga/a/f/aga_t2349_at6929_hs6afd0776.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONJUNTOS_PNEUS__FORNECEDORES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    