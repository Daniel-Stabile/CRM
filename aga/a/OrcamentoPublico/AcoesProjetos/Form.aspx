<%@ Page Title="Cadastramento de Ação do Projeto" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.orcamento.AcoesProjetos" %>
        
            <%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp"
            Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
                <%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
            
            <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
        <div class="row"><div class="col-md-12"><div class="portlet light">
    <div class="row">
      <div class="col-md-2 col-sm-2 col-xs-2" style="padding-right: 0px">
        <ul class="nav nav-tabs tabs-left">
          <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMOP_ACOESPROJETOS" class="active"><a data-toggle="tab" href="#tabFORMOP_ACOESPROJETOS" id="#LI_TAB_FORMOP_ACOESPROJETOS"><i style="margin-right: 5px" class="fa fa-bookmark"></i><span><%=
                                                    Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                Ação do Projeto")%></span></a></li>
          <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICAOORAMENTRIADAAO"><a data-toggle="tab" href="#tabCLASSIFICAOORAMENTRIADAAO" id="#LI_TAB_CLASSIFICAOORAMENTRIADAAO"><i style="margin-right: 5px" class="fa fa-calendar"></i><span><%=
                                                    Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                Períodos Orçamentários")%></span></a></li>
          <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANDAMENTOSDAAO"><a data-toggle="tab" href="#tabANDAMENTOSDAAO" id="#LI_TAB_ANDAMENTOSDAAO"><i style="margin-right: 5px" class="fa fa-cogs"></i><span><%=
                                                    Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                Andamentos da ação")%></span></a></li>
          <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEISDAAO"><a data-toggle="tab" href="#tabRESPONSVEISDAAO" id="#LI_TAB_RESPONSVEISDAAO"><i style="margin-right: 5px" class="fa fa-users"></i><span><%=
                                                    Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                Responsáveis da Ação")%></span></a></li>
          <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS" id="#LI_TAB_ANEXOS"><i style="margin-right: 5px" class="fa fa-paperclip"></i><span><%=
                                                    Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                Anexos")%></span></a></li>
          <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTROLEDEEXECUCAO"><a data-toggle="tab" href="#tabCONTROLEDEEXECUCAO" id="#LI_TAB_CONTROLEDEEXECUCAO"><i style="margin-right: 5px" class="fa fa-dashboard"></i><span><%=
                                                    Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                Controle de Execução")%></span></a></li>
        </ul>
      </div>
      <div class="col-md-10 col-sm-10 col-xs-10" style="padding-left: 0px">
        <div class="tab-container">
          <div class="tab-panel-content active" id="tabFORMOP_ACOESPROJETOS">
                                        <div class="row2" style="border-color: transparent;">
              <div class="row" style="margin-left: -30px;margin-right:-30px;">
        <wes:AjaxForm runat="server" ID="FORMOP_ACOESPROJETOS" Title="Ação do Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-bookmark" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="10"  /></div>
              <div class="tabbable-line">
                <ul class="nav nav-tabs"></ul>
                <div class="tab-container"></div>
              </div>
            </div>
          </div>
          <div class="tab-panel-content" id="tabCLASSIFICAOORAMENTRIADAAO">
                                        <div class="row2" style="border-color: transparent;">
              <div class="row" style="margin-left: -30px;margin-right:-30px;">
        <wes:SimpleGrid runat="server" ID="CLASSIFICAOORAMENTRIADAAO" Title="Períodos Orçamentários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-calendar" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPERIODO.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ACOESPROJETOS = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/AcoesPeriodo/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="20"  /></div>
              <div class="tabbable-line">
                <ul class="nav nav-tabs">
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICAES" class="active&#xA;                                                                "><a data-toggle="tab" href="#tab2CLASSIFICAES" id="#LI_TAB_CLASSIFICAES"><i style="margin-right: 5px" class="fa fa-th-list"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Classificações Orçamentárias
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GESTOESTRATGICA"><a data-toggle="tab" href="#tab2GESTOESTRATGICA" id="#LI_TAB_GESTOESTRATGICA"><i style="margin-right: 5px" class="fa fa-lightbulb-o"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Gestão Estratégica
                                                                        ")%></span></a></li>
                </ul>
                <div class="tab-container">
                  <div class="tab-panel-content active&#xA;                                                                    " id="tab2CLASSIFICAES">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="CLASSIFICAES" Title="Classificações Orçamentárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-th-list" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PERIODO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoOrcamentaria/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="120"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2GESTOESTRATGICA">
                                                            <div class="row2">
                      <div class="row">
        <wes:EditableGrid runat="server" ID="GESTOESTRATGICA" Title="Gestão Estratégica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-lightbulb-o" ShowTitle="false" ProviderWidgetUniqueId="CLASSIFICAOORAMENTRIADAAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PERIODOGESTESTRATEGICA.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ACOESPROJETOS = @CAMPO(ACOESPROJETOS ) AND A.PERIODO = @CAMPO(HANDLE)" ShowExport="True" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="150"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-panel-content" id="tabANDAMENTOSDAAO">
                                        <div class="row2" style="border-color: transparent;">
              <div class="row" style="margin-left: -30px;margin-right:-30px;">
        <wes:SimpleGrid runat="server" ID="ANDAMENTOSDAAO" Title="Andamentos da ação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-cogs" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACAOANDAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PROJETO = @CAMPO(PROJETO) AND A.ACOESPROJETOS = @CAMPO(HANDLE) AND A.CATEGORIA = @CAMPO(CATEGORIA)" FormUrl="~/aga/a/OrcamentoPublico/AcaoAndamentos/Projeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="90"  /></div>
              <div class="tabbable-line">
                <ul class="nav nav-tabs"></ul>
                <div class="tab-container"></div>
              </div>
            </div>
          </div>
          <div class="tab-panel-content" id="tabRESPONSVEISDAAO">
                                        <div class="row2" style="border-color: transparent;">
              <div class="row" style="margin-left: -30px;margin-right:-30px;">
        <wes:SimpleGrid runat="server" ID="RESPONSVEISDAAO" Title="Responsáveis da Ação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-users" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_RESPONSAVEISUNIDADE.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ACOESPROJETOS = @CAMPO(HANDLE) " FormUrl="~/aga/a/OrcamentoPublico/ResponsaveisUnidade/ProjetoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="100"  /></div>
              <div class="tabbable-line">
                <ul class="nav nav-tabs"></ul>
                <div class="tab-container"></div>
              </div>
            </div>
          </div>
          <div class="tab-panel-content" id="tabANEXOS">
                                        <div class="row2" style="border-color: transparent;">
              <div class="row" style="margin-left: -30px;margin-right:-30px;">
        <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-paperclip" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ANEXOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ACOESPROJETOS = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/Anexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="110"  /></div>
              <div class="tabbable-line">
                <ul class="nav nav-tabs"></ul>
                <div class="tab-container"></div>
              </div>
            </div>
          </div>
          <div class="tab-panel-content" id="tabCONTROLEDEEXECUCAO">
                                        <div class="row2" style="border-color: transparent;">
              <div class="row" style="margin-left: -30px;margin-right:-30px;">
        <wes:AjaxForm runat="server" ID="CONTROLEDEEXECUCAO" Title="Controle de Execução" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-dashboard" ShowTitle="false" ProviderWidgetUniqueId="FORMOP_ACOESPROJETOS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="OP_VT_CONTROLEEXECUCAO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="170"  /></div>
              <div class="tabbable-line">
                <ul class="nav nav-tabs">
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DASHBOARD_1" class="active&#xA;                                                                "><a data-toggle="tab" href="#tab2DASHBOARD_1" id="#LI_TAB_DASHBOARD_1"><i style="margin-right: 5px" class="fa fa-dashboard"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Dashboard
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESERVAS"><a data-toggle="tab" href="#tab2RESERVAS" id="#LI_TAB_RESERVAS"><i style="margin-right: 5px" class="fa fa-file"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Reservas
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOSDEEMPENHO"><a data-toggle="tab" href="#tab2PEDIDOSDEEMPENHO" id="#LI_TAB_PEDIDOSDEEMPENHO"><i style="margin-right: 5px" class="fa fa-file"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Empenhos
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AJUSTES"><a data-toggle="tab" href="#tab2AJUSTES" id="#LI_TAB_AJUSTES"><i style="margin-right: 5px" class="fa fa-wrench"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Ajustes
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIQUIDAESRECEBIMENTOS"><a data-toggle="tab" href="#tab2LIQUIDAESRECEBIMENTOS" id="#LI_TAB_LIQUIDAESRECEBIMENTOS"><i style="margin-right: 5px" class="icon-wallet"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Receb. Fiscal
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIQUIDAESCPA"><a data-toggle="tab" href="#tab2LIQUIDAESCPA" id="#LI_TAB_LIQUIDAESCPA"><i style="margin-right: 5px" class="fa fa-reply"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Liquidações CPA
                                                                        ")%></span></a></li>
                  <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PAGAMENTOS"><a data-toggle="tab" href="#tab2PAGAMENTOS" id="#LI_TAB_PAGAMENTOS"><i style="margin-right: 5px" class="fa fa-money"></i><span>
                                                                        <%=
                                                                        Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"
                                                                    Pagamentos
                                                                        ")%></span></a></li>
                </ul>
                <div class="tab-container">
                  <div class="tab-panel-content active&#xA;                                                                    " id="tab2DASHBOARD_1">
                                                            <div class="row2">
                      <div class="row">
        <wes:AjaxForm runat="server" ID="DASHBOARD_1" Title="Dashboard" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-dashboard" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_SIMPLES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(CLASSIFICACAOORCAMENTARIA)" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="24"  /></div>
                      <div class="row">
        <wes:Tile runat="server" ID="VALORORADO" Title="Valor Orçado" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="ORCADO" Description="Valor Orçado" Icon="fa fa-hashtag" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="200"  />
        <wes:Tile runat="server" ID="TOTALAJUSTES" Title="Total Ajustes" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="AJUSTES" Description="Total Ajustes" Icon="fa fa-wrench" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="210"  />
        <wes:Tile runat="server" ID="TOTALAUTORIZADO" Title="Total Autorizado" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="TOTAL_AUTORIZADO" Description="Total Autorizado" Icon="fa fa-thumbs-up" Color="default" ValueAggregation="Sum" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="220"  />
        <wes:Tile runat="server" ID="RESERVAS_1" Title="Reservas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="RESERVADO" Description="Reservas" Icon="fa fa-file" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="230"  />
        <wes:Tile runat="server" ID="EMPENHOS" Title="Empenhos" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="EMPENHADO" Description="Empenhos" Icon="fa fa-file" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="240"  />
        <wes:Tile runat="server" ID="SALDODOEMPENHO" Title="Saldo do Empenho" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="SALDO_EMPENHO" Description="Saldo do Empenho" Icon="fa fa-money" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="250"  />
        <wes:Tile runat="server" ID="LIQUIDAES" Title="Liquidações" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="REALIZADO" Description="Liquidações" Icon="fa fa-file" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="260"  />
        <wes:Tile runat="server" ID="TOTALPAGO" Title="Total pago" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="RECEBIDO_OU_PAGO" Description="Total pago" Icon="fa fa-money" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="270"  />
        <wes:Tile runat="server" ID="SALDOARESERVAR" Title="Saldo a reservar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="4" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_CONTROLEDEEXECUCAO.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(HANDLE)" ValueFormat="R$ ###,###,###,###,##0.00" Value="SALDO_A_RESERVAR" Description="Saldo a reservar" Icon="fa fa-money" Color="default" ValueAggregation="None" TileType="Default" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="280"  /></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2RESERVAS">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="RESERVAS" Title="Reservas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-file" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS_EM_OP_CLASSIFICACAOORCAMENTARIA.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause=" A.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA )" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="25"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2PEDIDOSDEEMPENHO">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="PEDIDOSDEEMPENHO" Title="Empenhos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-file" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_EMPENHOS.ACOESPROJETOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause=" A.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA ) " FormUrl="~/aga/a/financeiro/documentos/Empenho.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="30"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2AJUSTES">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="AJUSTES" Title="Ajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-wrench" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOS_EM_OP_ACOESPROJETOS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA ) 
