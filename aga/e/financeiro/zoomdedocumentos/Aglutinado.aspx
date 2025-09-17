<%@ Page Title="Documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
   <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
  <div class="row">
    <wes:AjaxForm
      runat="server"
      ID="FORMDOCUMENTO"
      Title="DOCUMENTO"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="4"
      FontIcon=""
      ShowTitle="true"
      ProviderWidgetUniqueId=""
      ChromeState="Normal"
      CanDelete="False"
      CanUpdate="False"
      CanInsert="False"
      EntityViewName="FN_DOCUMENTOS.ZOOMDEAGLUTINADOS.FORM"
      FormMode="View"
      IncludeRecordInRecentItems="True"
      UserDefinedCommandsVisible="True"
      PageId="AGA_E_FINANCEIRO_ZOOMDEDOCUMENTOS_AGLUTINADO"
      Level="20"
      Order="10"
    />

    <div class="col-md-8">
      <div class="row">
        <wes:Tile
          runat="server"
          ID="TILESALDODOCUMENTO"
          PortletCssClass=""
          PortletLayout="none"
          BootstrapCols="6"
          ShowTitle="true"
          ProviderWidgetUniqueId="FORMDOCUMENTO"
          ChromeState="Normal"
          CanDelete="False"
          CanUpdate="False"
          CanInsert="False"
          EntityViewName="WEB_E_FINANCEIRO_ZOOMDEDOCUMENTOS_SALDODOCUMENTO.DATASOURCE.GRID"
          CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
          CriteriaWhereClauseTotalValue="A.HANDLE = @CAMPO(HANDLE)"
          Prefix="R$"
          Description=""
          TotalValue="VALORNOMINAL"
          ValueFormat="N2"
          Value="SALDO"
          Status="VALORLABEL"
          Color="blue"
          Icon="fa fa-money"
          ValueAggregation="None"
          TileType="Progress"
          PageWidgetHandle="57533"
          Level="20"
          Order="30"
        />

        <wes:Tile
          runat="server"
          ID="TILESTATUSDOCUMENTO"
          Title="Status Documento"
          Subtitle=""
          PortletCssClass=""
          PortletLayout="None"
          BootstrapCols="6"
          FontIcon=""
          ShowTitle="true"
          ProviderWidgetUniqueId="FORMDOCUMENTO"
          ChromeState="Normal"
          CanDelete="True"
          CanUpdate="True"
          CanInsert="True"
          EntityViewName="WEB_E_FINANCEIRO_ZOOMDEDOCUMENTOS_STATUSDOCUMENTO.DATASOURCE.GRID"
          CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
          Value="STATUS"
          Description="Situação"
          Color="CLASSE"
          Icon="ICONE"
          ValueAggregation="None"
          TileType="Default"
          PageWidgetHandle="57579"
          Level="20"
          Order="30"
        />
      </div>
      <!-- InicioTabs -->
      <div class="tabbable tabbable-custom erp-border">
        <ul class="nav nav-tabs">
          <li class="active">
            <a
              href="#tabCONTASFINANCEIRAS"
              data-toggle="tab"
              aria-expanded="true"
              >Contas financeiras
            </a>
          </li>
          <li class="">
            <a href="#tabRETENCOES" data-toggle="tab" aria-expanded="false"
              >Retenções</a
            >
          </li>
          <li class="">
            <a href="#tabPARCELAS" data-toggle="tab" aria-expanded="false"
              >Parcelas</a
            >
          </li>
          <li class="">
            <a href="#tabCONTABILIZACAO" data-toggle="tab" aria-expanded="false"
              >Contabilização</a
            >
          </li>
          <li class="">
            <a href="#tabAGLUTINADOS" data-toggle="tab" aria-expanded="false"
              >Documentos Aglutinados</a
            >
          </li>
        </ul>
        <!-- <ul class="nav nav-tabs"> -->
        <div class="tab-content">
          <div class="tab-pane fade active in" id="tabCONTASFINANCEIRAS">
            <div class="row">
              <wes:SimpleGrid
                runat="server"
                ID="GRIDCONTASFINANCEIRAS"
                BootstrapCols="7"
                ShowTitle="False"
                Title="Contas Financeiras"
                EntityViewName="FN_LANCAMENTOS.CUSTOM.GRID"
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                ProviderWidgetUniqueId="FORMDOCUMENTO"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="True"
                CompanyFilterMode="OnlyCompany"
                UserDefinedDisableRowSelection="False"
                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.PARCELA IS NULL"
                FormUrl="~/aga/e/financeiro/ContasFinanceiras/ContasFinanceiras.aspx"
                PageWidgetHandle="57449"
              />

              <wes:SimpleGrid
                runat="server"
                ID="GRIDCENTRODECUSTO"
                BootstrapCols="5"
                ShowTitle="False"
                Title="Centro de custo"
                EntityViewName="FN_LANCAMENTOCC.ZOOMDEDOCUMENTOS.GRID"
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="False"
                CompanyFilterMode="OnlyCompany"
                UserDefinedDisableRowSelection="False"
                UserDefinedCriteriaWhereClause="A.LANCAMENTO IN(SELECT HANDLE FROM FN_LANCAMENTOS WHERE DOCUMENTO = @CAMPO(HANDLE) AND PARCELA IS NULL)"
                PageWidgetHandle="57449"
              />
            </div>
            <!-- <div class="row"> tabCONTASFINANCEIRAS -->
          </div>
          <!-- <div class="tab-pane fade active in" id="tabCONTASFINANCEIRAS"> -->

          <div class="tab-pane fade" id="tabRETENCOES">
            <div class="row">
              <wes:SimpleGrid
                runat="server"
                ID="RETENES"
                Title="Retenções"
                Subtitle=""
                PortletCssClass=""
                PortletLayout="Default"
                BootstrapCols="12"
                FontIcon=""
                ShowTitle="false"
                ChromeState="Fixed"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                EntityViewName="FN_DOCUMENTOIMPOSTOS.ZOOMDEDOCUMENTOS.GRID"
                Mode="None"
                FormUrl="~/aga/e/financeiro/zoomdedocumentos/Retencao.aspx"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="True"
                CompanyFilterMode="OnlyCompany"
                ShowExport="False"
                UserDefinedDisableRowSelection="False"
                PageWidgetHandle="22513"
                Level="20"
                Order="20"
              />
            </div>
            <!-- <div class="row"> tabPARCELAS -->
          </div>
          <!-- <div class="tab-pane fade" id="tabPARCELAS"> -->
          <div class="tab-pane fade" id="tabPARCELAS">
            <div class="row">
              <wes:SimpleGrid
                runat="server"
                ID="GRIDPARCELAS"
                BootstrapCols="12"
                ShowTitle="False"
                Title="Parcelas"
                EntityViewName="FN_PARCELAS.ZOOMDEDOCUMENTOS.GRID"
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="False"
                CompanyFilterMode="OnlyCompany"
                UserDefinedDisableRowSelection="False"
                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                PageWidgetHandle="57449"
                FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx"
              />
            </div>
            <!-- <div class="row"> tabCONTASFINANCEIRAS -->
          </div>

          <!-- <div class="tab-pane fade" id="tabAGLUTINADOS"> -->
          <div class="tab-pane fade" id="tabAGLUTINADOS">
            <div class="row">
              <wes:SimpleGrid
                runat="server"
                ID="GRIDAGLUTINADOS"
                BootstrapCols="12"
                ShowTitle="False"
                Title="Documentos Aglutinados"
                EntityViewName="FN_DOCUMENTOS.CONTASPAGAR.GRID"
                ChromeState="Normal"
                CanDelete="False"
                ProviderWidgetUniqueId="FORMDOCUMENTO"
                CanUpdate="False"
                CanInsert="False"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="False"
                CompanyFilterMode="OnlyCompany"
                UserDefinedDisableRowSelection="False"
                UserDefinedCriteriaWhereClause="A.DOCTOAGLUTINADOR = @CAMPO(HANDLE)"
                PageWidgetHandle="57450"
                FormUrl="~/aga/e/financeiro/zoomdedocumentos/Aglutinado.aspx"
              />
            </div>
            <!-- <div class="row"> tabCONTASFINANCEIRAS -->
          </div>

          <!-- <div class="tab-pane fade" id="tabCONTASFINANCEIRAS"> -->
          <div class="tab-pane fade" id="tabCONTABILIZACAO">
            <div class="row">
              <wes:SimpleGrid
                runat="server"
                ID="GRIDCONTABILIZACAO"
                FormMode="View"
                Title="Contabilização"
                BootstrapCols="12"
                ShowTitle="False"
                EntityViewName="CT_LANCAMENTOS.ZOOMDEPARCELAS.CONTABILIZACAO.GRID"
                ChromeState="Fixed"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                IncludeRecordInRecentItems="True"
                UserDefinedCommandsVisible="True"
                UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(HANDLE)"
                PageWidgetHandle="57510"
              />
            </div>
            <div class="row">
              <wes:SimpleGrid
                runat="server"
                ID="GRIDCT_LANCAMENTOS"
                BootstrapCols="6"
                ShowTitle="False"
                Title="Lançamentos da contabilização"
                EntityViewName="CT_LANCAMENTOS.ZOOMDEDOCUMENTOS.GRID"
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="False"
                CompanyFilterMode="OnlyCompany"
                UserDefinedDisableRowSelection="False"
                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                PageWidgetHandle="57469"
              />

              <wes:SimpleGrid
                runat="server"
                ID="GRIDCT_LANCAMENTOCC"
                BootstrapCols="6"
                ShowTitle="False"
                Title="Lançamentos de centro de custo da contabilização"
                EntityViewName="CT_LANCAMENTOCC.ZOOMDEDOCUMENTOS.GRID"
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="False"
                CompanyFilterMode="OnlyCompany"
                UserDefinedDisableRowSelection="False"
                UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)"
                PageWidgetHandle="57449"
              />
            </div>
            <!-- <div class="row"> tabCONTABILIZACAO -->
          </div>
          <!--<div class="tab-pane fade" id="tabCONTABILIZACAO"> -->
        </div>
        <!-- <div class="tab-content"> -->
      </div>
      <!-- <div class="portlet-body"> -->
    </div>
    <!-- <div class="col-md-8"> -->
  </div>
  <script runat="server">
    protected override void LoadWebPartConnections() {
    AddWebPartStaticConnection("FORMDOCUMENTOGRIDCONTASFINANCEIRAS",
    "FORMDOCUMENTO", "GRIDCONTASFINANCEIRAS");
    AddWebPartStaticConnection("GRIDCONTASFINANCEIRASGRIDCENTRODECUSTO",
    "FORMDOCUMENTO", "GRIDCENTRODECUSTO");
    AddWebPartStaticConnection("FORMDOCUMENTOGRIDPARCELAS", "FORMDOCUMENTO",
    "GRIDPARCELAS"); AddWebPartStaticConnection("GRIDPARCELASFORMPARCELA",
    "GRIDPARCELAS", "FORMPARCELA");
    AddWebPartStaticConnection("FORMDOCUMENTOFORMCONTABILIZACAO",
    "FORMDOCUMENTO", "GRIDCONTABILIZACAO");
    AddWebPartStaticConnection("GRIDCONTABILIZACAOGRIDCT_LANCAMENTOS",
    "GRIDCONTABILIZACAO", "GRIDCT_LANCAMENTOS");
    AddWebPartStaticConnection("GRIDCT_LANCAMENTOSGRIDCT_LANCAMENTOCC",
    "GRIDCT_LANCAMENTOS", "GRIDCT_LANCAMENTOCC"); }
  </script>
</asp:Content>
