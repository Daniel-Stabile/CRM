<%@ Page Title="EFD - Contribuições" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="EFD - Contribuições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6704" Title="Apuração - COFINS&gt;REG.1500: CONTROLE DE CRÉDITOS FISCAIS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCCONTROLECREDITO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
              SELECT CONTROLE.HANDLE
                FROM ED_PCCONTROLECREDITO CONTROLE
                JOIN ED_PCPERIODOS PERIODO 
                  ON (
                       PERIODO.ESTABELECIMENTOMATRIZ = CONTROLE.ESTABELECIMENTOMATRIZ  
                   AND PERIODO.DATAINICIAL = CONTROLE.MESAPURACAO)
               WHERE CONTROLE.TIPOIMPOSTO = 2
                 AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
            )" FormUrl="~/aga/a/f/aga_t4423_at6704_hs15bd419f.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6705" Title="Apuração - COFINS&gt;REG.1700: CONTROLE DE VALORES RETIDOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCSALDORETENCOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT SALDO.HANDLE
    FROM ED_PCSALDORETENCOES SALDO
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = SALDO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = SALDO.PERIODOESCRITURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE SALDO.IMPOSTO = 2)" FormUrl="~/aga/a/f/aga_t4262_at6705_hsd06e5869.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6688" Title="Apuração - COFINS&gt;REG.M500: CRÉDITO RELATIVO AO PERÍODO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAO APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 2)" FormUrl="~/aga/a/f/aga_t4411_at6688_hs25b9419f.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6701" Title="Apuração - COFINS&gt;REG.M600: CONSOLIDAÇÃO DA CONTRIBUIÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOCONSOLIDACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAOCONSOLIDACAO APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 2
             )" FormUrl="~/aga/a/f/aga_t4414_at6701_hs3dc2e3ce.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6702" Title="Apuração - COFINS&gt;REG.M700: CONTRIBUIÇÃO DIFERIDA ANTERIOR" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAODIFERIMENTOMESANT.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAODIFERIMENTOMESANT APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
        AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
        AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 2)" FormUrl="~/aga/a/f/aga_t4418_at6702_hse06a5869.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6703" Title="Apuração - COFINS&gt;REG.M800: RECEITAS ISENTAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOISENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAOISENTOS APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 2)" FormUrl="~/aga/a/f/aga_t4420_at6703_hsf873fa98.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="35"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6699" Title="Apuração - PIS&gt;REG.1100: CONTROLE DE CRÉDITOS FISCAIS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCCONTROLECREDITO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
              SELECT CONTROLE.HANDLE
                FROM ED_PCCONTROLECREDITO CONTROLE
                JOIN ED_PCPERIODOS PERIODO 
                  ON (
                       PERIODO.ESTABELECIMENTOMATRIZ = CONTROLE.ESTABELECIMENTOMATRIZ 
                   AND PERIODO.DATAINICIAL = CONTROLE.MESAPURACAO
                   AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                     )
               WHERE CONTROLE.TIPOIMPOSTO = 1
            )" FormUrl="~/aga/a/f/aga_t4423_at6699_hsa08e3f2f.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="40"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6700" Title="Apuração - PIS&gt;REG.1300: CONTROLE DE VALORES RETIDOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCSALDORETENCOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT SALDO.HANDLE
    FROM ED_PCSALDORETENCOES SALDO
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = SALDO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = SALDO.PERIODOESCRITURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE SALDO.IMPOSTO = 1)" FormUrl="~/aga/a/f/aga_t4262_at6700_hsa08e3f31.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="45"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6683" Title="Apuração - PIS&gt;REG.M100: CRÉDITO RELATIVO AO PERÍODO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAO APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                   )
    WHERE APURACAO.TIPOIMPOSTO = 1)" FormUrl="~/aga/a/f/aga_t4411_at6683_hs523f2f.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="50"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6692" Title="Apuração - PIS&gt;REG.M200: CONSOLIDAÇÃO DA CONTRIBUIÇÃO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOCONSOLIDACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAOCONSOLIDACAO APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 1)" FormUrl="~/aga/a/f/aga_t4414_at6692_hs523f32.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="55"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6693" Title="Apuração - PIS&gt;REG.M300: CONTRIBUIÇÃO DIFERIDA ANTERIOR" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAODIFERIMENTOMESANT.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAODIFERIMENTOMESANT APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 1)" FormUrl="~/aga/a/f/aga_t4418_at6693_hs523f31.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="60"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6694" Title="Apuração - PIS&gt;REG.M350: FOLHA DE SALÁRIOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOFOLHAPAGAMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAOFOLHAPAGAMENTO APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    )" FormUrl="~/aga/a/f/aga_t4419_at6694_hs553f31.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="65"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_1824_6695" Title="Apuração - PIS&gt;REG.M400: RECEITAS ISENTAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOISENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
  SELECT APURACAO.HANDLE
    FROM ED_PCAPURACAOISENTOS APURACAO 
    JOIN ED_PCPERIODOS PERIODO ON (
           PERIODO.ESTABELECIMENTOMATRIZ = APURACAO.ESTABELECIMENTOMATRIZ 
       AND PERIODO.DATAINICIAL = APURACAO.MESAPURACAO
       AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS) 
                                  )
    WHERE APURACAO.TIPOIMPOSTO = 1)" FormUrl="~/aga/a/f/aga_t4420_at6695_hs523f34.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="70"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6417" Title="Consultoria arquivo magnético" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONSULTORIASQL.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="REGISTRO IN (
               SELECT HANDLE
                 FROM ED_CONSULTORIAREGISTROS
                WHERE TIPOESCRITURACAO = 2
            ) AND (A.PERIODOPISCOFINS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4172_at6417_hs7f1fbed0.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="75"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6296" Title="Dados dos contabilistas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOCONTABILISTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4078_at6296_hs87f47076.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="80"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6224" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_FILIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN
           ( SELECT MAX (FILIAL.HANDLE)
               FROM ED_FILIAIS FILIAL,
                    TR_ESTABELECIMENTOSFILIAIS ESTABELECIMENTOFILIAL,
                    ED_PCPERIODOS PERIODO
              WHERE FILIAL.DATAINCLUSAO &lt;= PERIODO.DATAFINAL
                AND ESTABELECIMENTOFILIAL.ESTABELECIMENTOMATRIZ = PERIODO.ESTABELECIMENTOMATRIZ
                AND FILIAL.ORIGEM = ESTABELECIMENTOFILIAL.FILIAL
                AND PERIODO.HANDLE = @RASTRO(ED_PCPERIODOS)
              GROUP BY FILIAL.ORIGEM
           )" FormUrl="~/aga/a/f/aga_t4002_at6224_hs6b2fffd6.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="85"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6223" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCLOG.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4015_at6223_hsb97bf064.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="90"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6681" Title="REG.0120: Períodos dispensados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOSDISPENSADOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4386_at6681_hse8367343.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="95"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6646" Title="REG.P200: CONSOLIDAÇÃO CONTR. PREV." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOCPREVCONSOLIDACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4301_at6646_hs24ee79a1.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6611" Title="REG.P200: CONSOLIDAÇÃO CONTR. PREV." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCAPURACAOCPREVCONSOLIDACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4301_at6611_hs458194c2.aspx" UserDefinedDisableRowSelection="False" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="105"  />
        <wes:AjaxForm runat="server" ID="WIDGET_6289" Title="Regimes de apuração e apropriação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOREGIMEAPURACAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="SPED_COMPETENCIAS__ESCRITURACAO_FISCAL_DIGITAL_PISCOFINS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    