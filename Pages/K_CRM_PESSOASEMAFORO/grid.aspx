<%@ Page Title="Semaforos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_SEMAF" Title="semaforo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOASEMAFORO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Pages/K_CRM_PESSOASEMAFORO/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PESSOASEMAFORO_GRID" Level="50" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_ITEMSDOSEMFORO" class="active"><a data-toggle="tab" href="#tabK_ITEMSDOSEMFORO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do semáforo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_ANDAMENTO"><a data-toggle="tab" href="#tabK_ANDAMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Andamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_DOCUMENTOS"><a data-toggle="tab" href="#tabK_DOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabK_ITEMSDOSEMFORO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_ITEMSDOSEMFORO" Title="Itens do semáforo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="K_SEMAF" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOASEMAFOROITEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SEMAFORO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_PESSOASEMAFOROITEM/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PESSOASEMAFORO_GRID" Level="50" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabK_ANDAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_ANDAMENTO" Title="Andamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="K_SEMAF" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOASEMAFOROANDAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SEMAFORO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_PESSOASEMAFOROANDAMENTO/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PESSOASEMAFORO_GRID" Level="50" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabK_DOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="K_SEMAF" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOASEMAFORODOCUMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SEMAFORO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_PESSOASEMAFORODOCUMENTO/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PESSOASEMAFORO_GRID" Level="50" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    