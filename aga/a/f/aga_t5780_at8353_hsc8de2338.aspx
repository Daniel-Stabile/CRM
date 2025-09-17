<%@ Page Title="Termo de referência" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Termo de referência</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8361"><a data-toggle="tab" href="#tabWIDGET_8361">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8387"><a data-toggle="tab" href="#tabWIDGET_8387">Documentos emitidos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8349"><a data-toggle="tab" href="#tabWIDGET_8349">Histórico</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8360"><a data-toggle="tab" href="#tabWIDGET_8360">Itens</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8389"><a data-toggle="tab" href="#tabWIDGET_8389">Recursos de terceiros</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8363"><a data-toggle="tab" href="#tabWIDGET_8363">Responsáveis</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8366"><a data-toggle="tab" href="#tabWIDGET_8366">Versionamentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8394"><a data-toggle="tab" href="#tabWIDGET_8394">Áreas</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Termo de referência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_TR.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8361">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8361" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_TRANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOREFERENCIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5782_at8361_hs5fd3e3d8.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8387">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8387" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_MODELODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOREFERENCIA = @RASTRO(LC_TR))" FormUrl="~/aga/a/f/aga_t2468_at8387_hs6a1026bf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8349">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8349" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'LC_TR') AND  A.HANDLEREGISTROORIGEM = @RASTRO(LC_TR)" FormUrl="~/aga/a/f/aga_t1951_at8349_hsd104efaf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8360">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8360" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_TRITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOREFERENCIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5781_at8360_hsa25d8a68.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8389">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8389" Title="Recursos de terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_TRRECURSOTERCEIROS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOREFERENCIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5791_at8389_hsd404f542.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8363">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8363" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOREFERENCIA = @RASTRO(LC_TR))" FormUrl="~/aga/a/f/aga_t2051_at8363_hs6064d54f.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8366">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8366" Title="Versionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_TR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TRORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5780_at8366_hsaed5a290.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8394">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8394" Title="Áreas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_TRAREAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TERMOREFERENCIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5800_at8394_hs89fd83e4.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DE_REQUISICAO_LEITURA__LC_TR_FORM" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    