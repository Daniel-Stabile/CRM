<%@ Page Title="I200 - Lançamentos Contábeis - Encerramento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="I200 - Lançamentos Contábeis - Encerramento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_LANCAMENTOSCONTABEIS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_LANCAMENTOS_CONTABEIS__ENCERRAMENTO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5468" Title="I250 - Partidas do Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_LANCAMENTOPARTIDAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PARTIDALANCAMENTO.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_LANCAMENTOSCONTABEIS LANCAMENTOCONTABIL ON (LANCAMENTOCONTABIL.PERIODO = PERIODO.HANDLE)
                    JOIN ED_LANCAMENTOPARTIDAS PARTIDALANCAMENTO ON (PARTIDALANCAMENTO.LANCAMENTO = LANCAMENTOCONTABIL.HANDLE)
                    JOIN ED_CONTAS CONTA ON (CONTA.HANDLE = PARTIDALANCAMENTO.HANDLECONTA)
                    JOIN ED_HISTORICOSPADROES HISTORICO ON (HISTORICO.HANDLE = PARTIDALANCAMENTO.HISTORICOPADRAO)
                    LEFT JOIN ED_CENTROSCUSTOS CENTROCUSTO ON (CENTROCUSTO.HANDLE = PARTIDALANCAMENTO.HANDLECENTROCUSTO)
                    LEFT JOIN ED_PESSOAS PESSOA ON (PESSOA.HANDLE = PARTIDALANCAMENTO.PARTICIPANTE)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)) AND (A.LANCAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3237_at5468_hsac39a0b.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_LANCAMENTOS_CONTABEIS__ENCERRAMENTO_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    