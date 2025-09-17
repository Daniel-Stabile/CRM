<%@ Page Title="Inventário" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.inventario.Inventario" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ORDENSDECONTAGEM" Title="Inventário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="PD_ORDENSCONTAGEM.INVENTARIO.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/materiais/inventario/InventarioForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_INVENTARIO_INVENTARIO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="VERSESDECONTAGEM" Title="Versões de inventário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ORDENSDECONTAGEM" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ORDENSCONTAGEMVERSOES.INVENTARIO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ORDEMCONTAGEM = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/inventario/InventarioVersoesForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_INVENTARIO_INVENTARIO" Level="20" Order="20"  />
        </div>
    
        <style>
              #ctl00_Main_ORDENSDECONTAGEM_GERAL{
    padding-top: 0;
}

#ctl00_Main_ORDENSDECONTAGEM_FilterContainer{
    padding-bottom: 0;
}

#ctl00_Main_ORDENSDECONTAGEM_GERAL > div:first-child > div:nth-child(4) > .form-group{
    width: 65%;
    margin-left: 40%;
}

#ctl00_Main_ORDENSDECONTAGEM_GERAL > div:first-child > div:nth-child(5) > .form-group{
    width: 65%;
    margin-left: 5%;
}

              </style>
      </asp:Content>
    