AND A.ORIGEM IN ('B','C','D','E','Q','1','5','6')" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="50"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2LIQUIDAESRECEBIMENTOS">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="LIQUIDAESRECEBIMENTOS" Title="Receb. Fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="icon-wallet" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS_EM_OP_ACOESPROJETOS.CUSTOM.GRID" DefaultFilterName="Filtro padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT L.DOCUMENTO
                                  FROM FN_LANCAMENTOS L
                                       LEFT JOIN FN_LANCAMENTOCC LCC ON LCC.LANCAMENTO = L.HANDLE
                                 WHERE A.ABRANGENCIA = 'R'
                                       AND
                                       (
                                           L.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA)

                                           OR LCC.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA)
                                       )
                               ) " FormUrl="~/aga/e/materiais/recebimentos/RecebimentoFiscal/RecebimentoFiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="60"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2LIQUIDAESCPA">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="LIQUIDAESCPA" Title="Liquidações CPA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-reply" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS_EM_OP_ACOESPROJETOS.GRID" DefaultFilterName="Filtro padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT L.DOCUMENTO
                                  FROM FN_LANCAMENTOS L
                                       LEFT JOIN FN_LANCAMENTOCC LCC ON LCC.LANCAMENTO = L.HANDLE
                                 WHERE A.ABRANGENCIA = 'N'
                                       AND
                                       (
                                           L.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA)

                                           OR LCC.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA)
                                       )
                               ) " FormUrl="~/aga/e/financeiro/zoomdedocumentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="65"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                  <div class="tab-panel-content&#xA;                                                                    " id="tab2PAGAMENTOS">
                                                            <div class="row2">
                      <div class="row">
        <wes:SimpleGrid runat="server" ID="PAGAMENTOS" Title="Pagamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-money" ShowTitle="false" ProviderWidgetUniqueId="CONTROLEDEEXECUCAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS_EM_OP_ACOESPROJETOS.GRID" DefaultFilterName="Filtro padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VALORESBAIXADOS &gt; 0
       AND A.HANDLE IN (SELECT L.PARCELA
                          FROM FN_LANCAMENTOS L
                               LEFT JOIN FN_LANCAMENTOCC LCC ON LCC.LANCAMENTO = L.HANDLE
                               LEFT JOIN FN_DOCUMENTOS D ON A.DOCUMENTO = D.HANDLE
                         WHERE D.ABRANGENCIA IN ('T', 'N')
                                       AND
                                       (
                                           D.STATUS = 2
                                           OR
                                           (
                                               D.STATUS = 1
                                               AND D.ENTRADASAIDA NOT IN ('I', 'O')
                                           )
                                       )
                                       AND
                                       (
                                           L.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA)
                                           OR LCC.CLASSIFICACAOORCAMENTARIA = @CAMPO(CLASSIFICACAOORCAMENTARIA)
                                       )
                                   ) " FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESPROJETOS_FORM" Level="20" Order="70"  /></div>
                      <div class="row"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
            </div>
<style>
            .row2 {
                padding: 20px;
                border: 1px solid #dedef0;
                border-radius: 6px !important;
            }

            .table tr.active{
               
                border-left: 5px solid #36c6d3;
            }

            .row2 ul {
                padding-right: 6px;
                padding-left: 6px;
            }

            .tab-panel-content {
                display: none;
                flex-direction: column;
            }

            .tab-panel-content.active {
                display: flex;
            }
        </style></div>
            <style>div[widget-type="Tile"] {

  margin-bottom: 30px;
    
}

img {
    border-radius: 8px !important;
}

</style>
            </asp:Content>
        