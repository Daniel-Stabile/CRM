<%@ Page Title="Integrantes do grupo de alçada" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Integrante do grupo de alçada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_GRUPOALCADASINTEGRANTES.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="CARGA_ALCADAS__INTEGRANTES__GRUPOS_FORM" Level="20" Order="1"  />
        <wes:EditableGrid runat="server" ID="USURIOSAUTORIZADOS" Title="Usuários autorizados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_GRUPOALCADASUSUARIOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INTEGRANTE = @CAMPO(HANDLE) AND A.GRUPO = @CAMPO(GRUPO))" PageId="CARGA_ALCADAS__INTEGRANTES__GRUPOS_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    