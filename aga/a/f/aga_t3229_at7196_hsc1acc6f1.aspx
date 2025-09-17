<%@ Page Title="Plano de Contas - I050 - Plano de Contas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Plano de Contas - I050 - Plano de Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_CONTAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_ECD_PLANO_CONTAS__PLANO_DE_CONTAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6428" Title="I051 - Plano de Contas Referencial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTAPLANOSREFERENCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTAREFERENCIAL.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_PARAMETROS PARAMETROECD ON (PARAMETROECD.EMPRESA = PERIODO.EMPRESA)
                    JOIN CT_CONTAGERENCIALCONTAS CONTAREFERENCIAORIGEM ON (CONTAREFERENCIAORIGEM.PLANO = PARAMETROECD.PLANOREFERENCIAL)
                    JOIN ED_CONTAPLANOSREFERENCIAIS CONTAREFERENCIAL ON (CONTAREFERENCIAL.ORIGEM = CONTAREFERENCIAORIGEM.HANDLE)
                    JOIN ED_CONTAS CONTA ON (CONTA.HANDLE = CONTAREFERENCIAL.CONTA)
                    LEFT JOIN ED_CENTROSCUSTOS CENTROCUSTO ON (CENTROCUSTO.HANDLE = CONTAREFERENCIAL.HANDLECENTROCUSTO)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                AND PERIODO.DATAFINAL BETWEEN PARAMETROECD.DATAINICIAL AND PARAMETROECD.DATAFINAL
                AND PARAMETROECD.UTILIZAPLANOGERENCIAL = 1
                AND CONTAREFERENCIAL.DATAINCLUSAO &lt;= PERIODO.DATAFINAL
                AND CONTAREFERENCIAL.HANDLE = (SELECT MAX(MAXCONTA.HANDLE)
                                                 FROM ED_CONTAPLANOSREFERENCIAIS MAXCONTA
                                                WHERE MAXCONTA.ORIGEM = CONTAREFERENCIAL.ORIGEM
                                                  AND MAXCONTA.CONTA = CONTAREFERENCIAL.CONTA
                                                  AND MAXCONTA.DATAINCLUSAO &lt;= PERIODO.DATAFINAL
                                                  AND MAXCONTA.DATAINCLUSAO = (SELECT MAX(MAXDATA.DATAINCLUSAO)
                                                                                 FROM ED_CONTAPLANOSREFERENCIAIS MAXDATA
                                                                                WHERE MAXDATA.ORIGEM = MAXCONTA.ORIGEM
                                                                                  AND MAXDATA.CONTA = CONTAREFERENCIAL.CONTA
                                                                                  AND MAXDATA.DATAINCLUSAO &lt;= PERIODO.DATAFINAL))) AND (A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3230_at6428_hsf8e07414.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_PLANO_CONTAS__PLANO_DE_CONTAS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6427" Title="I052 - Códigos de aglutinação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTACODAGLUTINACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTAAGLUTINADORA.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_PARAMETROS PARAMETROECD ON PARAMETROECD.EMPRESA = PERIODO.EMPRESA
                    JOIN ED_PARAMETROPLANOS PLANO ON PLANO.PARAMETRO = PARAMETROECD.HANDLE
                    JOIN CT_CONTAGERENCIALCONTAS CONTAREFERENCIAORIGEM ON CONTAREFERENCIAORIGEM.PLANO = PLANO.PLANOBALANCO
                    JOIN ED_CONTACODAGLUTINACAO CONTAAGLUTINADORA ON CONTAAGLUTINADORA.ORIGEM = CONTAREFERENCIAORIGEM.HANDLE
                    JOIN ED_CONTAS CONTA ON CONTA.HANDLE = CONTAAGLUTINADORA.CONTA
                    LEFT JOIN ED_CENTROSCUSTOS CENTROCUSTO ON (CENTROCUSTO.HANDLE = CONTAAGLUTINADORA.HANDLECENTROCUSTO)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                AND PERIODO.DATAFINAL BETWEEN PARAMETROECD.DATAINICIAL AND PARAMETROECD.DATAFINAL
                AND PERIODO.DATAINICIAL BETWEEN PLANO.MESINICIAL AND PLANO.MESFINAL
                AND CONTAAGLUTINADORA.DATAINCLUSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                AND CONTAAGLUTINADORA.DATAINCLUSAO BETWEEN PLANO.MESINICIAL AND PLANO.MESFINAL) AND (A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3231_at6427_hsa82c7d64.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_PLANO_CONTAS__PLANO_DE_CONTAS_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7890" Title="I053 - Subcontas correlatas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_SUBCONTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5378_at7890_hs4a4367fe.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_PLANO_CONTAS__PLANO_DE_CONTAS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    