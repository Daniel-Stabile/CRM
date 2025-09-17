<%@ Page Title="Contas Gerenciais" Language="C#"
Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %> <%@ Register
Assembly="Benner.Tecnologia.Wes.Components.WebApp"
Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %> <%@
Register Assembly="Benner.Tecnologia.Wes.Components"
Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
  <div class="row">
    <wes:AjaxForm
      runat="server"
      ID="PLANO"
      Title="Plano"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="12"
      FontIcon=""
      ShowTitle="true"
      ProviderWidgetUniqueId=""
      ChromeState="Normal"
      CanDelete="True"
      CanUpdate="True"
      CanInsert="True"
      EntityViewName="AGA_CT_PLANOSGERENCIAIS.GERENCIAL.FORM"
      FormMode="None"
      IncludeRecordInRecentItems="True"
      UserDefinedCommandsVisible="True"
      PageId="CARGA_DE_PLANO_GERENCIAL__CONTAS_FORM"
      Level="20"
      Order="1"
    />
    <wes:SimpleGrid
      runat="server"
      ID="CONTAS"
      Title="Contas"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="5"
      FontIcon=""
      ShowTitle="true"
      ProviderWidgetUniqueId="PLANO"
      ChromeState="Normal"
      CanDelete="True"
      CanUpdate="True"
      CanInsert="True"
      EntityViewName="AGA_CT_CONTASGERENCIAIS.GRID"
      Mode="Selectable"
      UserDefinedSelectColumnVisible="False"
      UserDefinedPageSize="10"
      SystemFilterOnly="False"
      DisplayRowCommand="True"
      CompanyFilterMode="OnlyCompany"
      UserDefinedCriteriaWhereClause="(A.PLANO= @CAMPO(HANDLE))"
      FormUrl="~/aga/a/Contabil/contas/ContaGerencial.aspx"
      ShowExport="True"
      UserDefinedDisableRowSelection="False"
      PageId="CARGA_DE_PLANO_GERENCIAL__CONTAS_FORM"
      Level="20"
      Order="5"
    />
    <wes:AjaxForm
      runat="server"
      ID="CONTAGERENCIAL"
      Title="Conta Gerencial"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="7"
      FontIcon=""
      ShowTitle="true"
      ProviderWidgetUniqueId="CONTAS"
      ChromeState="Normal"
      CanDelete="false"
      CanUpdate="false"
      CanInsert="false"
      EntityViewName="AGA_CT_CONTASGERENCIAIS.FORM"
      FormMode="None"
      IncludeRecordInRecentItems="True"
      UserDefinedCommandsVisible="True"
      PageId="CARGA_DE_PLANO_GERENCIAL__CONTAS_FORM"
      Level="20"
      Order="7"
    />

    <div class="col-md-12">
      <div class="portlet light">
        <div class="tabbable-line">
          <ul class="nav nav-tabs">
            <li
              onclick="Benner.Page.changeSelectedTab(this)"
              data-widget-id="WIDGET_2192"
              class="active"
              ><a data-toggle="tab" href="#tabWIDGET_2192"
                >Contas calculadas</a
              ></li
            >
            <li
              onclick="Benner.Page.changeSelectedTab(this)"
              data-widget-id="WIDGET_747"
              ><a data-toggle="tab" href="#tabWIDGET_747"
                >Contas contábeis</a
              ></li
            >
            <li
              onclick="Benner.Page.changeSelectedTab(this)"
              data-widget-id="WIDGET_1029"
              ><a data-toggle="tab" href="#tabWIDGET_1029"
                >Contas financeiras</a
              ></li
            >
            <li
              onclick="Benner.Page.changeSelectedTab(this)"
              data-widget-id="WIDGET_6053"
              ><a data-toggle="tab" href="#tabWIDGET_6053"
                >Contas gerenciais</a
              ></li
            >
            <li
              onclick="Benner.Page.changeSelectedTab(this)"
              data-widget-id="WIDGET_8179"
              ><a data-toggle="tab" href="#tabWIDGET_8179"
                >Subcontas Correlatas</a
              ></li
            >
			<li
              onclick="Benner.Page.changeSelectedTab(this)"
              data-widget-id="WIDGET_2280"
              ><a data-toggle="tab" href="#tabWIDGET_2280"
                >Notas Explicativas</a
              ></li
            >
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tabWIDGET_2192">
              <div class="row">
                <wes:SimpleGrid
                  runat="server"
                  ID="WIDGET_2192"
                  Title="Contas calculadas"
                  Subtitle=""
                  PortletCssClass=""
                  PortletLayout="Default"
                  BootstrapCols="12"
                  FontIcon=""
                  ShowTitle="false"
                  ProviderWidgetUniqueId="CONTAGERENCIAL"
                  ChromeState="Fixed"
                  CanDelete="True"
                  CanUpdate="True"
                  CanInsert="True"
                  EntityViewName="AGA_CT_CONTAGERENCIALFORMULAS.GRID"
                  Mode="Selectable"
                  UserDefinedSelectColumnVisible="False"
                  UserDefinedPageSize="10"
                  SystemFilterOnly="False"
                  DisplayRowCommand="True"
                  CompanyFilterMode="CompanyAndBranch"
                  UserDefinedCriteriaWhereClause="(A.CONTAINFORMADA = @CAMPO(HANDLE))"
                  FormUrl="~/aga/a/f/aga_t1957_at2192_hsace42200.aspx"
                  ShowExport="True"
                  UserDefinedDisableRowSelection="False"
                  PageWidgetHandle="2948"
                  Level="20"
                  Order="5"
                />
              </div>
            </div>
            <div class="tab-pane" id="tabWIDGET_747">
              <div class="row">
                <wes:SimpleGrid
                  runat="server"
                  ID="WIDGET_747"
                  Title="Contas contábeis"
                  Subtitle=""
                  PortletCssClass=""
                  PortletLayout="Default"
                  BootstrapCols="12"
                  FontIcon=""
                  ShowTitle="false"
                  ProviderWidgetUniqueId="CONTAGERENCIAL"
                  ChromeState="Minimized"
                  CanDelete="True"
                  CanUpdate="True"
                  CanInsert="True"
                  EntityViewName="AGA_CT_CONTAGERENCIALCONTAS.GRID"
                  Mode="Selectable"
                  UserDefinedSelectColumnVisible="False"
                  UserDefinedPageSize="10"
                  SystemFilterOnly="False"
                  DisplayRowCommand="True"
                  CompanyFilterMode="CompanyAndBranch"
                  UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))"
                  FormUrl="~/aga/a/f/aga_t917_at747_hs35e70fc9.aspx"
                  ShowExport="True"
                  UserDefinedDisableRowSelection="False"
                  PageWidgetHandle="2949"
                  Level="20"
                  Order="15"
                />
              </div>
            </div>
            <div class="tab-pane" id="tabWIDGET_1029">
              <div class="row">
                <wes:SimpleGrid
                  runat="server"
                  ID="WIDGET_1029"
                  Title="Contas financeiras"
                  Subtitle=""
                  PortletCssClass=""
                  PortletLayout="Default"
                  BootstrapCols="12"
                  FontIcon=""
                  ShowTitle="false"
                  ProviderWidgetUniqueId="CONTAGERENCIAL"
                  ChromeState="Minimized"
                  CanDelete="False"
                  CanUpdate="False"
                  CanInsert="False"
                  EntityViewName="AGA_CT_CONTAGERENCIALFINANCEIRAS.GRID"
                  Mode="Selectable"
                  UserDefinedSelectColumnVisible="False"
                  UserDefinedPageSize="10"
                  SystemFilterOnly="False"
                  DisplayRowCommand="True"
                  CompanyFilterMode="CompanyAndBranch"
                  UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))"
                  FormUrl="~/aga/a/f/aga_t1298_at1029_hsabf1c84a.aspx"
                  ShowExport="True"
                  UserDefinedDisableRowSelection="False"
                  PageWidgetHandle="2950"
                  Level="20"
                  Order="20"
                />
              </div>
            </div>
            <div class="tab-pane" id="tabWIDGET_6053">
              <div class="row">
                <wes:SimpleGrid
                  runat="server"
                  ID="WIDGET_6053"
                  Title="Contas gerenciais"
                  Subtitle=""
                  PortletCssClass=""
                  PortletLayout="Default"
                  BootstrapCols="12"
                  FontIcon=""
                  ShowTitle="false"
                  ProviderWidgetUniqueId="CONTAGERENCIAL"
                  ChromeState="Minimized"
                  CanDelete="True"
                  CanUpdate="True"
                  CanInsert="True"
                  EntityViewName="AGA_CT_CONTAGERENCIALORCAMENTARIAS.GRID"
                  Mode="Selectable"
                  UserDefinedSelectColumnVisible="False"
                  UserDefinedPageSize="10"
                  SystemFilterOnly="False"
                  DisplayRowCommand="True"
                  CompanyFilterMode="CompanyAndBranch"
                  UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))"
                  FormUrl="~/aga/a/f/aga_t2025_at6053_hs1a1775e1.aspx"
                  ShowExport="True"
                  UserDefinedDisableRowSelection="False"
                  PageWidgetHandle="2951"
                  Level="20"
                  Order="25"
                />
              </div>
            </div>
            <div class="tab-pane" id="tabWIDGET_8179">
              <div class="row">
                <wes:SimpleGrid
                  runat="server"
                  ID="WIDGET_8179"
                  Title="Subcontas Correlatas"
                  Subtitle=""
                  PortletCssClass=""
                  PortletLayout="Default"
                  BootstrapCols="12"
                  FontIcon=""
                  ShowTitle="false"
                  ProviderWidgetUniqueId="CONTAGERENCIAL"
                  ChromeState="Minimized"
                  EntityViewName="AGA_CT_SUBCONTASGERENCIAIS.GRID"
                  CanDelete="True"
                  CanUpdate="True"
                  CanInsert="True"
                  Mode="Selectable"
                  UserDefinedSelectColumnVisible="False"
                  UserDefinedPageSize="10"
                  SystemFilterOnly="False"
                  DisplayRowCommand="True"
                  CompanyFilterMode="CompanyAndBranch"
                  UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))"
                  FormUrl="~/aga/a/f/aga_t5644_at8179_hsde6bb23.aspx"
                  UserDefinedDisableRowSelection="False"
                  PageWidgetHandle="2952"
                  Level="20"
                  Order="55"
                />
              </div>
            </div>
			<div class="tab-pane active" id="tabWIDGET_2280">
              <div class="row">
                <wes:SimpleGrid
                  runat="server"
                  ID="WIDGET_2280"
                  Title="Notas Explicativas"
                  Subtitle=""
                  PortletCssClass=""
                  PortletLayout="Default"
                  BootstrapCols="12"
                  FontIcon=""
                  ShowTitle="false"
                  ProviderWidgetUniqueId="CONTAGERENCIAL"
                  ChromeState="Minimized"
                  CanDelete="True"
                  CanUpdate="True"
                  CanInsert="True"
                  EntityViewName="CT_NOTAEXPLICATIVA.CUSTOM.GRID"
                  Mode="Selectable"
                  UserDefinedSelectColumnVisible="False"
                  UserDefinedPageSize="10"
                  SystemFilterOnly="False"
                  DisplayRowCommand="True"
                  CompanyFilterMode="CompanyAndBranch"
                  UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))"
                  FormUrl="~/aga/a/Contabil/NotaExplicativaForm.aspx"
                  ShowExport="True"
                  UserDefinedDisableRowSelection="False"
                  PageWidgetHandle="2948"
                  Level="20"
                  Order="35"
                />
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <style>
    #ctl00_Main_PLANO { display: none; }
  </style>
</asp:Content>
