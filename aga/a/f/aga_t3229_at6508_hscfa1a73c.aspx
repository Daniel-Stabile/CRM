<%@ Page Title="Contas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_CONTAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_FCONT_PLANOCONTAS__CONTAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6509" Title="I051 - Contas do plano referencial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_CONTAPLANOSREFERENCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ORIGEM IN (
   SELECT REL.HANDLE
     FROM CT_CONTAGERENCIALCONTAS REL
    WHERE REL.PLANO = 
       (SELECT PAR.PLANOREFERENCIAL
          FROM ED_PARAMETROSFCONT PAR
         WHERE PAR.EMPRESA = @EMPRESAMESTRE(ED_PARAMETROSFCONT)
           AND (SELECT PERIODO.DATAINICIAL
                  FROM ED_PERIODOS PERIODO
                 WHERE PERIODO.HANDLE = @RASTRO(ED_PERIODOS) 
                )
               BETWEEN PAR.DATAINICIAL AND PAR.DATAFINAL
        )
  ) AND (A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3230_at6509_hs13724a3.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_FCONT_PLANOCONTAS__CONTAS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    