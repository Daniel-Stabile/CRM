<%@ Page Title="Tabelas auxiliares - Produtos (SPED)" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Produtos (SPED)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PRODUTOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_TABELASAUXILIARES__EDPRODUTOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6661" Title="Histórico de alterações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FILIAL IN (
                        SELECT PAI.FILIAL 
                          FROM ED_PRODUTOS PAI 
                        WHERE PAI.HANDLE = @RASTRO(ED_PRODUTOS) 
                      ) 
                   AND A.ORIGEM IN (
                                      SELECT PAI.ORIGEM 
                                        FROM ED_PRODUTOS PAI
                                       WHERE PAI.HANDLE = @RASTRO(ED_PRODUTOS) 
                                   ) 
                   AND A.CODIGO IN (
                                      SELECT PAI.CODIGO 
                                        FROM ED_PRODUTOS PAI
                                       WHERE PAI.HANDLE = @RASTRO(ED_PRODUTOS) 
                                   ) 
                   AND A.ULTIMOREGISTRO = 'N'" FormUrl="~/aga/a/f/aga_t3130_at6661_hs593f6fbf.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_TABELASAUXILIARES__EDPRODUTOS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    