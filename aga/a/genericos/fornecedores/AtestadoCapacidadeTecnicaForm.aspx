<%@ Page Title="Atestado capacidade técnica" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ATESTADOCAPACIDADETCNICA" Title="Atestado capacidade técnica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_ATESTADOTEC.ATESTADOCAPACIDADETECNICA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS" class="active"><a data-toggle="tab" href="#tabASSINATURAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinaturas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEIS"><a data-toggle="tab" href="#tabRESPONSVEIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEISDOCONTRATADO"><a data-toggle="tab" href="#tabRESPONSVEISDOCONTRATADO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis do contratado")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICOS"><a data-toggle="tab" href="#tabHISTRICOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Históricos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATESTADOCAPACIDADETCNICA" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATESTADOTEC = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATESTADOCAPACIDADETCNICA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_ATESTADOTECANEXOS.ANEXOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATESTADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/atestadoCapacidadeTecnica/Anexos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATESTADOCAPACIDADETCNICA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_ATESTADOTECITENS.ITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATESTADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/atestadoCapacidadeTecnica/Itens.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEIS" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATESTADOCAPACIDADETCNICA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOCOORDENADORES.RESPONSAVEIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATESTADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/atestadoCapacidadeTecnica/Responsaveis.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEISDOCONTRATADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEISDOCONTRATADO" Title="Responsáveis do contratado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATESTADOCAPACIDADETCNICA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_ATESTADOTECFORNECEDOR.RESPONSAVEISDOCONTRATADO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATESTADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/atestadoCapacidadeTecnica/ResponsaveisDoContratado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICOS" Title="Históricos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATESTADOCAPACIDADETCNICA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_STATUS.HISTORICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'GN_ATESTADOTEC') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/genericos/fornecedores/atestadoCapacidadeTecnica/Historicos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_FORNECEDORES_ATESTADOCAPACIDADETECNICAFORM" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    