<%@ Page Title="REG.K230 - Itens produzidos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="REG.K230 - Itens produzidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOITENSPRODUZIDOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_PRODUCAOAPURACAO__ED_CARGA_EFD_PRODUCAOITENSPROD_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7447" Title="REG.K235 - Insumos consumidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOITENSCONSUMIDOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
             SELECT ITEMCONSUMIDO.HANDLE
               FROM ED_PRODUCAOITENSCONSUMIDOS ITEMCONSUMIDO
               JOIN ED_PRODUCAOITENSPRODUZIDOS ITEMPRODUZIDO
                 ON ITEMCONSUMIDO.ITEMPRODUZIDO = ITEMPRODUZIDO.HANDLE
               JOIN ED_PRODUCAOPERIODOAPURACAO PERIODOAPURACAO
                 ON ITEMPRODUZIDO.PERIODOAPURACAO = PERIODOAPURACAO.HANDLE
               JOIN ED_PERIODOS PERIODO
                 ON PERIODOAPURACAO.PERIODO = PERIODO.HANDLE
               JOIN ED_PARAMETROFILIAIS PARAMETROSPED
                 ON PARAMETROSPED.FILIAL = PERIODO.FILIAL
              WHERE ITEMCONSUMIDO.HANDLE = A.HANDLE
                AND PARAMETROSPED.PREENCHEBLOCOK = 'S'
            ) AND (A.ITEMPRODUZIDO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5116_at7447_hs94f27255.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAOAPURACAO__ED_CARGA_EFD_PRODUCAOITENSPROD_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    