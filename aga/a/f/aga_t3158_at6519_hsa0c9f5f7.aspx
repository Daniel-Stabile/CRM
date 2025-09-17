<%@ Page Title="Saídas - REG.C400: CUPOM FISCAL CÓDIGOS 02, D2" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Saídas - REG.C400: CUPOM FISCAL CÓDIGOS 02, D2" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_ECF.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFDPC_SAIDAS__ED_CARGA_EFDPC_SAIDAS_REGISTROC400GR_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6517" Title="REG. C405: REDUÇÃO Z (2, 2D)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCECFREDUCAOZ.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
    SELECT REDUCAO.HANDLE
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
) AND (A.ECF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4100_at6517_hs71e1d866.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFDPC_SAIDAS__ED_CARGA_EFDPC_SAIDAS_REGISTROC400GR_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6518" Title="REG. C489: PROCESSOS REFERENCIADOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_PCPERIODOSREGISTROC489.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ECF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4115_at6518_hs71d5d86e.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFDPC_SAIDAS__ED_CARGA_EFDPC_SAIDAS_REGISTROC400GR_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    