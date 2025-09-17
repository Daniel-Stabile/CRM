<%@ Page Title="Saídas - REG.C100: NF CÓDIGOS  01, 1B,04,55, 65" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Saídas - REG.C100: NF CÓDIGOS  01, 1B,04,55, 65" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="1"  />
        <wes:AjaxForm runat="server" ID="WIDGET_8059" Title="REG.C101: PARTILHA DO ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOINFPARTILHAICMS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5610" Title="REG.C110: INFORMAÇÃO COMPLEMENTAR" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOOBSERVACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3148_at5610_hs5cded6cd.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5613" Title="REG.C130: ISSQN, IRRF E PREVIDÊNCIA SOC." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOIMPOSTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3139_at5613_hsa22dc003.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5611" Title="REG.C140: FATURA (01)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOFATURA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3135_at5611_hs44d5349e.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5614" Title="REG.C160: VOLUMES TRANSPORTADOS S/ COMB." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE = ( SELECT DOCUMENTO.HANDLE 
               FROM ED_DOCUMENTOS DOCUMENTO,
                    ED_MODELOS MODELO,
                    ED_PERIODOS PERIODO
              WHERE DOCUMENTO.MODELO = MODELO.HANDLE
                AND (  ( MODELO.CODIGO = '01' )
                    OR ( MODELO.CODIGO =  '1' )
                    OR ( MODELO.CODIGO = '04' )
                    OR ( MODELO.CODIGO =  '4' )
                    )
                AND (  ( DOCUMENTO.QUANTIDADETRANSPORTADA &gt; 0 )
                    OR ( DOCUMENTO.PESOBRUTO &gt; 0 )
                    OR ( DOCUMENTO.PESOLIQUIDO &gt; 0 )
                    )
                AND PERIODO.FILIAL = DOCUMENTO.FILIAL
                AND ( DOCUMENTO.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL )
                AND PERIODO.PERFILDECLARACAO IN ( 1,2 )
                AND DOCUMENTO.ENTRADASAIDA = 'S'  
                AND DOCUMENTO.HANDLE = @RASTRO(ED_DOCUMENTOS)
           )" FormUrl="~/aga/a/f/aga_t3133_at5614_hs8a241dd4.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5615" Title="REG.C170: ITENS DO DOC (01, 1B, 04 e 55)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3137_at5615_hs996bb4bc.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="35"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5612" Title="REG.C195 : OBS.LANC.FISCAL (01, 1B E 55)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DOCUMENTOLANCOBS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3154_at5612_hs620e54d3.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C100_FORM" Level="20" Order="40"  />
        </div>
    
      </asp:Content>
    