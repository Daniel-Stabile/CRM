<%@ Page Title="Aditivos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Aditivos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2893"><a data-toggle="tab" href="#tabWIDGET_2893">Itens/objetos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2894"><a data-toggle="tab" href="#tabWIDGET_2894">Novos itens/objetos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3682"><a data-toggle="tab" href="#tabWIDGET_3682">Novos itens mestres</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2895"><a data-toggle="tab" href="#tabWIDGET_2895">Cláusulas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3729"><a data-toggle="tab" href="#tabWIDGET_3729">Capa do contrato/convênio</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3898"><a data-toggle="tab" href="#tabWIDGET_3898">Histórico</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6258"><a data-toggle="tab" href="#tabWIDGET_6258">Liberar parcelas suspensas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8074"><a data-toggle="tab" href="#tabWIDGET_8074">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8343"><a data-toggle="tab" href="#tabWIDGET_8343">Documentos emitidos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTESDOADITIVONOVO"><a data-toggle="tab" href="#tabASSINANTESDOADITIVONOVO">Assinantes do aditivo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Aditivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOADITIVOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2893">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2893" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE)) AND (A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2220_at2893_hs97d5ac38.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2894">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2894" Title="Novos itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVONOVOSOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2336_at2894_hs79360ff4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3682">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3682" Title="Novos itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVONOVOOBJETOMESTRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2497_at3682_hsdd53a2ea.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2895">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2895" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOCLAUSULAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULAADITIVO IS NULL AND (A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2231_at2895_hs38920bde.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3729">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3729" Title="Capa do contrato/convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOCAPACONTRATO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2529_at3729_hs1c5a779f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3898">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3898" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOADITIVOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_CONTRATOADITIVOS))" FormUrl="~/aga/a/f/aga_t1951_at3898_hs5fd810c0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6258">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6258" Title="Liberar parcelas suspensas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVORETENCAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4033_at6258_hsdff533ae.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8074">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8074" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOADITIVOANEXOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5559_at8074_hse80bbfe9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8343">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8343" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.ADITIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2499_at8343_hsbafa7c59.aspx" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINANTESDOADITIVONOVO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTESDOADITIVONOVO" Title="Assinantes do aditivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOASSINANTESADITIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ADITIVO= @CAMPO(HANDLE) AND A.CONTRATO = @CAMPO(CONTRATO)" FormUrl="~/aga/a/contratos/aditivos/AssinantesAditivo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ASSINATURAS_TODOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATOADITIVO = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOADITIVOS__TODOS_FORM" Level="20" Order="75"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    