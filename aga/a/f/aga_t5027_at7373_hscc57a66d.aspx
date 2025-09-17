<%@ Page Title="Papéis de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Papéis de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_PAPEISTRABALHO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PLANO_GERENCIAL__CT_PAPEISTRABALHO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7377" Title="Ajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CT_PAPEISTRABALHOAJUSTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PAPELTRABALHO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5030_at7377_hsd7f9be5e.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PLANO_GERENCIAL__CT_PAPEISTRABALHO_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_7375" Title="Composições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_CT_COMPOSICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PAPELTRABALHO = @TABELA(CT_PAPEISTRABALHO)
AND (  ( A.TIPOCOMPOSICAO IN ( 1,2 ) )
    OR ( A.TIPOCOMPOSICAO = 3
       AND A.EMPRESA = @EMPRESA 
       )
    )" FormUrl="~/aga/a/f/aga_t5028_at7375_hs96abf37d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PLANO_GERENCIAL__CT_PAPEISTRABALHO_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    