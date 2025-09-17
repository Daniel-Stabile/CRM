<%@ Page Title="Demonstrações Contábeis - J005 - Demonstrações Contábeis" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Demonstrações Contábeis - J005 - Demonstrações Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_DEMONSTRACOESCONTABEIS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_ECD_DEMONSTRACOES_CONTABEIS__DEMONSTRACOES_CONTABEIS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5465" Title="J100 - Balanço Patrimonial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DEMONSTRACAOBALANCO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT BALANCOPATRIMONIAL.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_DEMONSTRACOESCONTABEIS DEMONSTRACAOCONTABIL ON (DEMONSTRACAOCONTABIL.EMPRESA = PERIODO.EMPRESA)
                    JOIN ED_DEMONSTRACAOBALANCO BALANCOPATRIMONIAL ON (BALANCOPATRIMONIAL.DEMONSTRACAOCTB = DEMONSTRACAOCONTABIL.HANDLE)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS) 
                AND DEMONSTRACAOCONTABIL.DATAFINAL BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL) AND (A.DEMONSTRACAOCTB = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3247_at5465_hs1ec55960.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_DEMONSTRACOES_CONTABEIS__DEMONSTRACOES_CONTABEIS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5765" Title="J150 - DRE" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DEMONSTRACAORESULTADO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DRE.HANDLE
               FROM ED_PERIODOS PERIODO
                    JOIN ED_DEMONSTRACOESCONTABEIS DEMONSTRACAOCONTABIL ON (DEMONSTRACAOCONTABIL.EMPRESA = PERIODO.EMPRESA)
                    JOIN ED_DEMONSTRACAORESULTADO DRE ON (DRE.DEMONSTRACAOCTB = DEMONSTRACAOCONTABIL.HANDLE)
              WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS) 
                AND DEMONSTRACAOCONTABIL.DATAFINAL BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL) AND (A.DEMONSTRACAOCTB = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3248_at5765_hs9a4e51e8.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_DEMONSTRACOES_CONTABEIS__DEMONSTRACOES_CONTABEIS_FORM" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7337" Title="J200 - Histórico Fatos Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_HISTORICOSFATOSCONTABEIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT HANDLE 
                FROM ED_HISTORICOSFATOSCONTABEIS 
               WHERE DATAINCLUSAO &gt;= ( SELECT DATAINICIAL 
                                         FROM ED_DEMONSTRACOESCONTABEIS
                                        WHERE HANDLE = @RASTRO(ED_DEMONSTRACOESCONTABEIS)
                                          AND EMPRESA = A.EMPRESA )
                 AND DATAINCLUSAO &lt;= ( SELECT DATAFINAL
                                         FROM ED_DEMONSTRACOESCONTABEIS
                                        WHERE HANDLE = @RASTRO(ED_DEMONSTRACOESCONTABEIS)
                                          AND EMPRESA = A.EMPRESA )
            )" FormUrl="~/aga/a/f/aga_t4982_at7337_hs7da7c0f2.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_DEMONSTRACOES_CONTABEIS__DEMONSTRACOES_CONTABEIS_FORM" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7339" Title="J210 - DLPA/DMPL" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DEMONSTRACOESMUTACAOPATRLIQ.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DEMONSTRACAOCTB = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4984_at7339_hs617007a1.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_DEMONSTRACOES_CONTABEIS__DEMONSTRACOES_CONTABEIS_FORM" Level="20" Order="25"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7187" Title="J800 - Outras Informações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_DEMONSTRACAOOUTRASINFO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DEMONSTRACAOCTB = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3249_at7187_hsb5d529ab.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_ECD_DEMONSTRACOES_CONTABEIS__DEMONSTRACOES_CONTABEIS_FORM" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    