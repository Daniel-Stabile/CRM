<%@ Page Title="ECD - Escrituração Contábil Digital" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="ECD - Escrituração Contábil Digital" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PERIODOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7188" Title="1 - Identificação da Pessoa Jurídica&gt;0007 - Outras inscrições do empresário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_OUTRASINSCRICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3222_at7188_hs73d7504b.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7189" Title="1 - Identificação da Pessoa Jurídica&gt;0020 - Escrituração Descentralizada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_ESCRITADESCENTRALIZADA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3223_at7189_hsbab0db57.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7255" Title="1 - Identificação da Pessoa Jurídica&gt;Filial do período" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PERIODOFILIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3403_at7255_hs909aeee8.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7190" Title="2 - Cadastro dos Participantes&gt;0150 - Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT HANDLE
  FROM ED_PESSOAS MAXHANDLE
 WHERE MAXHANDLE.HANDLE IN (SELECT MAX(HANDLE)
                              FROM ED_PESSOAS MAXPESSOA
                             WHERE MAXPESSOA.ORIGEM = MAXHANDLE.ORIGEM
                                   AND MAXPESSOA.DATAINCLUSAO =
                                   (
                                       SELECT MAX(PESSOA.DATAINCLUSAO) DATAINCLUSAO
                                              FROM ED_PERIODOS PERIODO
                                                   JOIN ED_LANCAMENTOSCONTABEIS LANCAMENTOCONTABIL ON (LANCAMENTOCONTABIL.EMPRESA = PERIODO.EMPRESA)
                                                   JOIN ED_LANCAMENTOPARTIDAS LANCAMENTOPARTIDA ON (LANCAMENTOCONTABIL.HANDLE = LANCAMENTOPARTIDA.LANCAMENTO)
                                                   JOIN ED_PESSOAS PESSOA ON (PESSOA.HANDLE = LANCAMENTOPARTIDA.PARTICIPANTE)
                                             WHERE LANCAMENTOCONTABIL.DATA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                                                   AND PESSOA.DATAINCLUSAO &lt;= PERIODO.DATAFINAL
                                                   AND PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                                                   AND PESSOA.ORIGEM = MAXPESSOA.ORIGEM
                                           )
                                       ) )" FormUrl="~/aga/a/f/aga_t3128_at7190_hs13cb7e21.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7193" Title="3 - Escrituração Contábil&gt;Balancete Diário&gt;I300 - Balancete Diário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_BALANCETESDIARIOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.DATA &gt;= (SELECT DATAINICIAL FROM ED_PERIODOS WHERE HANDLE = @RASTRO(ED_PERIODOS))
AND 
A.DATA &lt;= (SELECT DATAFINAL FROM ED_PERIODOS WHERE HANDLE = @RASTRO(ED_PERIODOS))
AND
A.FILIAL = (SELECT FILIAL FROM ED_PERIODOS WHERE HANDLE = @RASTRO(ED_PERIODOS))" FormUrl="~/aga/a/f/aga_t3238_at7193_hs6e9e934f.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="30"  />
        <wes:AjaxForm runat="server" ID="WIDGET_1521_8448" Title="3 - Escrituração Contábil&gt;Conglomerados Econômicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_REGISTROK030.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="35"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7194" Title="3 - Escrituração Contábil&gt;Demonstrações Contábeis&gt;J005 - Demonstrações Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DEMONSTRACOESCONTABEIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3246_at7194_hs19d10a19.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="40"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_8115" Title="3 - Escrituração Contábil&gt;I012 - Livros Auxiliares ao Diário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_LIVROSAUXILIARES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (

SELECT LIVRO.HANDLE
  FROM ED_LIVROSAUXILIARES LIVRO
  JOIN ED_PERIODOS PERIODO
    ON LIVRO.PERIODO = PERIODO.HANDLE
 WHERE PERIODO.LIVRORESUMIDO = ( @RASTRO(ED_PERIODOS) )

)" FormUrl="~/aga/a/f/aga_t3225_at8115_hs9fd984d7.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="45"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_8114" Title="3 - Escrituração Contábil&gt;I012 - Livros Auxiliares ao Diário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_LIVROSAUXILIARES.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3225_at8114_hsf207d847.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="50"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_8113" Title="3 - Escrituração Contábil&gt;I015 - Contas da Escrituração Resumida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PERIODOCONTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (

SELECT PERIODOCONTA.HANDLE
  FROM ED_PERIODOCONTAS PERIODOCONTA
  JOIN ED_PERIODOS PERIODO
    ON PERIODOCONTA.PERIODO = PERIODO.HANDLE
 WHERE PERIODO.LIVRORESUMIDO = ( @RASTRO(ED_PERIODOS) )

)" FormUrl="~/aga/a/f/aga_t3396_at8113_hsa7e5908.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="55"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_8112" Title="3 - Escrituração Contábil&gt;I015 - Contas da Escrituração Resumida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PERIODOCONTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3396_at8112_hs47011000.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="60"  />
        <wes:AjaxForm runat="server" ID="WIDGET_1521_7191" Title="3 - Escrituração Contábil&gt;I030 - Termo de Abertura" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_TERMOABERTURA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="65"  />
        <wes:AjaxForm runat="server" ID="WIDGET_1521_8442" Title="3 - Escrituração Contábil&gt;J801 - Termo de Verificação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_TERMOVERIFICACAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="70"  />
        <wes:AjaxForm runat="server" ID="WIDGET_1521_7192" Title="3 - Escrituração Contábil&gt;J900 - Termo de Encerramento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_TERMOSENCERRAMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="75"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7195" Title="3 - Escrituração Contábil&gt;Lançamentos Contábeis&gt;I075 - Históricos Padrões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_HISTORICOSPADROES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT MAX(HANDLE)
                      FROM ED_HISTORICOSPADROES
                     WHERE EMPRESA = A.EMPRESA
                           AND CODIGO = A.CODIGO
                           AND DATAINCLUSAO =
                           (
                               SELECT MAX(DATAINCLUSAO)
                                      FROM ED_HISTORICOSPADROES
                                     WHERE EMPRESA = A.EMPRESA
                                           AND CODIGO = A.CODIGO
                                           AND DATAINCLUSAO &lt;=
                                           (
                                               SELECT DATAFINAL
                                                      FROM ED_PERIODOS
                                                     WHERE HANDLE = @RASTRO(ED_PERIODOS)
                                                   )
                                           )
                                   )
                                   AND A.EMPRESA =
                                   (
                                       SELECT EMPRESA
                                              FROM ED_PERIODOS
                                             WHERE HANDLE = @RASTRO(ED_PERIODOS)
                                           )" FormUrl="~/aga/a/f/aga_t3232_at7195_hs41f50bf5.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="80"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_2126_5471" Title="3 - Escrituração Contábil&gt;Lançamentos Contábeis&gt;I200 - Lançamentos Contábeis&gt;Enc" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_LANCAMENTOSCONTABEIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT LANCAMENTOCONTABIL.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_LANCAMENTOSCONTABEIS LANCAMENTOCONTABIL ON (LANCAMENTOCONTABIL.PERIODO = PERIODO.HANDLE)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                AND (LANCAMENTOCONTABIL.TIPO = 'E')) AND (A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3236_at5471_hs50f3b0eb.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="85"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_2126_5470" Title="3 - Escrituração Contábil&gt;Lançamentos Contábeis&gt;I200 - Lançamentos Contábeis&gt;Nor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_LANCAMENTOSCONTABEIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT LANCAMENTOCONTABIL.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_LANCAMENTOSCONTABEIS LANCAMENTOCONTABIL ON (LANCAMENTOCONTABIL.PERIODO = PERIODO.HANDLE)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                AND (LANCAMENTOCONTABIL.TIPO = 'N')) AND (A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3236_at5470_hs90fc7db2.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="90"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7208" Title="3 - Escrituração Contábil&gt;Livros Auxiliares" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PERIODOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="TIPOESCRITURACAO = 2 AND INDESCRITURACAOCONTABIL IN ('A', 'Z') AND (A.LIVRORESUMIDO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3127_at7208_hs4eb736c.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="95"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7196" Title="3 - Escrituração Contábil&gt;Plano de Contas&gt;I050 - Plano de Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTA.HANDLE
                    FROM ED_PERIODOS PERIODO
                         JOIN ED_PARAMETROS PARAMETROECD ON PARAMETROECD.EMPRESA = PERIODO.EMPRESA
                         JOIN CT_CONTASGERENCIAIS CONTAGERENCIAL ON CONTAGERENCIAL.PLANO = PARAMETROECD.PLANOCONTAS
                         JOIN ED_CONTAS CONTA ON CONTA.ORIGEMCONTAGERENCIAL = CONTAGERENCIAL.HANDLE
                   WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                         AND
                         (
                             (
                                 CONTA.HANDLE =
                                 (
                                     SELECT MAX(MAXCONTA.HANDLE)
                                            FROM ED_CONTAS MAXCONTA
                                           WHERE MAXCONTA.ORIGEMCONTAGERENCIAL = CONTA.ORIGEMCONTAGERENCIAL
                                                 AND MAXCONTA.VERSAO = CONTA.VERSAO
                                                 AND MAXCONTA.EMPRESA = CONTA.EMPRESA
                                                 AND MAXCONTA.DATAINCLUSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                                                 AND MAXCONTA.DATAINCLUSAO =
                                                 (
                                                     SELECT MAX(MAXDATA.DATAINCLUSAO)
                                                            FROM ED_CONTAS MAXDATA
                                                           WHERE MAXDATA.ORIGEMCONTAGERENCIAL = MAXCONTA.ORIGEMCONTAGERENCIAL
                                                                 AND MAXDATA.VERSAO = MAXCONTA.VERSAO
                                                                 AND MAXDATA.EMPRESA = MAXCONTA.EMPRESA
                                                                 AND MAXDATA.DATAINCLUSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                                                         )
                                                     )
                                         )
                                         OR
                                         (
                                             CONTA.HANDLE =
                                             (
                                                 SELECT MAX(MAXCONTA.HANDLE)
                                                        FROM ED_CONTAS MAXCONTA
                                                       WHERE MAXCONTA.ORIGEMCONTAGERENCIAL = CONTA.ORIGEMCONTAGERENCIAL
                                                             AND MAXCONTA.VERSAO = CONTA.VERSAO
                                                             AND MAXCONTA.EMPRESA = CONTA.EMPRESA
                                                             AND MAXCONTA.DATAINCLUSAO &lt; PERIODO.DATAINICIAL
                                                             AND MAXCONTA.DATAINCLUSAO =
                                                             (
                                                                 SELECT MAX(MAXDATA.DATAINCLUSAO)
                                                                        FROM ED_CONTAS MAXDATA
                                                                       WHERE MAXDATA.ORIGEMCONTAGERENCIAL = MAXCONTA.ORIGEMCONTAGERENCIAL
                                                                             AND MAXDATA.VERSAO = MAXCONTA.VERSAO
                                                                             AND MAXDATA.EMPRESA = MAXCONTA.EMPRESA
                                                                             AND MAXDATA.DATAINCLUSAO &lt; PERIODO.DATAINICIAL
                                                                     )
                                                                 )
                                                     )
                                                 )
                                             ) 

