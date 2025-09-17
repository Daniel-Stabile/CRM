<%@ Page Title="Filiais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_FILIAIS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_6328" Title="Cadastros&gt;Informação Complementar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_OBSERVACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT MAX(OBSERVACAO.HANDLE)
    FROM ED_OBSERVACOES OBSERVACAO,
         ED_PCDOCUMENTOOBSERVACOES DOCUMENTOOBSERVACAO,
         FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PCPERIODOS PERIODO,
         ED_PCDOCUMENTOS DOCUMENTO,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
         ED_MODELOS MODELO
   WHERE DOCUMENTO.MODELO = MODELO.HANDLE
     AND (  ( DOCUMENTO.ENTRADASAIDA = 'E'
            AND DOCUMENTO.DATAENTRADA &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAENTRADA &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAENTRADA &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAENTRADA &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL )
           OR ( DOCUMENTO.ENTRADASAIDA = 'S'
            AND DOCUMENTO.DATAEMISSAO &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAEMISSAO &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAEMISSAO &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAEMISSAO &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL ) )
     AND DOCUMENTOOBSERVACAO.DOCUMENTO = DOCUMENTO.HANDLE
     AND DOCUMENTOOBSERVACAO.OBSERVACAO = OBSERVACAO.HANDLE
     AND MODELO.CODIGO IN ( '1', '01', '1B', '2', '02', '2D', '2E',
                            '3', '03', '4', '04', '6', '06', '7', '07',
                            '8', '08', '8B', '9', '09', '10', '11',
                            '21', '22', '26', '27', '28', '29', '55',
                            '57', '59')
     AND DOCUMENTO.REDUCAOZ IS NULL
     AND DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
           (
              FILIALORIGEM.HANDLE = FILIAL.HANDLE
           AND
             FILIAL.FILIALEMITENTE IS NULL
           )
         OR
            FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND (    (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 2)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 3)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 4)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 5) )
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY OBSERVACAO.ORIGEM
)" FormUrl="~/aga/a/f/aga_t3153_at6328_hs3b14e982.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_6327" Title="Cadastros&gt;Naturezas Fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_NATUREZASFISCAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT MAX(NATUREZAFISCAL.HANDLE)
    FROM ED_NATUREZASFISCAIS NATUREZAFISCAL,
         FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PCPERIODOS PERIODO,
         ED_PCDOCUMENTOS DOCUMENTO,
         ED_PCDOCUMENTOITENS DOCUMENTOITEM,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
         ED_MODELOS MODELO
   WHERE DOCUMENTO.MODELO = MODELO.HANDLE
     AND (  ( DOCUMENTO.ENTRADASAIDA = 'E'
            AND DOCUMENTO.DATAENTRADA &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAENTRADA &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAENTRADA &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAENTRADA &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL )
           OR ( DOCUMENTO.ENTRADASAIDA = 'S'
            AND DOCUMENTO.DATAEMISSAO &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAEMISSAO &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAEMISSAO &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAEMISSAO &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL ) )
     AND DOCUMENTOITEM.DOCUMENTO = DOCUMENTO.HANDLE
     AND DOCUMENTOITEM.NATUREZAFISCAL = NATUREZAFISCAL.HANDLE
     AND MODELO.CODIGO IN ( '1', '01', '1B', '4', '04', '55')
     AND DOCUMENTO.REDUCAOZ IS NULL
     AND DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
           (
              FILIALORIGEM.HANDLE = FILIAL.HANDLE
           AND
             FILIAL.FILIALEMITENTE IS NULL
           )
         OR
            FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND (    (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 2)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 3)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 4)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 5) )
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY NATUREZAFISCAL.ORIGEM
)" FormUrl="~/aga/a/f/aga_t3132_at6327_hsf40de982.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_6225" Title="Cadastros&gt;Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT MAX(PESSOA.HANDLE)
    FROM ED_PESSOAS PESSOA,
         FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PCPERIODOS PERIODO,
         ED_PCDOCUMENTOS DOCUMENTO,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
         ED_MODELOS MODELO
   WHERE DOCUMENTO.MODELO = MODELO.HANDLE
     AND (  (    DOCUMENTO.ENTRADASAIDA = 'E'
             AND DOCUMENTO.DATAENTRADA &gt;= PERIODO.DATAINICIAL
             AND DOCUMENTO.DATAENTRADA &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
             AND DOCUMENTO.DATAENTRADA &lt;= PERIODO.DATAFINAL
             AND DOCUMENTO.DATAENTRADA &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL )
          OR(    DOCUMENTO.ENTRADASAIDA = 'S'
             AND DOCUMENTO.DATAEMISSAO &gt;= PERIODO.DATAINICIAL
             AND DOCUMENTO.DATAEMISSAO &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
             AND DOCUMENTO.DATAEMISSAO &lt;= PERIODO.DATAFINAL
             AND DOCUMENTO.DATAEMISSAO &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL ) )
     AND (   DOCUMENTO.PESSOA = PESSOA.HANDLE
          OR DOCUMENTO.TRANSPORTADORA = PESSOA.HANDLE)
     AND MODELO.CODIGO IN ( '1', '01', '1B', '2', '02', '2D', '2E',
                            '3', '03', '4', '04', '6', '06',
                            '7', '07', '8', '08', '8B', '9', '09',
                            '10','11', '21', '22', '26', '27', '28',
                            '29', '55', '57', '59')
     AND DOCUMENTO.REDUCAOZ IS NULL
     AND DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             )
           OR
             FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND (    (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 2)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 3)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 4)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 5) )
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM
                              FROM ED_FILIAIS
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY PESSOA.ORIGEM
   UNION
  SELECT MAX(PESSOA.HANDLE)
    FROM FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PESSOAS PESSOA,
         ED_PCPERIODOS PERIODO,
         ED_PCOPERACOESFISCAIS OPERACAOFISCAL,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
   WHERE OPERACAOFISCAL.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND OPERACAOFISCAL.PESSOA = PESSOA.HANDLE
     AND OPERACAOFISCAL.DATAOPERACAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
     AND OPERACAOFISCAL.DATAOPERACAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             )
           OR
             FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM
                              FROM ED_FILIAIS
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY PESSOA.ORIGEM
)" FormUrl="~/aga/a/f/aga_t3128_at6225_hs531e8bb1.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_6329" Title="Cadastros&gt;Plano de contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT MAX(CONTACONTABIL.HANDLE)
    FROM ED_CONTAS CONTACONTABIL,
         FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PCPERIODOS PERIODO,
         ED_PCDOCUMENTOS DOCUMENTO,
         ED_PCDOCUMENTOITENS DOCUMENTOITEM,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
         ED_MODELOS MODELO
   WHERE DOCUMENTO.MODELO = MODELO.HANDLE
     AND (  ( DOCUMENTO.ENTRADASAIDA = 'E'
            AND DOCUMENTO.DATAENTRADA &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAENTRADA &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAENTRADA &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAENTRADA &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL )
           OR ( DOCUMENTO.ENTRADASAIDA = 'S'
            AND DOCUMENTO.DATAEMISSAO &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAEMISSAO &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAEMISSAO &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAEMISSAO &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL ) )
     AND DOCUMENTOITEM.DOCUMENTO = DOCUMENTO.HANDLE
     AND DOCUMENTOITEM.CONTACONTABIL = CONTACONTABIL.HANDLE
     AND MODELO.CODIGO IN ( '1', '01', '1B', '2', '02', '2D', '2E',
                            '3', '03', '4', '04', '6', '06', '7',
                            '07', '8', '08', '8B', '9', '09', '10',
                            '11', '21', '22', '26', '27', '28',
                            '29', '55', '57', '59')
     AND DOCUMENTO.REDUCAOZ IS NULL
     AND DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
           (
              FILIALORIGEM.HANDLE = FILIAL.HANDLE
           AND
             FILIAL.FILIALEMITENTE IS NULL
           )
         OR
            FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND (    (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 2)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 3)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 4)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 5) )
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY CONTACONTABIL.ORIGEMCONTA

   UNION
  SELECT MAX(CONTACONTABIL.HANDLE)
    FROM FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_CONTAS CONTACONTABIL,
         ED_PCPERIODOS PERIODO,
         ED_PCOPERACOESFISCAIS OPERACAOFISCAL,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
   WHERE OPERACAOFISCAL.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND OPERACAOFISCAL.CONTACONTABIL = CONTACONTABIL.HANDLE
     AND OPERACAOFISCAL.DATAOPERACAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
     AND OPERACAOFISCAL.DATAOPERACAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             )
           OR
             FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY CONTACONTABIL.ORIGEMCONTA
   
   UNION
  SELECT MAX(CONTACONTABIL.HANDLE)
    FROM FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_CONTAS CONTACONTABIL,
         ED_PCPERIODOS PERIODO,
         ED_PCCREDITOATIVOAQUISICAO CREDITOATIVOAQUISICAO,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
   WHERE CREDITOATIVOAQUISICAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND CREDITOATIVOAQUISICAO.CONTA = CONTACONTABIL.HANDLE
     AND CREDITOATIVOAQUISICAO.DATACREDITO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
     AND CREDITOATIVOAQUISICAO.DATACREDITO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             )
           OR
             FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY CONTACONTABIL.ORIGEMCONTA
   
   UNION
  SELECT MAX(CONTACONTABIL.HANDLE)
    FROM FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_CONTAS CONTACONTABIL,
         ED_PCPERIODOS PERIODO,
         ED_PCCREDITOATIVODEPRECIACAO CREDITOATIVODEPRECIACAO,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
   WHERE CREDITOATIVODEPRECIACAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND CREDITOATIVODEPRECIACAO.CONTA = CONTACONTABIL.HANDLE
     AND CREDITOATIVODEPRECIACAO.DATACREDITO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
     AND CREDITOATIVODEPRECIACAO.DATACREDITO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             )
           OR
             FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY CONTACONTABIL.ORIGEMCONTA
                             
)" FormUrl="~/aga/a/f/aga_t3229_at6329_hs96b55e1d.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_6326" Title="Cadastros&gt;Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PRODUTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT DISTINCT PRODUTO.HANDLE
    FROM ED_PRODUTOS PRODUTO,
         FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PCPERIODOS PERIODO,
         ED_PCDOCUMENTOS DOCUMENTO,
         ED_PCDOCUMENTOITENS DOCUMENTOITEM,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
         ED_MODELOS MODELO
   WHERE DOCUMENTO.MODELO = MODELO.HANDLE
     AND (  ( DOCUMENTO.ENTRADASAIDA = 'E'
            AND DOCUMENTO.DATAENTRADA &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAENTRADA &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAENTRADA &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAENTRADA &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL )
           OR ( DOCUMENTO.ENTRADASAIDA = 'S'
            AND DOCUMENTO.DATAEMISSAO &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAEMISSAO &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAEMISSAO &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAEMISSAO &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL ) )
     AND DOCUMENTOITEM.DOCUMENTO = DOCUMENTO.HANDLE
     AND DOCUMENTOITEM.PRODUTO = PRODUTO.HANDLE
     AND MODELO.CODIGO IN ( '1', '01', '1B', '2', '02', '2D', '2E',
                            '3', '03', '4', '04', '55', '59')
     AND DOCUMENTO.REDUCAOZ IS NULL
     AND DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
           (
              FILIALORIGEM.HANDLE = FILIAL.HANDLE
           AND
             FILIAL.FILIALEMITENTE IS NULL
           )
         OR
            FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND (    (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 2)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 3)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 4)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 5) )
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
)" FormUrl="~/aga/a/f/aga_t3130_at6326_hsaebf004c.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_6325" Title="Cadastros&gt;Unidades de Medida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_UNIDADESMEDIDA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT MAX(UNIDADE.HANDLE)
    FROM ED_UNIDADESMEDIDA UNIDADE,
         FILIAIS FILIALORIGEM,
         FILIAIS FILIAL,
         ED_PCPERIODOS PERIODO,
         ED_PCDOCUMENTOS DOCUMENTO,
         ED_PCDOCUMENTOITENS DOCUMENTOITEM,
         TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
         ED_MODELOS MODELO
   WHERE DOCUMENTO.MODELO = MODELO.HANDLE
     AND (  ( DOCUMENTO.ENTRADASAIDA = 'E'
            AND DOCUMENTO.DATAENTRADA &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAENTRADA &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAENTRADA &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAENTRADA &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL )
           OR ( DOCUMENTO.ENTRADASAIDA = 'S'
            AND DOCUMENTO.DATAEMISSAO &gt;= PERIODO.DATAINICIAL
            AND DOCUMENTO.DATAEMISSAO &gt;= ESTABELECIMENTOFILIAL.VIGENCIAINICIAL
            AND DOCUMENTO.DATAEMISSAO &lt;= PERIODO.DATAFINAL
            AND DOCUMENTO.DATAEMISSAO &lt;= ESTABELECIMENTOFILIAL.VIGENCIAFINAL ) )
     AND DOCUMENTOITEM.DOCUMENTO = DOCUMENTO.HANDLE
     AND DOCUMENTOITEM.UNIDADE = UNIDADE.HANDLE
     AND MODELO.CODIGO IN ( '1', '01', '1B', '2', '02', '2D', '2E',
                            '3', '03', '4', '04', '55', '59')
     AND DOCUMENTO.REDUCAOZ IS NULL
     AND DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
     AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
     AND (
           (
              FILIALORIGEM.HANDLE = FILIAL.HANDLE
           AND
             FILIAL.FILIALEMITENTE IS NULL
           )
         OR
            FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
         )
     AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
     AND (    (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 2)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 3)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 4)
          AND (DOCUMENTO.CODIGOSITUACAO &lt;&gt; 5) )
     AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
     AND FILIAL.HANDLE IN ( SELECT ORIGEM 
                              FROM ED_FILIAIS 
                             WHERE HANDLE = @RASTRO(ED_FILIAIS) )
   GROUP BY UNIDADE.ORIGEM
)" FormUrl="~/aga/a/f/aga_t3129_at6325_hs258a8bb1.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="35"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6438" Title="Movimentação&gt;Entradas&gt;REG.A100: NF SERVIÇO CÓDIGO 03&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('3','03')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6438_hs6e101a27.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="40"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6439" Title="Movimentação&gt;Entradas&gt;REG.A100: NF SERVIÇO CÓDIGO 03&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('3','03')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6439_hs300b4cc4.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="45"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6440" Title="Movimentação&gt;Entradas&gt;REG.C100: NF CÓDIGOS 01, 1B, 04, 55&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('1','01','1B','4','04','55')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
       AND DOCUMENTO.EHENERGIA = 'N'
)" FormUrl="~/aga/a/f/aga_t4001_at6440_hs283a0671.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="50"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6441" Title="Movimentação&gt;Entradas&gt;REG.C100: NF CÓDIGOS 01, 1B, 04, 55&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('1','01','1B','4','04','55')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
       AND DOCUMENTO.EHENERGIA = 'N'
)" FormUrl="~/aga/a/f/aga_t4001_at6441_hs2f72c1e9.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="55"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6442" Title="Movimentação&gt;Entradas&gt;REG.C395: VENDA CÓDIGO 02, 2D, 2E, 59,65&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('2', '02', '2D', '2E', '59', '65')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6442_hsd8b47b0e.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="60"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6443" Title="Movimentação&gt;Entradas&gt;REG.C395: VENDA CÓDIGO 02, 2D, 2E, 59,65&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('2', '02', '2D', '2E', '59', '65')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6443_hsf94d86d.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="65"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6444" Title="Movimentação&gt;Entradas&gt;REG.C500: NF CÓDIGOS 06,28,29,55-Energia&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('6','06','28','29','55')
       AND (MODELO.CODIGO &lt;&gt; 55 OR DOCUMENTO.EHENERGIA = 'S')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6444_hs631e114d.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="70"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6445" Title="Movimentação&gt;Entradas&gt;REG.C500: NF CÓDIGOS 06,28,29,55-Energia&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('6','06','28','29','55')
       AND (MODELO.CODIGO &lt;&gt; 55 OR DOCUMENTO.EHENERGIA = 'S')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6445_hse6be47a4.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="75"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6446" Title="Movimentação&gt;Entradas&gt;REG.D100: TRANSP.7,8,8B,9,10,11,26,27,57&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('7','07','8','08','8B','9','09','10','11','26','27','57')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6446_hs1f781adf.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="80"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6447" Title="Movimentação&gt;Entradas&gt;REG.D100: TRANSP.7,8,8B,9,10,11,26,27,57&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('7','07','8','08','8B','9','09','10','11','26','27','57')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6447_hsb7242784.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="85"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6448" Title="Movimentação&gt;Entradas&gt;REG.D500: COMUNICAÇÃO CÓDIGOS 21, 22&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('21','22')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6448_hs4470f9fa.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="90"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1829_6449" Title="Movimentação&gt;Entradas&gt;REG.D500: COMUNICAÇÃO CÓDIGOS 21, 22&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'E'
       AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAENTRADA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('21','22')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6449_hs1d90ea08.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="95"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6349" Title="Movimentação&gt;Entradas&gt;REG.F100: DEMAIS OPERAÇÕES" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCOPERACOESFISCAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT OPERACAO.HANDLE 
      FROM ED_PCOPERACOESFISCAIS OPERACAO, 
           ED_PCPERIODOS PERIODO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE OPERACAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND OPERACAO.DATAOPERACAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND OPERACAO.DATAOPERACAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL 
       AND OPERACAO.TIPOOPERACAO = 1
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
    )" FormUrl="~/aga/a/f/aga_t4099_at6349_hs8c7207cc.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6372" Title="Movimentação&gt;Entradas&gt;REG.F120: ATIVO IMOBILIZADO-DEPRECIAÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCCREDITOATIVODEPRECIACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT CREDITOATIVODEPRECIACAO.HANDLE 
      FROM ED_PCCREDITOATIVODEPRECIACAO CREDITOATIVODEPRECIACAO, 
           ED_PCPERIODOS PERIODO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE CREDITOATIVODEPRECIACAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND CREDITOATIVODEPRECIACAO.DATACREDITO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND CREDITOATIVODEPRECIACAO.DATACREDITO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL 
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
    )" FormUrl="~/aga/a/f/aga_t4129_at6372_hscd772141.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="105"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6373" Title="Movimentação&gt;Entradas&gt;REG.F130: ATIVO IMOBILIZADO-AQUISIÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCCREDITOATIVOAQUISICAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT CREDITOATIVOAQUISICAO.HANDLE 
      FROM ED_PCCREDITOATIVOAQUISICAO CREDITOATIVOAQUISICAO, 
           ED_PCPERIODOS PERIODO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE CREDITOATIVOAQUISICAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND CREDITOATIVOAQUISICAO.DATACREDITO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND CREDITOATIVOAQUISICAO.DATACREDITO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL 
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
    )" FormUrl="~/aga/a/f/aga_t4130_at6373_hsfe9a07cc.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="110"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6322" Title="Movimentação&gt;Outras informações&gt;REG.1010: PROCESSOS JUDICIAIS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPROCESSOSJUDICIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
              SELECT PROCESSO.HANDLE
                FROM ED_PCPROCESSOSJUDICIAIS PROCESSO,
                     ED_PCDOCUMENTOPROCESSO DOCUMENTOPROCESSO,
                     ED_PCDOCUMENTOS DOCUMENTO,
                     ED_PCPERIODOS PERIODO,
                     ED_MODELOS MODELO
               WHERE DOCUMENTO.MODELO = MODELO.HANDLE
                 AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                 AND MODELO.CODIGO IN ('1','01','2','02','1B','3','03','4',
                                       '04','6','06','7','07','8','08','8B',
                                       '9','09','10','11','21','22','26','27',
                                       '28','29','55','57')
                 AND DOCUMENTO.ENTRADASAIDA = 'E'
                 AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
                 AND DOCUMENTOPROCESSO.DOCUMENTO = DOCUMENTO.HANDLE
                 AND DOCUMENTOPROCESSO.PROCESSOJUDICIAL = PROCESSO.HANDLE
            )
