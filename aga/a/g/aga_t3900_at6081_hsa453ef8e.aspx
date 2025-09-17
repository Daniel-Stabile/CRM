<%@ Page Title="10.05 - PIS/COFINS dos Serviços (E)" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="10.05 - PIS/COFINS dos Serviços (E)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_IMPOSTOITEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT IMPOSTO.HANDLE
  FROM IN_IMPOSTOITEM IMPOSTO,
       IN_NOTASITENS ITEM,
       IN_NOTAS NOTA
 WHERE ITEM.HANDLE = IMPOSTO.ITEM
   AND NOTA.HANDLE = ITEM.NOTA
   AND NOTA.TIPOREGISTRO = 4
)" FormUrl="~/aga/a/f/aga_t3900_at6081_hsa453ef8e.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__REGISTRO105_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    