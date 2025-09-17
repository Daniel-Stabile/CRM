<%@ Page Title="REG.K250 - Itens produzidos p/ terceiros" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="REG.K250 - Itens produzidos p/ terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOITENSPRODUZIDOSTERC.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_PRODUCAOAPURACAO__ED_CARGA_EFD_PRODUCAOITENSPRODTERC_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7448" Title="REG.255 - Insumos consumidos terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOITENSCONSUMIDOSTERC.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
             SELECT ITEMCONSUMIDOTERC.HANDLE
               FROM ED_PRODUCAOITENSCONSUMIDOSTERC ITEMCONSUMIDOTERC
               JOIN ED_PRODUCAOITENSPRODUZIDOSTERC ITEMPRODUZIDOTERC
                 ON ITEMCONSUMIDOTERC.ITEMPRODUZIDOTERC = ITEMPRODUZIDOTERC.HANDLE
               JOIN ED_PRODUCAOPERIODOAPURACAO PERIODOAPURACAO
                 ON ITEMPRODUZIDOTERC.PERIODOAPURACAO = PERIODOAPURACAO.HANDLE
               JOIN ED_PERIODOS PERIODO
                 ON PERIODOAPURACAO.PERIODO = PERIODO.HANDLE
               JOIN ED_PARAMETROFILIAIS PARAMETROSPED
                 ON PARAMETROSPED.FILIAL = PERIODO.FILIAL
              WHERE ITEMCONSUMIDOTERC.HANDLE = A.HANDLE
                AND PARAMETROSPED.PREENCHEBLOCOK = 'S'
            ) AND (A.ITEMPRODUZIDOTERC = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5118_at7448_hs8374b2ae.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAOAPURACAO__ED_CARGA_EFD_PRODUCAOITENSPRODTERC_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    