OR 
A.HANDLE IN (
              SELECT PROCESSO.HANDLE
                FROM ED_PCPROCESSOSJUDICIAIS PROCESSO,
                     ED_PCAPURACAOCPREVPROCESSO APURACAOPROCESSO,
                     ED_PCAPURACAOCPREV APURACAO,
                     ED_PCPERIODOS PERIODO
               WHERE APURACAO.PERIODO = PERIODO.HANDLE
                 AND PERIODO.DATAINICIAL BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                 AND APURACAOPROCESSO.APURACAO = APURACAO.HANDLE
                 AND APURACAOPROCESSO.PROCESSOJUDICIAL = PROCESSO.HANDLE
                 AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
            )" FormUrl="~/aga/a/f/aga_t4083_at6322_hsc1fb0296.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="115"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6321" Title="Movimentação&gt;Outras informações&gt;REG.1020: PROCESSOS ADMINISTRATIVOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPROCESSOSADMINISTRATIVOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
              SELECT PROCESSO.HANDLE
                FROM ED_PCPROCESSOSADMINISTRATIVOS PROCESSO,
                     ED_PCDOCUMENTOPROCESSO DOCUMENTOPROCESSO,
                     ED_PCDOCUMENTOS DOCUMENTO,
                     ED_PCPERIODOS PERIODO,
                     ED_MODELOS MODELO
               WHERE DOCUMENTO.MODELO = MODELO.HANDLE
                 AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                 AND MODELO.CODIGO IN ('1','01','2','02','1B','3','03','4',
                                       '04','6','06','7','07','8','08','8B',
                                        '9','09','10','11','21','22','26','27',
                                        '28','29','55','57')
                 AND DOCUMENTO.ENTRADASAIDA = 'E'
                 AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
                 AND DOCUMENTOPROCESSO.DOCUMENTO = DOCUMENTO.HANDLE
                 AND PROCESSO.HANDLE = DOCUMENTOPROCESSO.PROCESSOADMINISTRATIVO
)
OR 
A.HANDLE IN (
              SELECT PROCESSO.HANDLE
                FROM ED_PCPROCESSOSADMINISTRATIVOS PROCESSO,
                     ED_PCAPURACAOCPREVPROCESSO APURACAOPROCESSO,
                     ED_PCAPURACAOCPREV APURACAO,
                     ED_PCPERIODOS PERIODO
               WHERE APURACAO.PERIODO = PERIODO.HANDLE
                 AND PERIODO.DATAINICIAL BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                 AND APURACAOPROCESSO.APURACAO = APURACAO.HANDLE
                 AND APURACAOPROCESSO.PROCESSOADMINISTRATIVO = PROCESSO.HANDLE
                 AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
            )" FormUrl="~/aga/a/f/aga_t4084_at6321_hs208e0a7.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="120"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6529" Title="Movimentação&gt;Outras informações&gt;REG.1300: SALDO DE VALORES RETIDOS-PIS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCSALDORETENCOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERIODOESCRITURACAO &gt;= (SELECT DATAINICIAL FROM ED_PCPERIODOS WHERE HANDLE = @RASTRO(ED_PCPERIODOS))
