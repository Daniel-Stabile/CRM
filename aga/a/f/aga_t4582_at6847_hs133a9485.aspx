<%@ Page Title="Configuração por estado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Configuração por estado" Subtitle="NFe" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROSDOCELETRONICONFE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM_DOCUMENTOSELETRONICOSNFE__ADM_PRAZOEMISSAONFE_FORM" Level="20" Order="1"  />
        <wes:EditableGrid runat="server" ID="PERCENTUAISDOCONTEDODEIMPORTAO" Title="Percentuais do conteúdo de importação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROSCI.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DOCELETRONICONFE = @CAMPO(HANDLE))" PageId="ADM_DOCUMENTOSELETRONICOSNFE__ADM_PRAZOEMISSAONFE_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    