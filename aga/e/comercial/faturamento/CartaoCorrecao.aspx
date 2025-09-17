<%@ Page Title="Carta de correção" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Comercial.Faturamento.CartaoCorrecaoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">  
    <asp:HiddenField runat="server" ID="VisibilidadeTabTransporte" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="VisibilidadeTabNfe" ClientIDMode="Static" />
    <div class="row">	
		<div class="col-md-12">
			<div class="portlet light">
				<div class="row">
					<wes:CommandsPanel class="row" runat="server" ID="CARTADECORRECAO" Title="Carta de correção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS.COMANDOSCARTACORRECAO.GRID" VerticalOrientation="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="10"  />
					<div class="col-md-12">
                        <div class="tabbable tabbable-custom erp-border">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tabDOCUMENTO" data-toggle="tab" aria-expanded="true">Documento</a>
								</li>
								<li>
									<a href="#tabITENS" data-toggle="tab" aria-expanded="false">Itens</a>
								</li>
								<li>
									<a href="#tabTRIBUTACOES" data-toggle="tab" aria-expanded="false">Tributações</a>
								</li>
							</ul>
                            <div class="tab-content">
								<div class="tab-pane fade active in" id="tabDOCUMENTO">
									<div class="row">          
										<wes:AjaxForm runat="server" ID="DOCUMENTO" Title="Documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_DOCUMENTOS.CARTACORRECAO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="66"  />
								        <div class="col-md-12">
										    <div class="tabbable tabbable-custom erp-border">
											    <ul class="nav nav-tabs">
												    <li class="active">
													    <a href="#tabNOTA" data-toggle="tab" aria-expanded="true">Nota</a>
												    </li>
												    <li>
													    <a href="#tabTRANSPORTE" id="guiaTRANSPORTE" data-toggle="tab" aria-expanded="false">Transporte</a>
												    </li>
												    <li>
													    <a href="#tabINFADICIONAIS" data-toggle="tab" aria-expanded="false">Informações adicionais</a>
												    </li>
												    <li>
													    <a href="#tabOUTRASINF" data-toggle="tab" aria-expanded="false">Outras informações</a>
												    </li>
												    <li>
													    <a href="#tabTEXTOPADRAO" data-toggle="tab" aria-expanded="false">Texto padrão</a>
												    </li>
												    <li>
													    <a href="#tabNFE" id="guiaNFE" data-toggle="tab" aria-expanded="false">NF-e</a>
												    </li>
											    </ul>
											    <div class="tab-content">
												    <div class="tab-pane fade active in" id="tabNOTA">
													    <div class="row">          
														    <wes:AjaxForm runat="server" ID="CORRECAOSERIE" Title="Série" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAODOCUMENTO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="130"  />                  
														    <wes:AjaxForm runat="server" ID="CORRECAODESTINATARIO" Title="Dados cadastrais do destinatário" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAOPESSOA.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="132"  />        
													    </div>
												    </div>
												    <div class="tab-pane fade" id="tabTRANSPORTE">
													    <div class="row">
														    <wes:AjaxForm runat="server" ID="CORRECAOTRANSPORTE" Title="Transporte" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAODOCUMENTO.TRANSPORTADORA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="135"  />                  
														    <wes:AjaxForm runat="server" ID="CORRECAOTRANSPORTEPESSOA" Title="Dados cadastrais da transportadora" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAOPESSOA.TRANSPORTADORA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="137"  />                                                            
													    </div>
												    </div>
												    <div class="tab-pane fade" id="tabINFADICIONAIS">
													    <div class="row">
														    <wes:AjaxForm runat="server" ID="CORRECAOINFADICIONAIS" Title="Informações adicionais" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAODOCUMENTO.INFADICIONAIS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="140"  />                  
													    </div>
												    </div>      
												    <div class="tab-pane fade" id="tabOUTRASINF">
													    <div class="row">
														    <wes:AjaxForm runat="server" ID="CORRECAOOUTRASINF" Title="Outras informações" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAOOUTRAS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="140"  />                  
													    </div>
												    </div>                                    
												    <div class="tab-pane fade" id="tabTEXTOPADRAO">
													    <div class="row">
														    <wes:AjaxForm runat="server" ID="CORRECAOTEXTOPADRAO" Title="Texto padrão" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAODOCUMENTO.TEXTOPADRAO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="145"  />                  
													    </div>
												    </div>                                  
												    <div class="tab-pane fade" id="tabNFE">
													    <div class="row">
														    <wes:AjaxForm runat="server" ID="NFE" Title="NF-e" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTONFE.CARTACORRECAO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="155"  />                  
													    </div>
												    </div>                                      
											    </div>
										    </div>
								        </div>
									</div>
								</div>
								<div class="tab-pane fade" id="tabITENS">
									<div class="row">
                                        <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_ITENS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="200"  />
								        <wes:AjaxForm runat="server" ID="CORRECAOITENS" Title="Item" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAOITEM.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="300"  />
								        <wes:AjaxForm runat="server" ID="CORRECAOTIPI" Title="Dados cadastrais" Subtitle="Correção" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_CARTACORRECAOTIPIS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="500"  />
									</div>
								</div>	
								<div class="tab-pane fade" id="tabTRIBUTACOES">
									<div class="row">
                                        <wes:SimpleGrid runat="server" ID="TRIBUTACOES" Title="Tributações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_TRIBUTACOES.FORMFATURAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="230"  />
                                        <wes:AjaxForm runat="server" ID="TRIBUTACOESFORM" Title="Tributações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TRIBUTACOES" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_TRIBUTACOES.FATURAMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_E_COMERCIAL_CARTACORRECAO" Level="20" Order="250"  />
                                    </div>
								</div>	                                        
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <script type="text/javascript">
        $(() => {                           
            ProcessarVisibilidades();
        });     

        const Exibir = (tab, prop) => {
	        $(tab).fadeIn();
            $(prop).val("True");
        };

        const Ocultar = (tab, prop) => {
	        $(tab).hide();
            $(prop).val("False");
        };

        const ProcessarVisibilidades = () => {
            if ($("#VisibilidadeTabTransporte").val() == "False")
                Ocultar("#guiaTRANSPORTE", "#VisibilidadeTabTransporte");
            else
                Exibir("#guiaTRANSPORTE", "#VisibilidadeTabTransporte");
            
            if ($("#VisibilidadeTabNfe").val() == "False")
                Ocultar("#guiaNFE", "#VisibilidadeTabNfe");
            else
                Exibir("#guiaNFE", "#VisibilidadeTabNfe");                        
        };
    </script>
</asp:Content>
    