AND A.PERIODOESCRITURACAO &lt;= (SELECT DATAFINAL FROM ED_PCPERIODOS WHERE HANDLE = @RASTRO(ED_PCPERIODOS))
AND A.IMPOSTO IN (1)" FormUrl="~/aga/a/f/aga_t4262_at6529_hs3bc0808a.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="125"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6530" Title="Movimentação&gt;Outras informações&gt;REG.1700:SALDO DE VALORES RETIDOS-COFINS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCSALDORETENCOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERIODOESCRITURACAO &gt;= (SELECT DATAINICIAL FROM ED_PCPERIODOS WHERE HANDLE = @RASTRO(ED_PCPERIODOS))
AND A.PERIODOESCRITURACAO &lt;= (SELECT DATAFINAL FROM ED_PCPERIODOS WHERE HANDLE = @RASTRO(ED_PCPERIODOS))
AND A.IMPOSTO IN (2)" FormUrl="~/aga/a/f/aga_t4262_at6530_hsa76eb930.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="130"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6450" Title="Movimentação&gt;Saídas&gt;REG.A100: NF SERVIÇO CÓDIGO 03&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'S'
       AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('3','03')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6450_hs3919f75c.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="135"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6451" Title="Movimentação&gt;Saídas&gt;REG.A100: NF SERVIÇO CÓDIGO 03&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'S'
       AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('3','03')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6451_hsc87d6e5c.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="140"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6452" Title="Movimentação&gt;Saídas&gt;REG.C100: NF CÓDIGOS 01, 1B, 04, 55&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'S'
       AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('1','01','1B','4','04','55','65')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at6452_hsed99e632.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="145"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6453" Title="Movimentação&gt;Saídas&gt;REG.C100: NF CÓDIGOS 01, 1B, 04, 55&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'S'
       AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('1','01','1B','4','04','55','65')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at6453_hse5e61382.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="150"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6454" Title="Movimentação&gt;Saídas&gt;REG.C380: VENDA CÓDIGO 02&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOSREGISTROC380.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT REGISTRO.HANDLE
      FROM ED_PCPERIODOSREGISTROC380 REGISTRO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           ED_PCPERIODOS PERIODO,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE REGISTRO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
)" FormUrl="~/aga/a/f/aga_t4110_at6454_hs327a6896.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="155"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6455" Title="Movimentação&gt;Saídas&gt;REG.C380: VENDA CÓDIGO 02&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="1=2" FormUrl="~/aga/a/f/aga_t4001_at6455_hs7ad6ed93.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="160"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6519" Title="Movimentação&gt;Saídas&gt;REG.C400: CUPOM FISCAL CÓDIGOS 02, D2" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_ECF.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT ECF.HANDLE
      FROM ED_PCECFREDUCAOZ REDUCAO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL, 
           ED_ECF ECF
     WHERE REDUCAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND ECF.HANDLE = REDUCAO.ECF
       AND MODELO.HANDLE = ECF.CODMODELO
       AND MODELO.CODIGO IN ('2', '02', '2D')
       AND REDUCAO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL 
       AND REDUCAO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
)" FormUrl="~/aga/a/f/aga_t3158_at6519_hsa0c9f5f7.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="165"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_8202" Title="Movimentação&gt;Saídas&gt;REG.C860: EQUIPAMENTO SAT - CF-E (59)&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'S'
       AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('59')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (2, 4, 6, 8, 10, 12)
)" FormUrl="~/aga/a/f/aga_t4001_at8202_hsf38989ca.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="170"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_8203" Title="Movimentação&gt;Saídas&gt;REG.C860: EQUIPAMENTO SAT - CF-E (59)&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCDOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT DOCUMENTO.HANDLE
      FROM ED_PCDOCUMENTOS DOCUMENTO,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE DOCUMENTO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND DOCUMENTO.MODELO = MODELO.HANDLE
       AND DOCUMENTO.ENTRADASAIDA = 'S'
       AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND DOCUMENTO.DATAEMISSAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND MODELO.CODIGO IN ('59')
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
       AND DOCUMENTO.CLASSIFICACAOPISCOFINS IN (3, 5, 7, 9, 11, 13)
)" FormUrl="~/aga/a/f/aga_t4001_at8203_hs3853bf4e.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="175"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6523" Title="Movimentação&gt;Saídas&gt;REG.D200: TRANSP.7,8,8B,9,10,11,26,27,57" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOSREGISTROD200.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t4250_at6523_hs587e2cfa.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="180"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6609" Title="Movimentação&gt;Saídas&gt;REG.D300: BILHETES - CÓD. 13,14,15,16,18&gt;Gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCBILHETES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT BILHETE.HANDLE
      FROM ED_PCBILHETES BILHETE,
           ED_PCPERIODOS PERIODO,
           ED_MODELOS MODELO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE BILHETE.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND BILHETE.MODELO = MODELO.HANDLE
       AND BILHETE.DATAREFERENCIA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND BILHETE.DATAREFERENCIA BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
)" FormUrl="~/aga/a/f/aga_t4287_at6609_hsac286806.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="185"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_1830_6610" Title="Movimentação&gt;Saídas&gt;REG.D300: BILHETES - CÓD. 13,14,15,16,18&gt;Não gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCBILHETES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="1=2" FormUrl="~/aga/a/f/aga_t4287_at6610_hs337c3d38.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="190"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6652" Title="Movimentação&gt;Saídas&gt;REG.D600: COMUNICAÇÃO/TELECOM. 21,22" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOSREGISTROD600.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t4337_at6652_hse31bff66.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="195"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6350" Title="Movimentação&gt;Saídas&gt;REG.F100: DEMAIS OPERAÇÕES" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCOPERACOESFISCAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT OPERACAO.HANDLE 
      FROM ED_PCOPERACOESFISCAIS OPERACAO, 
           ED_PCPERIODOS PERIODO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE OPERACAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND OPERACAO.DATAOPERACAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND OPERACAO.DATAOPERACAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL 
       AND OPERACAO.TIPOOPERACAO IN ( 2, 3 )
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
    )" FormUrl="~/aga/a/f/aga_t4099_at6350_hsfae3a195.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="200"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6807" Title="Movimentação&gt;Saídas&gt;REG.F200: OPERAÇÕES IMOBILIÁRIAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCOPERACOESIMOB.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t4544_at6807_hs2f593e6a.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="205"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_1827_6531" Title="Movimentação&gt;Saídas&gt;REG.F600: CONTRIBUIÇÃO RETIDA NA FONTE" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCRETENCOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT RETENCAO.HANDLE
      FROM ED_PCRETENCOES RETENCAO,
           ED_PCPERIODOS PERIODO,
           FILIAIS FILIAL,
           FILIAIS FILIALORIGEM,
           TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL
     WHERE RETENCAO.FILIAL = ESTABELECIMENTOFILIAL.FILIAL
       AND ESTABELECIMENTOFILIAL.FILIAL = FILIAL.HANDLE
       AND PERIODO.ESTABELECIMENTOMATRIZ = ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ
       AND (
             (
               FILIALORIGEM.HANDLE = FILIAL.HANDLE
             AND
               FILIAL.FILIALEMITENTE IS NULL
             AND
               FILIAL.HANDLE IN (
                                  SELECT ORIGEM
                                    FROM ED_FILIAIS
                                   WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                )
             )
           OR
             (
               FILIALORIGEM.HANDLE = FILIAL.FILIALEMITENTE
             AND
               FILIAL.FILIALEMITENTE IN (
                                          SELECT ORIGEM
                                            FROM ED_FILIAIS
                                           WHERE HANDLE = @RASTRO(ED_FILIAIS)
                                        )
             )
           )
       AND RETENCAO.DATARETENCAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
       AND RETENCAO.DATARETENCAO BETWEEN ESTABELECIMENTOFILIAL.VIGENCIAINICIAL 
       AND ESTABELECIMENTOFILIAL.VIGENCIAFINAL
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
)" FormUrl="~/aga/a/f/aga_t4247_at6531_hse2d9ff66.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="210"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6642" Title="REG.0145: REGIME APURAÇÃO PREVIDENCIÁRIA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOREGIMEFILIAL.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.FILIAL IN (
              SELECT ORIGEM
                FROM ED_FILIAIS
               WHERE HANDLE = @RASTRO(ED_FILIAIS)
            )" UserDefinedCommandsVisible="True" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="215"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6619" Title="REG.0145: REGIME APURAÇÃO PREVIDENCIÁRIA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOREGIMEFILIAL.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.FILIAL IN (
              SELECT ORIGEM
                FROM ED_FILIAIS
               WHERE HANDLE = @RASTRO(ED_FILIAIS)
            )" UserDefinedCommandsVisible="True" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="220"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7294" Title="REG.I100: CONSOLIDAÇÃO DAS OPERAÇÕES" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOIF.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FILIAL IN (
              SELECT ORIGEM
                FROM ED_FILIAIS
               WHERE HANDLE = @RASTRO(ED_FILIAIS)
            )
