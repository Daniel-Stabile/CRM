<%@ Page Title="Saídas - REG.C400: EQUIPAMENTO ECF (02 E 2D)" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Saídas - REG.C400: EQUIPAMENTO ECF (02 E 2D)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_ECF.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C400_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7220" Title="REG.C405: REDUÇÃO Z (CÓDIGO 02 E 2D)." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_ECFSREDUCAOZ.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
              SELECT REDUCAOZ.HANDLE 
                FROM ED_ECFSREDUCAOZ REDUCAOZ,
                     ED_ECF ECF,
                     ED_PERIODOS PERIODO
               WHERE REDUCAOZ.DATAMOVIMENTO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                 AND REDUCAOZ.ECF = ECF.HANDLE
                 AND ECF.FILIAL = PERIODO.FILIAL
                 AND VERSAOPROCESSOECF IN ( 2, 3 )
                 AND PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
            ) AND (A.ECF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4843_at7220_hsfca51a80.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C400_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6183" Title="REG.C405: REDUÇÃO Z (CÓDIGO 02 E 2D)." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_ECFREDUCAOZ.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( 
              SELECT REDUCAOZ.HANDLE 
                FROM ED_ECFREDUCAOZ REDUCAOZ,
                     ED_ECF ECF,
                     ED_PERIODOS PERIODO
               WHERE REDUCAOZ.DATAEMISSAO BETWEEN PERIODO.DATAINICIAL AND PERIODO.DATAFINAL
                 AND REDUCAOZ.ECF = ECF.HANDLE
                 AND ECF.FILIAL = PERIODO.FILIAL
                 AND VERSAOPROCESSOECF = 1
                 AND PERIODO.HANDLE = @RASTRO(ED_PERIODOS)
            ) AND (A.ECF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3159_at6183_hsb3d6b441.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_EFD_SAIDAS__REGISTRO_C400_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    