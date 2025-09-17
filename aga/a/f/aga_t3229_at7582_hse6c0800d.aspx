<%@ Page Title="Plano de contas - J050 - Plano de Contas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Plano de contas - J050 - Plano de Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_CONTAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_ECF_ESCRITURACAO__ED_CARGA_ECF_PLANO_CONTAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7581" Title="J051 - Plano de Contas Referencial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTAPLANOSREFERENCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTAREFERENCIAL.HANDLE
               FROM EDCF_PERIODOS PERIODO
                    JOIN ED_PARAMETROS PARAMETROECD ON (PARAMETROECD.EMPRESA = PERIODO.EMPRESA)
                    JOIN CT_CONTAGERENCIALCONTAS CONTAREFERENCIAORIGEM ON (CONTAREFERENCIAORIGEM.PLANO = PARAMETROECD.PLANOREFERENCIAL)
                    JOIN ED_CONTAPLANOSREFERENCIAIS CONTAREFERENCIAL ON (CONTAREFERENCIAL.ORIGEM = CONTAREFERENCIAORIGEM.HANDLE)
                    JOIN ED_CONTAS CONTA ON (CONTA.HANDLE = CONTAREFERENCIAL.CONTA)
                    LEFT JOIN ED_CENTROSCUSTOS CENTROCUSTO ON (CENTROCUSTO.HANDLE = CONTAREFERENCIAL.HANDLECENTROCUSTO)
              WHERE PERIODO.HANDLE = @RASTRO(EDCF_PERIODOS)
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
                                                                                  AND MAXDATA.DATAINCLUSAO &lt;= PERIODO.DATAFINAL))) AND (A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3230_at7581_hs17e6a29f.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECF_ESCRITURACAO__ED_CARGA_ECF_PLANO_CONTAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    