<%@ Page Title="Pessoas" Language="C#" Inherits="aga.a.administracao.Pessoas,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS" class="active"><a data-toggle="tab" href="#tabPESSOAS">Pessoas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="METASDEVENDAS"><a data-toggle="tab" href="#tabMETASDEVENDAS">Metas de vendas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRANSPORTADORES"><a data-toggle="tab" href="#tabTRANSPORTADORES">Transportadores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_924"><a data-toggle="tab" href="#tabWIDGET_924">Avalistas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_751"><a data-toggle="tab" href="#tabWIDGET_751">Contatos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_923"><a data-toggle="tab" href="#tabWIDGET_923">Contratos factoring</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DEPENDENTES"><a data-toggle="tab" href="#tabDEPENDENTES">Dependentes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6626"><a data-toggle="tab" href="#tabWIDGET_6626">Histórico SERASA</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4394"><a data-toggle="tab" href="#tabWIDGET_4394">Limites de crédito</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2564"><a data-toggle="tab" href="#tabWIDGET_2564">Locais de entrega</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3392"><a data-toggle="tab" href="#tabWIDGET_3392">Ocorrências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6734"><a data-toggle="tab" href="#tabWIDGET_6734">Políticas comerciais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7332"><a data-toggle="tab" href="#tabWIDGET_7332">Regimes especiais de tributação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1980"><a data-toggle="tab" href="#tabWIDGET_1980">Regiões</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5286"><a data-toggle="tab" href="#tabWIDGET_5286">Relacionamentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_727"><a data-toggle="tab" href="#tabWIDGET_727">Sócios</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1979"><a data-toggle="tab" href="#tabWIDGET_1979">Telefones</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INSCRIESESTADUAIS"><a data-toggle="tab" href="#tabINSCRIESESTADUAIS">Inscrição estadual</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabPESSOAS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAS.CUSTOM.CORPORATIVO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="5"  /></div>
        </div>
        <div class="tab-pane" id="tabMETASDEVENDAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="METASDEVENDAS" Title="Metas de vendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAMETAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/metasVendas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="6"  /></div>
        </div>
        <div class="tab-pane" id="tabTRANSPORTADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TRANSPORTADORES" Title="Transportadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOATRANSPORTADORAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/Transportadores.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="7"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="8"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_924">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_924" Title="Avalistas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAVALISTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1241_at924_hs32d2e1a7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_751">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_751" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at751_hs37287c85.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_923">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_923" Title="Contratos factoring" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_FC_CONTRATOSFACTORING.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1240_at923_hs609d1b99.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabDEPENDENTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DEPENDENTES" Title="Dependentes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOADEPENDENTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PESSOA= @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/Dependentes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="22"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6626">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6626" Title="Histórico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6626_hs771bf0d7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4394">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4394" Title="Limites de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOASLIMITESCREDITO.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/LimiteCredito.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2564">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2564" Title="Locais de entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAENDERECOSENTREGA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1372_at2564_hsaf9d53dd.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3392">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3392" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAOCORRENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t867_at3392_hs390d8b85.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6734">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6734" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6734_hs81ab7d98.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7332">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7332" Title="Regimes especiais de tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASREGIMESESPECIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4970_at7332_hsad93c4b2.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1980">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1980" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at1980_hs40f371fa.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5286">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5286" Title="Relacionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARELACIONAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3256_at5286_hs92dc6e0e.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_727">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_727" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.SOCIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t901_at727_hs930a668a.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1979">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1979" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at1979_hs5cbbe887.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabINSCRIESESTADUAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INSCRIESESTADUAIS" Title="Inscrição estadual" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PESSOAS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAINSCRICOESESTADUAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/inscricaoestadual.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ADM_PESSOAS" Level="20" Order="100"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
        <script type="text/javascript">
            function MapearCNPJ () {
	$("#ctl00_Main_PESSOAS_CGCCPF_HiddenField").val($("#CUSTOM_CGCCPF").val());
}

            </script>
      </asp:Content>
    