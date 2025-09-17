<%@ Page Title="Empenhos - Competências" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Empenhos - Competências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_COMPETENCIAEMPENHOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_6859" class="active"><a data-toggle="tab" href="#tabWIDGET_831_6859"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria das liquidações&gt;Auditadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_6862"><a data-toggle="tab" href="#tabWIDGET_831_6862"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria das liquidações&gt;Canceladas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_6858"><a data-toggle="tab" href="#tabWIDGET_831_6858"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria das liquidações&gt;Em auditoria")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_6857"><a data-toggle="tab" href="#tabWIDGET_831_6857"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria das liquidações&gt;Pendente para auditoria")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_6860"><a data-toggle="tab" href="#tabWIDGET_831_6860"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria das liquidações&gt;Recusadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_6861"><a data-toggle="tab" href="#tabWIDGET_831_6861"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria das liquidações&gt;Todas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2633"><a data-toggle="tab" href="#tabWIDGET_831_2633"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos&gt;Cadastrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2636"><a data-toggle="tab" href="#tabWIDGET_831_2636"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2635"><a data-toggle="tab" href="#tabWIDGET_831_2635"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos&gt;Encerrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2634"><a data-toggle="tab" href="#tabWIDGET_831_2634"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos&gt;Parcialmente encerrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2678"><a data-toggle="tab" href="#tabWIDGET_831_2678"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos&gt;Todos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2626"><a data-toggle="tab" href="#tabWIDGET_831_2626"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Cadastrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2629"><a data-toggle="tab" href="#tabWIDGET_831_2629"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Cancelados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2627"><a data-toggle="tab" href="#tabWIDGET_831_2627"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Confirmados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2631"><a data-toggle="tab" href="#tabWIDGET_831_2631"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Confirmar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2628"><a data-toggle="tab" href="#tabWIDGET_831_2628"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Encerrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_4210"><a data-toggle="tab" href="#tabWIDGET_831_4210"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Parcialmente encerrados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2658"><a data-toggle="tab" href="#tabWIDGET_831_2658"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Recusados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_831_2630"><a data-toggle="tab" href="#tabWIDGET_831_2630"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos de empenho&gt;Todos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_831_6859">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_6859" Title="Auditoria das liquidações&gt;Auditadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_EMPENHOAUDITORIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 3)" FormUrl="~/aga/a/f/aga_t4600_at6859_hsf3f1e3a.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_6862">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_6862" Title="Auditoria das liquidações&gt;Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOAUDITORIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 5)" FormUrl="~/aga/a/f/aga_t4600_at6862_hs7fadbcb.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_6858">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_6858" Title="Auditoria das liquidações&gt;Em auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOAUDITORIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.STATUS = 2)
AND (A.GRUPOALCADA IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA = 'S'
     AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')
OR (A.GRUPOALCADA IN (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C
                      WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA
                      AND B.USUARIO = @USUARIO AND B.ATIVO = 'S'))))" FormUrl="~/aga/a/f/aga_t4600_at6858_hsfc2c1bc0.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_6857">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_6857" Title="Auditoria das liquidações&gt;Pendente para auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOAUDITORIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 1)" FormUrl="~/aga/a/f/aga_t4600_at6857_hs9f478903.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_6860">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_6860" Title="Auditoria das liquidações&gt;Recusadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOAUDITORIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS = 4)" FormUrl="~/aga/a/f/aga_t4600_at6860_hs366b4fe0.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_6861">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_6861" Title="Auditoria das liquidações&gt;Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOAUDITORIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t4600_at6861_hs3c652685.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2633">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2633" Title="Empenhos&gt;Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=1)" FormUrl="~/aga/a/f/aga_t2107_at2633_hs5f4841ee.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2636">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2636" Title="Empenhos&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=4)" FormUrl="~/aga/a/f/aga_t2107_at2636_hs85d4e5.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2635">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2635" Title="Empenhos&gt;Encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=3)" FormUrl="~/aga/a/f/aga_t2107_at2635_hs89939efd.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2634">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2634" Title="Empenhos&gt;Parcialmente encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=2)" FormUrl="~/aga/a/f/aga_t2107_at2634_hs378f027f.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2678">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2678" Title="Empenhos&gt;Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_EMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2107_at2678_hsa49c519a.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2626">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2626" Title="Pedidos de empenho&gt;Cadastrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.USUARIOINCLUIU = @USUARIO OR A.REQUISITANTE = @USUARIO) AND (A.STATUS=1) AND (A.LIBERADO&lt;&gt;'S') AND (A.RECUSADO &lt;&gt; 'S'))
AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2626_hsa37085c9.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2629">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2629" Title="Pedidos de empenho&gt;Cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=4) AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2629_hsb10a2622.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2627">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2627" Title="Pedidos de empenho&gt;Confirmados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=2) AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2627_hsaf6f959e.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2631">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2631" Title="Pedidos de empenho&gt;Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="((A.STATUS = 6) AND ((A.GRUPOALCADA IS NULL AND A.CONFIRMANTE = @USUARIO) OR (A.GRUPOALCADA 

IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= 

A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND B.ATIVO = 'S') OR (A.GRUPOALCADA IN (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES 

B,CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND 

B.ATIVO = 'S')))))
AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2631_hseb504f08.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2628">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2628" Title="Pedidos de empenho&gt;Encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=3) AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2628_hsbce2db9b.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_4210">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_4210" Title="Pedidos de empenho&gt;Parcialmente encerrados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=7) AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at4210_hs14bf2500.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2658">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2658" Title="Pedidos de empenho&gt;Recusados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=5) AND (A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2658_hs9588449f.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_831_2630">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_831_2630" Title="Pedidos de empenho&gt;Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.DATAORCAMENTO &gt;=  (SELECT COMPETENCIA FROM CT_COMPETENCIAEMPENHOS WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS)))
AND (A.DATAORCAMENTO &lt;  
           (SELECT COMPETENCIA + 365
              FROM CT_COMPETENCIAEMPENHOS 
             WHERE HANDLE = @RASTRO(CT_COMPETENCIAEMPENHOS))
        )" FormUrl="~/aga/a/f/aga_t2109_at2630_hs2dc910dc.aspx" UserDefinedDisableRowSelection="False" PageId="EMPENHOCOMPETENCIAS__COMPETENCIAS_FORM" Level="20" Order="100"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    