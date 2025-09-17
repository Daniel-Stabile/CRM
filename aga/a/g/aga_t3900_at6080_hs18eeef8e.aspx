<%@ Page Title="10.04 - PIS/COFINS das Mercadorias (E)" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="10.04 - PIS/COFINS das Mercadorias (E)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_IMPOSTOITEM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT IMPOSTO.HANDLE
      FROM IN_IMPOSTOITEM IMPOSTO,
                 IN_NOTASITENS ITEM,
                 IN_NOTAS NOTA
    WHERE ITEM.HANDLE = IMPOSTO.ITEM
         AND NOTA.HANDLE = ITEM.NOTA
         AND NOTA.TIPOREGISTRO IN(1,2,3)
         AND NOTA.EHNOTADETERCEIRO='S'
         AND NOTA.INDICADORMOVIMENTO = 'E'
         AND NOTA.TIPONOTA = 'A'
)" FormUrl="~/aga/a/f/aga_t3900_at6080_hs18eeef8e.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__REGISTRO104_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    