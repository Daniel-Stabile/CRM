<%@ Page Title="Novos itens/objetos" Language="C#" Inherits="aga.a.contratos.aga_t2336_at2890_hs55f4b2b1Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Novos itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVONOVOSOBJETOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5948" class="active"><a data-toggle="tab" href="#tabWIDGET_5948"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6744"><a data-toggle="tab" href="#tabWIDGET_6744"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Faixa de Valores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4402"><a data-toggle="tab" href="#tabWIDGET_4402"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do patrimônio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6802"><a data-toggle="tab" href="#tabWIDGET_6802"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Períodos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3441"><a data-toggle="tab" href="#tabWIDGET_3441"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3208"><a data-toggle="tab" href="#tabWIDGET_3208"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5948">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5948" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CN_OBJETOCOMISSOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.NOVOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3712_at5948_hsdf5b6cb6.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6744">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6744" Title="Faixa de Valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ADITIVONOVOOBJETOFAIXAVALOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4456_at6744_hs8d81ab0a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4402">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4402" Title="Itens do patrimônio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_OBJETOPATRIMONIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ADITIVONOVOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2728_at4402_hs45754bf4.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6802">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6802" Title="Períodos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOITEMPERIODOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ADITEM = @RASTRO(CN_ADITIVONOVOSOBJETOS)" FormUrl="~/aga/a/f/aga_t2068_at6802_hscf32bcd3.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3441">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3441" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_ADITIVOENTREGASNOVOSOBJETOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2337_at3441_hs1e359032.aspx" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3208">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3208" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ADITIVOENTREGASNOVOSOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE) AND A.ADITIVO = @CAMPO(ADITIVO))" FormUrl="~/aga/a/f/aga_t2337_at3208_hs7a8c832c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_ADITIVO_PERMISSAO__NOVOSOBJETOS_FORM" Level="20" Order="35"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    