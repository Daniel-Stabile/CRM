<%@ Page Title="Declarações / Arquivos magnéticos - DIRF" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Declarações / Arquivos magnéticos - DIRF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_DIRF.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6206" class="active"><a data-toggle="tab" href="#tabWIDGET_6206"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comprovantes de rendimento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7330"><a data-toggle="tab" href="#tabWIDGET_7330"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comprovantes publicados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6202"><a data-toggle="tab" href="#tabWIDGET_6202"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6204"><a data-toggle="tab" href="#tabWIDGET_6204"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações complementares")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8299"><a data-toggle="tab" href="#tabWIDGET_8299"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Log comprovantes de rendimentos agendado")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6203"><a data-toggle="tab" href="#tabWIDGET_6203"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6585"><a data-toggle="tab" href="#tabWIDGET_6585"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valores de domiciliados no exterior")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6214"><a data-toggle="tab" href="#tabWIDGET_6214"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valores isentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6755"><a data-toggle="tab" href="#tabWIDGET_6755"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valores rendimentos acumulados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEL"><a data-toggle="tab" href="#tabRESPONSVEL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsável")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6206">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6206" Title="Comprovantes de rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_DIRFVALORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3988_at6206_hs315e1863.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7330">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7330" Title="Comprovantes publicados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFPUBLICACAOCOMPROVANTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4967_at7330_hs35d89952.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6202">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6202" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DISTINCT TR_DIRFVALORES.IMPOSTO FROM TR_DIRFVALORES WHERE TR_DIRFVALORES.DIRF = @RASTRO(TR_DIRF))" FormUrl="~/aga/a/f/aga_t955_at6202_hs2413cbdc.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6204">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6204" Title="Informações complementares" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFINFORMACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3987_at6204_hsf6f7d033.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8299">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8299" Title="Log comprovantes de rendimentos agendado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFLOGS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5760_at8299_hsef207900.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6203">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6203" Title="Valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFVALORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.SOMENTECOMPROVANTE = 'N' AND (A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3988_at6203_hs6bfbf3e4.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6585">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6585" Title="Valores de domiciliados no exterior" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFVALORESEXTERIOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4273_at6585_hsd7dd44a2.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6214">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6214" Title="Valores isentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFVALORESISENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4007_at6214_hsb80d2a4c.aspx" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6755">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6755" Title="Valores rendimentos acumulados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_DIRFVALORESRRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DIRF = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4465_at6755_hs59d4ebf9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEL">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="RESPONSVEL" Title="Responsável" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_DIRFRESPONSAVEL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_DECLARACAOARQUIVOMAGNETICO__DIRF_FORM" Level="20" Order="85"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $(function () {
            var Pagina = window.Sys.WebForms.PageRequestManager.getInstance();
            if (!Pagina.get_isInAsyncPostBack()) {
                Pagina.add_endRequest(function () {
                    ValidarMaxLengthCampo();                        
                });
            }
        })

function ValidarMaxLengthCampo(){
    var campoDDD = $("#ctl00_Main_RESPONSVEL_PageControl_GERAL_GERAL_DDD");
    
    if (campoDDD.length > 0)
    {
        campoDDD.keydown(function(e){
            if (this.value.length > 1){
                e.preventDefault();
                return false;
            }    
        })
    }
}

            </script>
      </asp:Content>
    