<%@ Page Title="Saldos Periódicos - I150 - Saldos Periódicos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Saldos Periódicos - I150 - Saldos Periódicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_SALDOSPERIODICOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_ECD_SALDOS_PERIODICOS__SALDOS_PERIODICOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5466" Title="I155 - Detalhes Saldos Periódicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_SALDOPERIODICODETALHES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT SALDODETALHE.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_SALDOSPERIODICOS SALDOPERIODICO ON (SALDOPERIODICO.EMPRESA = PERIODO.EMPRESA)
                    JOIN ED_SALDOPERIODICODETALHES SALDODETALHE ON (SALDODETALHE.SALDOPERIODICO = SALDOPERIODICO.HANDLE)
                    JOIN ED_CONTAS CONTA ON (SALDODETALHE.HANDLECONTA = CONTA.HANDLE)
                    LEFT JOIN ED_CENTROSCUSTOS CENTROCUSTO ON (CENTROCUSTO.HANDLE = SALDODETALHE.HANDLECENTROCUSTO)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                AND SALDOPERIODICO.DATAINICIAL BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                AND SALDOPERIODICO.DATAFINAL BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL) AND (A.SALDOPERIODICO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3235_at5466_hsfe173b56.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_SALDOS_PERIODICOS__SALDOS_PERIODICOS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    