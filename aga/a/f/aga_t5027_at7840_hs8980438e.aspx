<%@ Page Title="Papéis de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Papéis de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_PAPEISTRABALHO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CT_PAPEISTRABALHO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AJUSTES" class="active"><a data-toggle="tab" href="#tabAJUSTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ajustes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7375"><a data-toggle="tab" href="#tabWIDGET_7375"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Composições")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabAJUSTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AJUSTES" Title="Ajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PAPEISTRABALHOAJUSTES.PAPELTRABALHO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PAPELTRABALHO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5030_at7377_hsd7f9be5e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CT_PAPEISTRABALHO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7375">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7375" Title="Composições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_COMPOSICOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PAPELTRABALHO = @TABELA(CT_PAPEISTRABALHO)
AND (  ( A.TIPOCOMPOSICAO IN ( 1,2 ) )
    OR ( A.TIPOCOMPOSICAO = 3
       AND A.EMPRESA = @EMPRESA 
       )
    )" FormUrl="~/aga/a/f/aga_t5028_at7375_hs96abf37d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CT_PAPEISTRABALHO_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    