AND
A.HANDLE IN (
		SELECT APURACAO.HANDLE
		  FROM ED_PCAPURACAOIF APURACAO
    	    	  JOIN ED_PCPERIODOS PERIODO
                    ON ( APURACAO.DATA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL )
		 WHERE PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
             )" FormUrl="~/aga/a/f/aga_t4927_at7294_hsb5415c9.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="225"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6643" Title="REG.P100: CONTR. PREV. RECEITA BRUTA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOCPREV.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FILIAL IN (
              SELECT ORIGEM
                FROM ED_FILIAIS
               WHERE HANDLE = @RASTRO(ED_FILIAIS)
            )" FormUrl="~/aga/a/f/aga_t4298_at6643_hs6869363e.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="230"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6618" Title="REG.P100: CONTR. PREV. RECEITA BRUTA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOCPREV.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FILIAL IN (
              SELECT ORIGEM
                FROM ED_FILIAIS
               WHERE HANDLE = @RASTRO(ED_FILIAIS)
            )" FormUrl="~/aga/a/f/aga_t4298_at6618_hs6fd1264.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="235"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_7430" Title="Regime de Caixa - Escrituração Consolida&gt;REG.F500: RECEITAS RECEBIDAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCREGIMECAIXARECEITAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t5040_at7430_hs3075fa70.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="240"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_7431" Title="Regime de Caixa - Escrituração Consolida&gt;REG.F510: OPERAÇÕES" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCREGIMECAIXAOPERACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t5038_at7431_hs8dce85d5.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="245"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1826_7432" Title="Regime de Caixa - Escrituração Consolida&gt;REG.F525: COMPOSIÇÃO / DETALHAMENTO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCREGIMECAIXACOMPOSICAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t5037_at7432_hs17f3e3a6.aspx" UserDefinedDisableRowSelection="False" PageId="ED_EFDPC__ED_EFDPC_FILIAIS_FORM" Level="20" Order="250"  />
        </div>
    
      </asp:Content>
    