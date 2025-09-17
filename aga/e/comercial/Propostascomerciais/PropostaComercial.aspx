<%@ Page Title="Proposta comercial" Language="C#" Inherits="aga.e.Comercial.PropostasComerciais.PropostaComercialPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROPOSTACOMERCIAL" class="active"><a data-toggle="tab" href="#tabPROPOSTACOMERCIAL">Proposta comercial</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESADICIONAIS"><a data-toggle="tab" href="#tabINFORMAESADICIONAIS">Informações adicionais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTATO"><a data-toggle="tab" href="#tabCONTATO">Contato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
		<li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TEXTOASSINATURAS"><a data-toggle="tab" href="#tabTEXTOASSINATURAS">Texto assinaturas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EVENTOS"><a data-toggle="tab" href="#tabEVENTOS">Eventos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OCORRNCIAS"><a data-toggle="tab" href="#tabOCORRNCIAS">Ocorrências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="VERSES"><a data-toggle="tab" href="#tabVERSES">Versôes</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabPROPOSTACOMERCIAL">
                    <div class="row">
                     <wes:AjaxForm runat="server" ID="PROPOSTACOMERCIAL" Title="Proposta comercial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CONTRATOS.DETALHE.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="10"  />
	                </div>
					<div class="row">
                     <wes:SimpleGrid runat="server" ID="ITENSPROPOSTA" Title="Itens Proposta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CONTRATOITENS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/comercial/Propostascomerciais/PropostaComercialItem.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="60"  />
                    </div>
        </div>
        <div class="tab-pane" id="tabINFORMAESADICIONAIS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESADICIONAIS" Title="Informações adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CM_CONTRATOS.INFORMACOESADICIONAIS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTATO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTATO" Title="Contato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CM_CONTRATOS.CONTATO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_CONTRATOS.AUDITORIA.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="40"  /></div>
        </div>
		<div class="tab-pane" id="tabASSINATURAS">
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.CONTRATO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATOCOMERCIAL = @CAMPO(HANDLE)" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="45" />
                        </div>
                    </div>
        <div class="tab-pane" id="tabTEXTOASSINATURAS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="TEXTOASSINATURAS" Title="Texto assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_CONTRATOS.TEXTOASSINATURAS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CONTRATOANEXOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/comercial/Propostascomerciais/CmContratoanexos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabEVENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EVENTOS" Title="Eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CONTRATOEVENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/comercial/Propostascomerciais/CmContratoeventos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabOCORRNCIAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OCORRNCIAS" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CONTRATOOCORRENCIAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO =@CAMPO(HANDLE)" FormUrl="~/aga/a/comercial/Propostascomerciais/CmContratoocorrencias/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabVERSES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="VERSES" Title="Versões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PROPOSTACOMERCIAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_CONTRATOS.VERSOES.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORIGINAL = @CAMPO(HANDLE)" FormUrl="~/aga/a/comercial/Propostascomerciais/Versoes/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_PROPOSTASCOMERCIAIS_PROPOSTACOMERCIAL" Level="20" Order="100"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    