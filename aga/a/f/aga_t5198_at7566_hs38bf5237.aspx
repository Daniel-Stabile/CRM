<%@ Page Title="Alíquota por classificações de origem" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Alíquota" Subtitle="por classificações de origem" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOPARAMICMS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_DE_IMPOSTOS__IMPOSTOPARAMICMS_FORM" Level="20" Order="1"  />
        <wes:EditableGrid runat="server" ID="CLASSIFICAESDEORIGEM" Title="Classificações de origem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOPARAMICMSCLASORIGEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTOPARAMICMS = @CAMPO(HANDLE))" PageId="CARGA_DE_IMPOSTOS__IMPOSTOPARAMICMS_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    