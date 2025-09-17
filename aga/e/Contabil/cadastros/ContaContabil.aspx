<%@ Page Title="Contas Contábeis" Language="C#"
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
      EntityViewName="AGA_CT_PLANOVERSOES.FORM"
      FormMode="None"
      IncludeRecordInRecentItems="True"
      UserDefinedCommandsVisible="True"
      PageId="CT_CONTAS_CONTABEIS_PAGE"
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
      EntityViewName="AGA_CT_CONTAS.GRID"
      Mode="Selectable"
      UserDefinedSelectColumnVisible="False"
      UserDefinedPageSize="10"
      SystemFilterOnly="False"
      DisplayRowCommand="True"
      CompanyFilterMode="OnlyCompany"
      FormUrl="~/aga/a/Contabil/contas/ContaContabil.aspx"
      UserDefinedCriteriaWhereClause="(A.VERSAO = @CAMPO(HANDLE))"
      ShowExport="True"
      UserDefinedDisableRowSelection="False"
      PageId="CT_CONTAS_CONTABEIS_PAGE"
      Level="20"
      Order="5"
    />
    <wes:AjaxForm
      runat="server"
      ID="CONTACONTABIL"
      Title="Conta"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="7"
      FontIcon=""
      ShowTitle="true"
      ProviderWidgetUniqueId="CONTAS"
      ChromeState="Normal"
      CanDelete="False"
      CanUpdate="False"
      CanInsert="False"
      EntityViewName="AGA_CT_CONTAS.FORM"
      FormMode="None"
      IncludeRecordInRecentItems="True"
      UserDefinedCommandsVisible="True"
      PageId="CT_CONTAS_CONTABEIS_PAGE"
      Level="20"
      Order="7"
    />
  </div>

  <style>
    #ctl00_Main_PLANO { display: none; }
  </style>
</asp:Content>
