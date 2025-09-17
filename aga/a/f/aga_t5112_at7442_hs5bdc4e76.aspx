<%@ Page Title="Produção - REG.K100 - Período de apuração" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Produção - REG.K100 - Período de apuração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOPERIODOAPURACAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_PRODUCAO__ED_PRODUCAOAPURACAO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7443" Title="REG.K200 - Inventário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOINVENTARIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODOAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5113_at7443_hs8c608ef7.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAO__ED_PRODUCAOAPURACAO_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7444" Title="REG.K220 - Outras movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOMOVIMENTOSINTERNOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
             SELECT MOVIMENTO.HANDLE
               FROM ED_PRODUCAOMOVIMENTOSINTERNOS MOVIMENTO
               JOIN ED_PRODUCAOPERIODOAPURACAO PERIODOAPURACAO
                 ON MOVIMENTO.PERIODOAPURACAO = PERIODOAPURACAO.HANDLE
               JOIN ED_PERIODOS PERIODO
                 ON PERIODOAPURACAO.PERIODO = PERIODO.HANDLE
               JOIN ED_PARAMETROFILIAIS PARAMETROSPED
                 ON PARAMETROSPED.FILIAL = PERIODO.FILIAL
              WHERE MOVIMENTO.HANDLE = A.HANDLE
                AND PARAMETROSPED.PREENCHEBLOCOK = 'S'
            ) AND (A.PERIODOAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5114_at7444_hsdb2dc4bf.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAO__ED_PRODUCAOAPURACAO_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7445" Title="REG.K230 - Itens produzidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOITENSPRODUZIDOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
             SELECT ITEMPRODUZIDO.HANDLE
               FROM ED_PRODUCAOITENSPRODUZIDOS ITEMPRODUZIDO
               JOIN ED_PRODUCAOPERIODOAPURACAO PERIODOAPURACAO
                 ON ITEMPRODUZIDO.PERIODOAPURACAO = PERIODOAPURACAO.HANDLE
               JOIN ED_PERIODOS PERIODO
                 ON PERIODOAPURACAO.PERIODO = PERIODO.HANDLE
               JOIN ED_PARAMETROFILIAIS PARAMETROSPED
                 ON PARAMETROSPED.FILIAL = PERIODO.FILIAL
              WHERE ITEMPRODUZIDO.HANDLE = A.HANDLE
                AND PARAMETROSPED.PREENCHEBLOCOK = 'S'
            ) AND (A.PERIODOAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5115_at7445_hsc33b7b5f.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAO__ED_PRODUCAOAPURACAO_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7446" Title="REG.K250 - Itens produzidos p/ terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOITENSPRODUZIDOSTERC.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
             SELECT ITEMPRODUZIDOTERC.HANDLE
               FROM ED_PRODUCAOITENSPRODUZIDOSTERC ITEMPRODUZIDOTERC
               JOIN ED_PRODUCAOPERIODOAPURACAO PERIODOAPURACAO
                 ON ITEMPRODUZIDOTERC.PERIODOAPURACAO = PERIODOAPURACAO.HANDLE
               JOIN ED_PERIODOS PERIODO
                 ON PERIODOAPURACAO.PERIODO = PERIODO.HANDLE
               JOIN ED_PARAMETROFILIAIS PARAMETROSPED
                 ON PARAMETROSPED.FILIAL = PERIODO.FILIAL
              WHERE ITEMPRODUZIDOTERC.HANDLE = A.HANDLE
                AND PARAMETROSPED.PREENCHEBLOCOK = 'S'
            ) AND (A.PERIODOAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5117_at7446_hs29b709e9.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAO__ED_PRODUCAOAPURACAO_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8385" Title="REG.K280 - Estoque Escriturado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUCAOINVENTARIOCORRECAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODOAPURACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5786_at8385_hs196e316d.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_PRODUCAO__ED_PRODUCAOAPURACAO_FORM" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    