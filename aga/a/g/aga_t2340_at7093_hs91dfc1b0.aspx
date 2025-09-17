<%@ Page Title="Agregados/Terceiros" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Agregados/Terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_RECURSOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 1 OR A.TIPO = 4) AND (A.TIPOREGISTRO = 1) AND (A.ATIVO = 'S') AND A.ORIGEM = 2 AND ((A.EMPRESA = @EMPRESA AND A.FILIAL IN @FILIAIS) OR (A.LOCALEMPRESA = @EMPRESA AND A.LOCALFILIAL IN @FILIAIS))" FormUrl="~/aga/a/f/aga_t2340_at7093_hs91dfc1b0.aspx" UserDefinedDisableRowSelection="False" PageId="MF_VEICULOATIVOS__AGREGADO_TERCEIROS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    