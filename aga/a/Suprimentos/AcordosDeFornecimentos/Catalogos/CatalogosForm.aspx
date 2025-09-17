<%@ Page Title="Catálogos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="CATLOGOS" Title="catálogos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_CATALOGOSFORNECIMENTO.CATALOGO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS_CATALOGOSFORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS" class="active"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILIAISPARTICIPANTES"><a data-toggle="tab" href="#tabFILIAISPARTICIPANTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filiais participantes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONDIESDEPAGAMENTOPORFAIXA"><a data-toggle="tab" href="#tabCONDIESDEPAGAMENTOPORFAIXA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Condições de pagamento por faixa")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATLOGOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_CATALOGOFORNECIMENTOITENS.ITENS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATALOGOFORNECIMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/AcordosDeFornecimentos/Catalogos/Itens/Itens.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS_CATALOGOSFORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabFILIAISPARTICIPANTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILIAISPARTICIPANTES" Title="Filiais participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATLOGOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_CATALOGOFORNECIMENTOFILIAIS.FILIAISPARTICIPANTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATALOGOFORNECIMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/AcordosDeFornecimentos/Catalogos/FiliaisParticipantes/Filiais.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS_CATALOGOSFORM" Level="20" Order="18"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATLOGOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_CATALOGOFORNECIMENTOANEXOS.ANEXOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATALOGOFORNECIMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/AcordosDeFornecimentos/Catalogos/Anexos/Anexos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS_CATALOGOSFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATLOGOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_STATUS.HISTORICO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CP_CATALOGOSFORNECIMENTO') AND A.HANDLEREGISTROORIGEM = @RASTRO(CP_CATALOGOSFORNECIMENTO))" FormUrl="~/aga/a/f/aga_t1951_at3048_hse4be2108.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS_CATALOGOSFORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabCONDIESDEPAGAMENTOPORFAIXA">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="CONDIESDEPAGAMENTOPORFAIXA" Title="Condições de pagamento por faixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CATLOGOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_CONDICAOPGTOFAIXACATALOGO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.CATALOGO = @CAMPO(HANDLE)" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS_CATALOGOSFORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    