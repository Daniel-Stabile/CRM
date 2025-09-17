<%@ Page Title="03.09 - Itens NF Serviço - Terceiros" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="03.09 - Itens NF Serviço - Terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_NOTASITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
SELECT ITEM.HANDLE 
  FROM IN_NOTASITENS ITEM,
             IN_NOTAS NOTA
WHERE NOTA.HANDLE = ITEM.NOTA
     AND NOTA.TIPONOTA = 'N'
     AND NOTA.TIPOREGISTRO = 2
     AND NOTA.INDICADORMOVIMENTO = 'E'
     AND NOTA.EHNOTADETERCEIRO = 'S' 
)" FormUrl="~/aga/a/f/aga_t1686_at6077_hs85739c7a.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__IN_ITENS_NF_SERVICO_TERCEIROS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    