OR A.HANDLE IN (

SELECT CONTA.HANDLE
                      FROM ED_PERIODOS PERIODO
                           JOIN ED_PARAMETROS PARAMETROECD ON PARAMETROECD.EMPRESA = PERIODO.EMPRESA
                           JOIN ED_CONTAS CONTA ON CONTA.VERSAO = PARAMETROECD.PLANOATIVO
                           JOIN CT_CONTAS ORIGEM ON ORIGEM.HANDLE = CONTA.ORIGEMCONTA
                     WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                           AND
                           (
                               (
                                   CONTA.HANDLE =
                                   (
                                       SELECT MAX(MAXCONTA.HANDLE)
                                              FROM ED_CONTAS MAXCONTA
                                             WHERE MAXCONTA.ORIGEMCONTA = CONTA.ORIGEMCONTA
                                                   AND MAXCONTA.VERSAO = CONTA.VERSAO
                                                   AND MAXCONTA.EMPRESA = CONTA.EMPRESA
                                                   AND MAXCONTA.DATAINCLUSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                                                   AND MAXCONTA.DATAINCLUSAO =
                                                   (
                                                       SELECT MAX(MAXDATA.DATAINCLUSAO)
                                                              FROM ED_CONTAS MAXDATA
                                                             WHERE MAXDATA.ORIGEMCONTA = MAXCONTA.ORIGEMCONTA
                                                                   AND MAXDATA.VERSAO = MAXCONTA.VERSAO
                                                                   AND MAXDATA.EMPRESA = MAXCONTA.EMPRESA
                                                                   AND MAXDATA.DATAINCLUSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                                                           )
                                                       )
                                           )
                                           OR
                                           (
                                               CONTA.HANDLE =
                                               (
                                                   SELECT MAX(MAXCONTA.HANDLE)
                                                          FROM ED_CONTAS MAXCONTA
                                                         WHERE MAXCONTA.ORIGEMCONTA = CONTA.ORIGEMCONTA
                                                               AND MAXCONTA.VERSAO = CONTA.VERSAO
                                                               AND MAXCONTA.EMPRESA = CONTA.EMPRESA
                                                               AND MAXCONTA.DATAINCLUSAO &lt; PERIODO.DATAINICIAL
                                                               AND MAXCONTA.DATAINCLUSAO =
                                                               (
                                                                   SELECT MAX(MAXDATA.DATAINCLUSAO)
                                                                          FROM ED_CONTAS MAXDATA
                                                                         WHERE MAXDATA.ORIGEMCONTA = MAXCONTA.ORIGEMCONTA
                                                                               AND MAXDATA.VERSAO = MAXCONTA.VERSAO
                                                                               AND MAXDATA.EMPRESA = MAXCONTA.EMPRESA
                                                                               AND MAXDATA.DATAINCLUSAO &lt; PERIODO.DATAINICIAL
                                                                       )
                                                                   )
                                                       )
                                                   )

)" FormUrl="~/aga/a/f/aga_t3229_at7196_hsc1acc6f1.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7197" Title="3 - Escrituração Contábil&gt;Plano de Contas&gt;I100 - Centro de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CENTROSCUSTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CENTROCUSTO.HANDLE
               FROM ED_CENTROSCUSTOS CENTROCUSTO
              WHERE CENTROCUSTO.EMPRESA = (SELECT EMPRESA
                                             FROM ED_PERIODOS
                                            WHERE HANDLE = @RASTRO(ED_PERIODOS))
                AND CENTROCUSTO.HANDLE IN (SELECT MAX(HANDLE)
                                             FROM ED_CENTROSCUSTOS
                                            WHERE EMPRESA = CENTROCUSTO.EMPRESA
                                              AND CODIGO = CENTROCUSTO.CODIGO
                                              AND DATAINCLUSAO = (SELECT MAX(DATAINCLUSAO)
                                                                    FROM ED_CENTROSCUSTOS
                                                                   WHERE DATAINCLUSAO &lt;= (SELECT DATAFINAL
                                                                                            FROM ED_PERIODOS
                                                                                           WHERE HANDLE = @RASTRO(ED_PERIODOS))
                                                                     AND EMPRESA = CENTROCUSTO.EMPRESA
                                                                     AND CODIGO = CENTROCUSTO.CODIGO)))" FormUrl="~/aga/a/f/aga_t3233_at7197_hs71a81386.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="105"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7198" Title="3 - Escrituração Contábil&gt;Saldo das Contas Antes do Encerramento&gt;I350 - Saldo An" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_SALDOSCONTASRESULTADO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT SALDOCONTARESULTADO.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_SALDOSCONTASRESULTADO SALDOCONTARESULTADO ON (SALDOCONTARESULTADO.EMPRESA = PERIODO.EMPRESA)
              WHERE SALDOCONTARESULTADO.DATA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                AND PERIODO.HANDLE =  @RASTRO(ED_PERIODOS))" FormUrl="~/aga/a/f/aga_t3240_at7198_hs9884ce6.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="110"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_2123_7199" Title="3 - Escrituração Contábil&gt;Saldos Periódicos&gt;I150 - Saldos Periódicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_SALDOSPERIODICOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT SALDOPERIODICO.HANDLE
               FROM ED_SALDOSPERIODICOS SALDOPERIODICO, ED_PERIODOS PERIODO
              WHERE PERIODO.EMPRESA = SALDOPERIODICO.EMPRESA
                AND PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                AND SALDOPERIODICO.DATAINICIAL &gt;= PERIODO.DATAINICIAL
                AND SALDOPERIODICO.DATAFINAL &lt;= PERIODO.DATAFINAL) AND (A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3234_at7199_hsaa2e6f9d.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="115"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7832" Title="4 - Signatários da escrituração&gt;J930 - Signatários da escrituração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_TERMOENCERRAMENTOSIGNATARIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @RASTRO(ED_PERIODOS)) AND (A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3251_at7832_hsec5c636c.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="120"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1521_7830" Title="5 - Ident. Auditores Independentes&gt;J935 - Auditores Independentes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_AUDITORESINDEPENDENTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOENCERRAMENTO IN ( SELECT B.HANDLE FROM ED_TERMOSENCERRAMENTO B WHERE B.PERIODO = @RASTRO(ED_PERIODOS)))" FormUrl="~/aga/a/f/aga_t5358_at7830_hs85a4bc1a.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="125"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5280" Title="Histórico de Geração do Arquivo ECD" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_LOG.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3219_at5280_hsee4430af.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_CONTABIL_DIGITAL_FORM" Level="20" Order="130"  />
        </div>
    
      </asp:Content>
    