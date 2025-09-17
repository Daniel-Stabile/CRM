<%@ Page Title="Itens de inventário" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.inventario.ItensDeInventario" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ITENSDECONTAGEM" Title="Itens de inventário" Subtitle="Itens de inventário" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ORDENSCONTAGEMITENS.INVENTARIO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_INVENTARIO_ITENSDEINVENTARIO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ORDENSCONTAGEMLOTES.INVENTARIO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_INVENTARIO_ITENSDEINVENTARIO" Level="20" Order="20"  />
        </div>
    
        <style>
              .editavelQtdeLida {
    min-width: 120px !important;
}

#ITENSDECONTAGEM th, td {
    white-space:nowrap !important;
}

#ctl00_Main_ITENSDECONTAGEM_GERAL{
    padding-top: 0;
}

#ctl00_Main_ITENSDECONTAGEM_FilterContainer{
    padding-top: 5px;
    padding-bottom: 5px;
}

#ctl00_Main_ITENSDECONTAGEM_GERAL > div:first-child > div:nth-child(3) > .form-group{
    width: 140%;
}

#ctl00_Main_ITENSDECONTAGEM_GERAL > div:first-child > div:nth-child(4) > .form-group{
    width: 65%;
    margin-left: 40%;
}

#ctl00_Main_ITENSDECONTAGEM_GERAL > div:first-child > div:nth-child(5) > .form-group{
    width: 65%;
    margin-left: 5%;
}
              </style>
      </asp:Content>
    