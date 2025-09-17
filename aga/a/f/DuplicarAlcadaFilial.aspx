<%@ Page Title="Duplicar alçada filial" Language="C#" CodeFile="~/aga/a/f/DuplicarAlcadaFilial.aspx.cs" Inherits="fDuplicarAlcadaFilialPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COPIARINTEGRANTES" Title="SELECIONAR FILIAL" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_WEBMOTIVOLOGICO.COPIARGRUPOALCADA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="AGA_A_F_DUPLICARALCADAFILIAL" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="SELECIONARFILIAL" Title="Selecionar Filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="FILIAIS.DUPLICAR.ALCADA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_F_DUPLICARALCADAFILIAL" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    