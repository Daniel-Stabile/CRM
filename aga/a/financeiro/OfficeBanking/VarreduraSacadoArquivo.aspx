<%@ Page Title="Arquivo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ARQUIVO" class="active"><a data-toggle="tab" href="#tabARQUIVO">Arquivo</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TTULOS"><a data-toggle="tab" href="#tabTTULOS">Títulos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabARQUIVO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ARQUIVO" Title="Arquivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_HBVARREDURASACADO.OFFICEBANKING.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_VARREDURASACADOARQUIVO" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabTTULOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TTULOS" Title="Títulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ARQUIVO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="GN_HBVARREDURASACADOPARCELAS.OFFICEBANKING.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARREDURA = @CAMPO(HANDLE)" FormUrl="~/aga/a/financeiro/OfficeBanking/VarreduraSacadoTitulo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_VARREDURASACADOARQUIVO" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    