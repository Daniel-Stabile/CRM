<%@ Page Title="Ordem de Serviço" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.e.OrdemServico.OrdemServico" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDEMDEMANUTENO" class="active"><a data-toggle="tab" href="#tabORDEMDEMANUTENO">Ordem de Manutenção</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MOVIMENTARPNEUS"><a data-toggle="tab" href="#tabMOVIMENTARPNEUS">Movimentar Pneus</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS">Documentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AQUISIESINTERNAS"><a data-toggle="tab" href="#tabAQUISIESINTERNAS">Aquisições Internas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AQUISIESEXTERNAS"><a data-toggle="tab" href="#tabAQUISIESEXTERNAS">Aquisições Externas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MULTAS"><a data-toggle="tab" href="#tabMULTAS">Multas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECAPAGEMDEPNEUS"><a data-toggle="tab" href="#tabRECAPAGEMDEPNEUS">Pneus</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MATERIAISINTERNOS"><a data-toggle="tab" href="#tabMATERIAISINTERNOS">Materiais Internos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MATERIAISSERVIOSEXTERNOS"><a data-toggle="tab" href="#tabMATERIAISSERVIOSEXTERNOS">Materiais / Serviços Externos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SERVIOSDETCNICOSEXTERNOS"><a data-toggle="tab" href="#tabSERVIOSDETCNICOSEXTERNOS">Serviços de Técnicos Externos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="COMBUSTVEIS"><a data-toggle="tab" href="#tabCOMBUSTVEIS">Combustíveis</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SERVIOSINTERNOS"><a data-toggle="tab" href="#tabSERVIOSINTERNOS">Serviços Internos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIOCOMPRA"><a data-toggle="tab" href="#tabREQUISIOCOMPRA">Requisição Compra</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="VECULOPARADO"><a data-toggle="tab" href="#tabVECULOPARADO">Veículo Parado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="QUESTIONRIO"><a data-toggle="tab" href="#tabQUESTIONRIO">Questionário</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HHPROGRAMADO"><a data-toggle="tab" href="#tabHHPROGRAMADO">Homen(s) Hora(s) Programado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HHEXECUTADO"><a data-toggle="tab" href="#tabHHEXECUTADO">Homen(s) Hora(s) Executado</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabORDEMDEMANUTENO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ORDEMDEMANUTENO" Title="Ordem de Manutenção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOS.CADASTROORDEMSERVICOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabMOVIMENTARPNEUS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MOVIMENTARPNEUS" Title="Movimentar Pneus" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ORDEMMOVIMENTACOESEFETUADAS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="11"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICODOCUMENTOS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/Documentos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="12"  /></div>
        </div>
        <div class="tab-pane" id="tabAQUISIESINTERNAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AQUISIESINTERNAS" Title="Aquisições Internas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMAQUISICAOINTERNA.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/AquisicaoInterna.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="13"  /></div>
        </div>
        <div class="tab-pane" id="tabAQUISIESEXTERNAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AQUISIESEXTERNAS" Title="Aquisições Externas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMAQUISICAOEXTERNA.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/AquisicaoExterna.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="14"  /></div>
        </div>
        <div class="tab-pane" id="tabMULTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MULTAS" Title="Multas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOMULTAS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/Multas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabRECAPAGEMDEPNEUS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECAPAGEMDEPNEUS" Title="Pneus" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOPNEUS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/RecapagemPneus.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="17"  /></div>
        </div>
        <div class="tab-pane" id="tabMATERIAISINTERNOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MATERIAISINTERNOS" Title="Materiais Internos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMPRODUTOINTERNOS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/MaterialInterno.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabMATERIAISSERVIOSEXTERNOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MATERIAISSERVIOSEXTERNOS" Title="Materiais / Serviços Externos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOPRODUTOS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/MateriaisServicosExternos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="21"  /></div>
        </div>
        <div class="tab-pane" id="tabSERVIOSDETCNICOSEXTERNOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SERVIOSDETCNICOSEXTERNOS" Title="Serviços de Técnicos Externos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOINTERNOS.NOVAORDEMTECNICOSINTERNOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/ServicosTecnicosExternos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="22"  /></div>
        </div>
        <div class="tab-pane" id="tabCOMBUSTVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="COMBUSTVEIS" Title="Combustíveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOCOMBUSTIVEIS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/Combustiveis.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabSERVIOSINTERNOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="SERVIOSINTERNOS" Title="Serviços Internos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOINTERNOS.NOVAORDEMSERVICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/OrdemServico/NovaOrdem/ServicosInternos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="26"  /></div>
        </div>
        <div class="tab-pane" id="tabREQUISIOCOMPRA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REQUISIOCOMPRA" Title="Requisição Compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOPRODUTOS.NOVAORDEM.REQUISICAOCOMPRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/RequisicaoCompra.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="29"  /></div>
        </div>
        <div class="tab-pane" id="tabVECULOPARADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="VECULOPARADO" Title="Veículo Parado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMVEICULOPARADAS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServico/NovaOrdem/VeiculoParado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabQUESTIONRIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="QUESTIONRIO" Title="Questionário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="MF_ORDEMSERVICOPERGUNTAS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/Questionarios.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOANEXOS.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/Anexos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ORDEMSERVICOS.AUDITORIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " UserDefinedCommandsVisible="True" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.FROTAS.ORDEMSERVICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMFROTAS = @CAMPO(HANDLE) AND A.USUARIO = @USUARIO" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="61"  /></div>
        </div>
        <div class="tab-pane" id="tabHHPROGRAMADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HHPROGRAMADO" Title="Homen(s) Hora(s) Programado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMFUNCOESPROGRAMADO.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/HHProgramado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabHHEXECUTADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HHEXECUTADO" Title="Homen(s) Hora(s) Executado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEMANUTENO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMFUNCOESEXECUTADO.NOVAORDEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(HANDLE) " FormUrl="~/aga/a/Frotas/OrdemServicos/NovaOrdem/HHExecutado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMDESERVICOS_INTERNAS" Level="20" Order="80"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    