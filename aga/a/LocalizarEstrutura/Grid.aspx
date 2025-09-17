<%@ Page Title="Localizar na Estrutura" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.LocalizarEstrutura.LocalizarEstruturaGridPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRODUTOSDAESTRUTURA" Title="Produtos da Estrutura" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_PRODUTOVARIACOESMESTRE.LOCALIZARESTRUTURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_PR_ESTRUTURALOCALIZAR" Level="20" Order="30"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRODUTOPAINAESTRUTURA" class="active"><a data-toggle="tab" href="#tabPRODUTOPAINAESTRUTURA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produto Pai na Estrutura")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPRODUTOPAINAESTRUTURA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRODUTOPAINAESTRUTURA" Title="Produto Pai na Estrutura" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PRODUTOSDAESTRUTURA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOVARIACOESMESTRE_LOCALIZARNAESTRUTURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PR_ESTRUTURALOCALIZAR" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    