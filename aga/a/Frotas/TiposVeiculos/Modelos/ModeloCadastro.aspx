<%@ Page Title="Modelo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="MODELO" Title="Modelo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOMODELOS.CADASTRO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CAMPOSADICIONAIS" class="active"><a data-toggle="tab" href="#tabCAMPOSADICIONAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Campos Adicionais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="COMBUSTVEIS"><a data-toggle="tab" href="#tabCOMBUSTVEIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Combustíveis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTAES"><a data-toggle="tab" href="#tabDOCUMENTAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ROTEIRODECHECKLISTS"><a data-toggle="tab" href="#tabROTEIRODECHECKLISTS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiro de check-lists")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ROTEIRODELUBRIFICAES"><a data-toggle="tab" href="#tabROTEIRODELUBRIFICAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiro de lubrificações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ROTEIROSDEMANUTENESPREVENTIVAS"><a data-toggle="tab" href="#tabROTEIROSDEMANUTENESPREVENTIVAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiros de manutenções preventivas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ROTEIRODERODIZODEPNEUS"><a data-toggle="tab" href="#tabROTEIRODERODIZODEPNEUS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Roteiro de rodizío de pneus")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPOSDECONJUNTOS"><a data-toggle="tab" href="#tabTIPOSDECONJUNTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de conjuntos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPOSDEEIXOS"><a data-toggle="tab" href="#tabTIPOSDEEIXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de Eixos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPOSDEIMPLEMENTO"><a data-toggle="tab" href="#tabTIPOSDEIMPLEMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de Implemento")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCAMPOSADICIONAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CAMPOSADICIONAIS" Title="Campos Adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_PARTEEQUIPAMENTOCONTROLES.MODELOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MODELO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelo/CamposAdicionaisCadastro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCOMBUSTVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="COMBUSTVEIS" Title="Combustíveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_MODELOCOMBUSTIVEIS.MODELOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MODELO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelos/CombustiveisCadastro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTAES" Title="Documentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_MODELODOCUMENTACOES.MODELOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MODELO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelos/CadastroDocumentacoes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabROTEIRODECHECKLISTS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ROTEIRODECHECKLISTS" Title="Roteiro de check-lists" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOMODELOROTEIROS.MODELOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MODELO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelos/RoteiroCheckLists.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabROTEIRODELUBRIFICAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ROTEIRODELUBRIFICAES" Title="Roteiro de lubrificações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="MANUTENCAO IN (SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARPLANOLUBRIFICACAO = 'S') AND (A.MODELO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at7005_hs3cf45dd9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabROTEIROSDEMANUTENESPREVENTIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ROTEIROSDEMANUTENESPREVENTIVAS" Title="Roteiros de manutenções preventivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="MANUTENCAO IN (SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZAPLANOPREVENTIVO = 'S') AND (A.MODELO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at6945_hs9f4c2ff6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabROTEIRODERODIZODEPNEUS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ROTEIRODERODIZODEPNEUS" Title="Roteiro de rodizío de pneus" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_MANUTENCAOPREVENTIVAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="MANUTENCAO IN (SELECT HANDLE FROM MA_ROTEIROMANUTENCAO WHERE UTILIZARODIZIOPNEU = 'S') AND (A.MODELO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2606_at6945_hs9f4c2ff6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabTIPOSDECONJUNTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPOSDECONJUNTOS" Title="Tipos de conjuntos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_MODELOPARTES.MODELOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARTE IN (SELECT HANDLE FROM MA_PARTESEQUIPAMENTO WHERE PARTEPNEU = 1) AND (A.MODELO = @CAMPO(HANDLE))" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelo/TipoConjunto.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabTIPOSDEEIXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPOSDEEIXOS" Title="Tipos de Eixos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOMODELOEIXOS.TIPOSEIXO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MODELO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelo/TipoEixoCadastro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabTIPOSDEIMPLEMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPOSDEIMPLEMENTO" Title="Tipos de Implemento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="MODELO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_MODELOPARTES.TIPOSIMPLEMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARTE IN (SELECT HANDLE FROM MA_PARTESEQUIPAMENTO WHERE PARTEPNEU = 4) AND (A.MODELO = @CAMPO(HANDLE))" FormUrl="~/aga/a/Frotas/TipoVeiculo/Modelo/TiposImplemento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_VEICULOS_MODELOS_CADASTRO" Level="20" Order="110"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    