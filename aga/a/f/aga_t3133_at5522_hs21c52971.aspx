<%@ Page Title="Entradas - REG.C100: NF CÓDIGOS 01, 1B,04,55" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Entradas - REG.C100: NF CÓDIGOS 01, 1B,04,55" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="1"  />
        <wes:AjaxForm runat="server" ID="WIDGET_8062" Title="REG.C101: PARTILHA DO ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOINFPARTILHAICMS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5527" Title="REG.C110: INFORMAÇÃO COMPLEMENTAR" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOOBSERVACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3148_at5527_hs975be643.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5733" Title="REG.C120: OPERAÇÃO IMPORTAÇÃO (01 e 55)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOIMPORTACAO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT DOCUMENTOIMPORTACAO.HANDLE
  FROM ED_DOCUMENTOIMPORTACAO DOCUMENTOIMPORTACAO,
       ED_DOCUMENTOS DOCUMENTO,
       ED_PERIODOS PERIODO,
       ED_MODELOS MODELO
 WHERE DOCUMENTOIMPORTACAO.DOCUMENTO = DOCUMENTO.HANDLE
   AND DOCUMENTO.ENTRADASAIDA = 'E'
   AND DOCUMENTO.FILIAL IN (SELECT HANDLE
                              FROM FILIAIS
                             WHERE HANDLE = PERIODO.FILIAL
                                OR FILIALEMITENTE = PERIODO.FILIAL)
   AND ( ( DOCUMENTO.ENTRADASAIDA = 'E'
           AND DOCUMENTO.DATAENTRADA BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL )
          OR ( DOCUMENTO.ENTRADASAIDA = 'S'
               AND DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL ) )
   AND DOCUMENTO.MODELO = MODELO.HANDLE
   AND MODELO.CODIGO IN ( '1', '01', '55' )
   AND PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
) AND (A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3134_at5733_hs7f524414.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5530" Title="REG.C140: FATURA (01)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOFATURA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3135_at5530_hsc4a12d4a.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5600" Title="REG.C170: ITENS DO DOC (01, 1B, 04 e 55)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3137_at5600_hs1b1b528.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5536" Title="REG.C195 : OBS.LANC.FISCAL (01, 1B E 55)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOLANCOBS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3154_at5536_hsf7027988.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_ENTRADAS__REG_C100_FORM" Level="20" Order="35"  />
        </div>
    
      </asp:Content>
    