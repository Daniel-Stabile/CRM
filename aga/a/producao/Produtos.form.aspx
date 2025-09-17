<%@ Page Title="Estruturas de produtos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="PRODUTO" Title="Produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ESTRUTURASPRODUTOS_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="COMPRADOS" class="active"><a data-toggle="tab" href="#tabCOMPRADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comprados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFAS"><a data-toggle="tab" href="#tabTAREFAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCOMPRADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="COMPRADOS" Title="Comprados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PRODUTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ESTRUTURASPRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PRODUTOPAI = @CAMPO(HANDLE)
AND A.PRODUTO IN (
    SELECT B.HANDLE FROM PD_PRODUTOS B
    WHERE B.HANDLE = A.PRODUTO
    AND B.TIPO IN (1,2,3,4,5,6)
    AND DATAFINAL &gt;= GETDATE()
    )
" FormUrl="~/aga/a/Producao/EstruturasProduto.form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ESTRUTURASPRODUTOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PRODUTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ESTRUTURATAREFAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Producao/EstruturaTarefas.form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ESTRUTURASPRODUTOS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <style>
            .fa-object-group:before {
    font-size: 24px;
}
.nav-item .fa-sitemap:before {
    font-size: 14px;
}
.mega-menu-submenu .fa-sitemap:before {
    font-size: 14px;
}
#CMD_MANUFATURADO_record .fa-sitemap:before {
    font-size: 14px;
}
.fa-sitemap:before {
    font-size: 24px;
}
.fa-briefcase:before {
    font-size: 24px;
}
.fa-gears:before {
    font-size: 24px;
}
.fa-sticky-note-o:before {
    font-size: 24px;
}
.fa-money:before {
    font-size: 24px;
}
            </style>
      </asp:Content>
    