<%@ Page Title="Cadastradas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PR_ORDENSPRODUCAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.STATUS=1) AND (A.FILIAL IN(SELECT B.FILIAL FROM PR_PARAMETROS B WHERE B.UTILIZAUP = 'N') OR (A.FAMILIA IN(SELECT C.HANDLE FROM PD_FAMILIASPRODUTOS C WHERE C.UPAREA IN(SELECT D.AREA FROM UP_AREAINTEGRANTES D WHERE D.USUARIO = @USUARIO)))))" FormUrl="~/aga/a/f/aga_t1835_at2017_hs8bb103b8.aspx" UserDefinedDisableRowSelection="False" PageId="ORDENS_PRODUCAO__CADASTRADAS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    