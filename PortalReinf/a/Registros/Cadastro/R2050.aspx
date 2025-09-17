<%@ Page Title="R-2050 - Comercial. de Prod. por Produtor Rural PJ/Agroind." Language="C#" Inherits="PortalReinf.a.Registro.Cadastro.R2050Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R2050COMERCIALDEPRODPORPRODUTORRURALPJAGROIND" Title="R-2050 - Comercial. de Prod. por Produtor Rural PJ/Agroind." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2050.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R2050_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPODECOMERCIALIZAO" class="active"><a data-toggle="tab" href="#tabTIPODECOMERCIALIZAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipo de Comercialização")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTIPODECOMERCIALIZAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPODECOMERCIALIZAO" Title="Tipo de Comercialização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2050COMERCIALDEPRODPORPRODUTORRURALPJAGROIND" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_TIPOCOMERCIALIZACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R2050 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/TipoComercializacao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2050_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    