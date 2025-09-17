<%@ Page Title="Aprovar ajustes orçamentários" Language="C#" Inherits="aga.e.orcamento.AprovarAjustesOrcamentarios" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="APROVAOORAMENT" class="active"><a data-toggle="tab" href="#tabAPROVAOORAMENT">Em aprovação</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECUSADO"><a data-toggle="tab" href="#tabRECUSADO">Recusado</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TODOS"><a data-toggle="tab" href="#tabTODOS">Todos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabAPROVAOORAMENT">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="APROVAOORAMENT" Title="Em aprovação" Subtitle="&gt;&gt; Orçament" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_APROVAR_VERBAS_ORCAMENTARIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA AND ((A.GRUPOASSINATURAS IN (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')) OR (A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S'))) AND A.STATUS = 1" FormUrl="~/PortalInterno/e/Orcamento/AprovarAjusteOcamentario.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_AJUSTES_ORCAMENTARIOS" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabRECUSADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECUSADO" Title="Recusado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES.PORTAL_INT_RECUSADO_VERBAS_ORCAMENTARIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA AND ((A.GRUPOASSINATURAS IN (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')) OR (A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S'))) AND A.STATUS = 3" FormUrl="~/PortalInterno/e/Orcamento/RecusarAjusteOcamentario.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_AJUSTES_ORCAMENTARIOS" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabTODOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TODOS" Title="Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_ORCAMENTOAPROVACOES.PORTAL_INT_TODOS_VERBAS_ORCAMENTARIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA AND ((A.GRUPOASSINATURAS IN (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B, CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')) OR (A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND ((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 'S'))) " FormUrl="~/PortalInterno/e/Orcamento/TodosAjusteOcamentario.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_AJUSTES_ORCAMENTARIOS" Level="20" Order="30"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    