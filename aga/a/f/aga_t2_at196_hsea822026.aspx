<%@ Page Title="Grupo de segurança" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Grupo de segurança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="1"  />
      <div class="col-md-8"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_199" class="active"><a data-toggle="tab" href="#tabWIDGET_199"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Árvores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3205"><a data-toggle="tab" href="#tabWIDGET_3205"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Árvores genéricas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1819"><a data-toggle="tab" href="#tabWIDGET_1819"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comandos da aplicação a esconder")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5075"><a data-toggle="tab" href="#tabWIDGET_5075"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comandos da aplicação a liberar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5231"><a data-toggle="tab" href="#tabWIDGET_5231"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Este grupo é permissão adicional para...")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3022"><a data-toggle="tab" href="#tabWIDGET_3022"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filtro de registros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1803"><a data-toggle="tab" href="#tabWIDGET_1803"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pastas/Módulos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4807"><a data-toggle="tab" href="#tabWIDGET_4807"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Restrições por registro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_198"><a data-toggle="tab" href="#tabWIDGET_198"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tabelas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_197"><a data-toggle="tab" href="#tabWIDGET_197"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Usuários")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_199">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_199" Title="Árvores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOARVORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t319_at199_hsba26e431.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3205">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3205" Title="Árvores genéricas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOARVORESGENERICAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2334_at3205_hs641d393b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1819">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1819" Title="Comandos da aplicação a esconder" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOCOMANDOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERMISSAO = 'E' AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1663_at1819_hs5cf98cc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5075">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5075" Title="Comandos da aplicação a liberar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOCOMANDOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERMISSAO = 'L' AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1663_at5075_hs8eec4abd.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5231">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5231" Title="Este grupo é permissão adicional para..." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_Z_GRUPOUSUARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="( 
  A.HANDLE IN 
    ( 
      SELECT USUARIO FROM Z_GRUPOUSUARIOGRUPOS 
      WHERE GRUPOADICIONADO = @RASTRO(Z_GRUPOS) 
    ) 
)" FormUrl="~/aga/a/f/aga_t3_at5231_hsba4a2d07.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3022">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3022" Title="Filtro de registros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_FILTROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERMISSAO = 'S') AND (A.CATEGORIA &lt;&gt;  4) AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t631_at3022_hsfd62c225.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1803">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1803" Title="Pastas/Módulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOARVORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t319_at1803_hscae363f0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4807">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4807" Title="Restrições por registro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_FILTROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PERMISSAO = 'S' AND A.CATEGORIA = 4 AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t631_at4807_hs7475cfc2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_198">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_198" Title="Tabelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOTABELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.GRUPO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t318_at198_hs38c02828.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_197">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_197" Title="Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_GRUPOUSUARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.GRUPO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t3_at197_hsc8a22e4d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_GRUPOS_DE_SEGURANCA_FORM" Level="20" Order="90"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    