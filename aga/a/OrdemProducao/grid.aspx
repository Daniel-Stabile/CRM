<%@ Page Title="Ordens de produção" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.OrdemProducao.OrdemProducaogridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ORDENSDEPRODUO" Title="Movimentações Ordens de Produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDENSPRODUCAO.CUSTOM.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.FILIAL IN(SELECT B.FILIAL FROM PR_PARAMETROS B WHERE B.UTILIZAUP = 'N') OR (A.FAMILIA IN(SELECT C.HANDLE FROM PD_FAMILIASPRODUTOS C WHERE C.UPAREA IN(SELECT D.AREA FROM UP_AREAINTEGRANTES D WHERE D.USUARIO = @USUARIO))))" FormUrl="~/aga/a/OrdemProducao/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMPRODUCAO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    