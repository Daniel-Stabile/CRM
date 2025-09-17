<%@ Page Title="2 - Cadastro dos Participantes - 0150 - Participantes" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="2 - Cadastro dos Participantes - 0150 - Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PESSOAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_ECD_CADASTRO_PARTICIPANTES__PARTICIPANTES_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5460" Title="0180 - Identificação do relacionamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PESSOARELACIONAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT HANDLE
  FROM ED_PESSOARELACIONAMENTOS MAXHANDLE
 WHERE MAXHANDLE.HANDLE IN (SELECT MAX(MAXINCLUSAO.HANDLE)
                              FROM ED_PESSOARELACIONAMENTOS MAXINCLUSAO
                             WHERE MAXINCLUSAO.ORIGEM = MAXHANDLE.ORIGEM
                               AND MAXINCLUSAO.DATAINCLUSAO = ( SELECT MAX(RELACIONAMENTO.DATAINCLUSAO) DATAINCLUSAO
                                                                  FROM ED_PERIODOS PERIODO
                                                                  JOIN GN_PESSOARELACIONAMENTOS RELACIONAMENTOORIGEM 
																	ON (RELACIONAMENTOORIGEM.EMPRESA = PERIODO.EMPRESA)
                                                                  JOIN ED_PESSOARELACIONAMENTOS RELACIONAMENTO 
																	ON (RELACIONAMENTO.ORIGEM = RELACIONAMENTOORIGEM.HANDLE)
																  JOIN ED_PESSOAS PESSOA
                                                                    ON PESSOA.ORIGEM = RELACIONAMENTOORIGEM.PESSOA
                                                                  WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
                                                                   AND RELACIONAMENTO.VIGENCIAINICIAL &lt;= PERIODO.DATAFINAL
                                                                   AND RELACIONAMENTO.VIGENCIAFINAL &gt;= PERIODO.DATAINICIAL
                                                                   AND RELACIONAMENTO.EMPRESA = PERIODO.EMPRESA 
																   AND PESSOA.HANDLE = @RASTRO(ED_PESSOAS) 
																) 
							) 
			 ) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3257_at5460_hsd2a211d.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_CADASTRO_PARTICIPANTES__PARTICIPANTES_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    