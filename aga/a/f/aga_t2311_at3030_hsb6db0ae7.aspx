<%@ Page Title="Requisições - Cadastradas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Requisições - Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CP_REQUISICOESPAI.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="1"  />
    <wes:SimpleGrid runat="server" ID="WIDGET_3048" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CP_REQUISICOESPAI') AND A.HANDLEREGISTROORIGEM = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t1951_at3048_hse4be2108.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3041" class="active"><a data-toggle="tab" href="#tabWIDGET_3041">Itens (todos)</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3271"><a data-toggle="tab" href="#tabWIDGET_3271">Itens de compra</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3272"><a data-toggle="tab" href="#tabWIDGET_3272">Itens de consumo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5422"><a data-toggle="tab" href="#tabWIDGET_5422">Itens de consumo de produção</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3433"><a data-toggle="tab" href="#tabWIDGET_3433">Itens de contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7451"><a data-toggle="tab" href="#tabWIDGET_7451">Itens de reclassificação de estoque</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3273"><a data-toggle="tab" href="#tabWIDGET_3273">Itens de transferência de almoxarifado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3274"><a data-toggle="tab" href="#tabWIDGET_3274">Itens de transferência de filial</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8350"><a data-toggle="tab" href="#tabWIDGET_8350">Termo de referência</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3041">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3041" Title="Itens (todos)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at3041_hs8ec058d0.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3271">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3271" Title="Itens de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'C' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at3271_hsfb3ec64.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3272">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3272" Title="Itens de consumo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'O' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at3272_hsca548e97.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5422">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5422" Title="Itens de consumo de produção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'P' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at5422_hsdfe0a176.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3433">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3433" Title="Itens de contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'N' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at3433_hs20c168b1.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7451">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7451" Title="Itens de reclassificação de estoque" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'R' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at7451_hs73fe43cc.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3273">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3273" Title="Itens de transferência de almoxarifado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'T' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at3273_hsda370bf6.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3274">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3274" Title="Itens de transferência de filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'F' AND A.REQUISICAOPAI = @RASTRO(CP_REQUISICOESPAI))" FormUrl="~/aga/a/f/aga_t868_at3274_hs46747671.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8350">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8350" Title="Termo de referência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_TR.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLE IN (SELECT TERMOREFERENCIA FROM CP_REQUISICOESPAI WHERE HANDLE = @RASTRO(CP_REQUISICOESPAI)))" FormUrl="~/aga/a/f/aga_t5780_at8350_hs2c3de65a.aspx" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICAOPAIANEXOS.ANEXO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/Suprimentos/OrdensCompra/Requisicoes/anexoPai.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQUISICOESPAI__CADASTRADAS_FORM" Level="20" Order="65"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    