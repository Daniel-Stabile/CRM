<%@ Page Title="Contratos" Language="C#" Inherits="aga.e.orcamento.ConfirmarPedidos.ContratosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
        <div class="tabbable-line">
            <ul class="nav nav-tabs">
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSCONTRATOS" class="active"><a data-toggle="tab" href="#tabCONTRATOS">Contratos</a></li>
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOSSELECIONADOSADITIVOS"><a data-toggle="tab" href="#tabADITIVOS">Aditivos</a></li>
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOSSELECIONADOSAPONTAMENTOS"><a data-toggle="tab" href="#tabAPONTAMENTOS">Apontamentos</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tabCONTRATOS">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="DOCUMENTOSCONTRATOS" Title="Contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.PEDIDOS.GRID" Mode="Fixed" DefaultFilterName="Contrato" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True"
                            UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT B.CONTRATO FROM CT_PEDIDOSEMPENHOS B WHERE B.STATUS = 6 AND B.TIPOPEDIDO = 1 AND ((B.GRUPOALCADA IS NULL AND B.CONFIRMANTE = @USUARIO) OR (B.GRUPOALCADA IN(SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E, CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA = 'S' AND E.SEQUENCIA >= B.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S') OR (B.GRUPOALCADA IN (SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E,CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA <> 'S' AND E.SEQUENCIA = B.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S')))))" Level="10" Order="10"  />
                        <wes:SimpleGrid runat="server" ID="PEDIDOSSELECIONADOSCONTRATOS" Title="Pedidos selecionados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOSCONTRATOS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.PADRAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" UserDefinedCriteriaWhereClause="A.CONTRATO IN @SELECIONADOS AND A.STATUS = 6" Level="20" Order="20"  />
                    </div>
                </div>
                <div class="tab-pane" id="tabADITIVOS">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="DOCUMENTOSADITIVOS" Title="Contratos aditivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOADITIVOS.PEDIDOS.GRID" Mode="Fixed" DefaultFilterName="Aditivo" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True"
                            UserDefinedCriteriaWhereClause="A.STATUS = 2 AND A.HANDLE IN (SELECT B.ADITIVO FROM CT_PEDIDOSEMPENHOS B WHERE B.STATUS = 6 AND (B.TIPOPEDIDO = 2 OR B.TIPOPEDIDO = 3) AND (B.ADITIVOOBJETO IS NOT NULL OR B.ADITIVONOVOOBJETO IS NOT NULL) AND B.CONTRATO IS NOT NULL AND ((B.GRUPOALCADA IS NULL AND B.CONFIRMANTE = @USUARIO) OR (B.GRUPOALCADA IN(SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E, CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA = 'S' AND E.SEQUENCIA >= B.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S') OR (B.GRUPOALCADA IN (SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E,CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA <> 'S' AND E.SEQUENCIA = B.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S')))))" Level="10" Order="10"  />
                        <wes:SimpleGrid runat="server" ID="PEDIDOSSELECIONADOSADITIVOS" Title="Pedidos selecionados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOSADITIVOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.PADRAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" UserDefinedCriteriaWhereClause="A.ADITIVO IN @SELECIONADOS AND A.STATUS = 6" Level="20" Order="20"  />
                    </div>
                </div>
                <div class="tab-pane" id="tabAPONTAMENTOS">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="DOCUMENTOSAPONTAMENTOS" Title="Contratos de apontamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_APONTAMENTOS.PEDIDOS.GRID" Mode="Fixed" DefaultFilterName="Apontamento" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True"
                            UserDefinedCriteriaWhereClause="A.STATUS = 2 AND A.HANDLE IN (SELECT B.APONTAMENTO FROM CT_PEDIDOSEMPENHOS B WHERE B.STATUS = 6 AND B.TIPOPEDIDO = 4 AND ((B.GRUPOALCADA IS NULL AND B.CONFIRMANTE = @USUARIO) OR (B.GRUPOALCADA IN(SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E, CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA = 'S' AND E.SEQUENCIA >= B.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S') OR (B.GRUPOALCADA IN (SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E,CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA <> 'S' AND E.SEQUENCIA = B.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S')))))" Level="10" Order="10"  />
                        <wes:SimpleGrid runat="server" ID="PEDIDOSSELECIONADOSAPONTAMENTOS" Title="Pedidos selecionados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOSAPONTAMENTOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.PADRAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" UserDefinedCriteriaWhereClause="A.APONTAMENTO IN @SELECIONADOS AND A.STATUS = 6" Level="20" Order="30"  />
                    </div>
                </div>
            </div>
        </div>
    </div>
      
</asp:Content>
    