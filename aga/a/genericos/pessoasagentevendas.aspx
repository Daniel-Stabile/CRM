<%@ Page Title="Agente vendas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="AGENTEDEVENDA" Title="Financeiro - Agentes de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAS.CUSTOM.COMERCIAL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ABRANGNCIACEPS_1" class="active"><a data-toggle="tab" href="#tabABRANGNCIACEPS_1"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Abrangência CEP's")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="METASDEVENDAS"><a data-toggle="tab" href="#tabMETASDEVENDAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Metas de vendas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRANSPORTADORES"><a data-toggle="tab" href="#tabTRANSPORTADORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Transportadores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinaturas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLIENTES"><a data-toggle="tab" href="#tabCLIENTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Clientes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TELEFONES"><a data-toggle="tab" href="#tabTELEFONES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Telefones")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabABRANGNCIACEPS_1">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="ABRANGNCIACEPS_1" Title="Abrangência CEP's" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENTEDEVENDA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAAGENTECEPS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabMETASDEVENDAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="METASDEVENDAS" Title="Metas de vendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENTEDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAMETAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/metasVendas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTRANSPORTADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TRANSPORTADORES" Title="Transportadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENTEDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOATRANSPORTADORAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="
(A.PESSOA = @CAMPO(HANDLE))
" FormUrl="~/aga/a/adm/pessoas/Transportadores.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENTEDEVENDA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/assinaturas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabCLIENTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLIENTES" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENTEDEVENDA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_PESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AGENTEVENDAS = @CAMPO(HANDLE)) AND (A.EHCLIENTE = 'S')" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabTELEFONES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TELEFONES" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENTEDEVENDA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at1979_hs5cbbe887.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASAGENTEVENDAS" Level="20" Order="80"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    