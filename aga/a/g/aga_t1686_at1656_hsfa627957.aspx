<%@ Page Title="03.04 - Itens merc. e serv. (E) terceiro" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="03.04 - Itens merc. e serv. (E) terceiro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_NOTASITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="NOTA IN (SELECT HANDLE FROM IN_NOTAS WHERE EMPRESA = @EMPRESA AND TIPOREGISTRO IN(1,2,3) AND EHNOTADETERCEIRO='S' AND TIPONOTA = 'A')" FormUrl="~/aga/a/f/aga_t1686_at1656_hsfa627957.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__ITENSMERCSERV_E_TERC_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    