<%@ Page Title="Lançamentos contábeis" Language="C#" Inherits="aga.a.contabil.lancamentos.LancamentosContabeisPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<div class="row">
		<wes:AjaxForm runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CT_DOCUMENTOS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" Level="20" Order="6"  />
		<wes:Tile runat="server" ID="VALOR" Title="Valor" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.CONTABEIS.CUSTOM.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.NATUREZA = 'D'" ValueFormat="###,###,###,###,##0.00" Value="VALOR" Description="Débito" Icon="fa fa-minus" Color="blue" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" Level="20" Order="11"  />
		<wes:Tile runat="server" ID="VALORCREDITO" Title="Valor Credito" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.CONTABEIS.CUSTOM.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.NATUREZA = 'C'" ValueFormat="###,###,###,###,##0.00" Value="VALOR" Description="Crédito" Icon="fa fa-plus" Color="red" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" Level="20" Order="15"  />
		<wes:Tile runat="server" ID="STATUS_1" Title="Status" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOSTILE.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.DOCUMENTO= @CAMPO(HANDLE)" ValueFormat="###,###,###,###,##0.00" Value="DIFERENCA" Description="Diferença" Color="yellow-crusta" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" Level="20" Order="21"  />
		<wes:SimpleGrid runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.CONTABEIS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Contabil/lancamentos/Lancamentos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" Level="20" Order="22"  />
				
		<div class="col-md-12">
            <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                <erp:ErpTab runat="server" ID="ErpTab1" Text="Centros de custos">
                    <div class="erp-unbox">
                        <div class="row" id="lancamentosRow">
                            <wes:SimpleGrid runat="server" 
											ID="CENTROCUSTO" 
											Title="Centro custo" 
											Subtitle="" 
											PortletCssClass="" 
											PortletLayout="Default" 
											BootstrapCols="12" 
											FontIcon="" 
											ShowTitle="true" 
											ProviderWidgetUniqueId="LANAMENTOS" 
											ChromeState="Normal" 
											CanDelete="True" 
											CanUpdate="True" 
											CanInsert="True" 
											EntityViewName="CT_LANCAMENTOCC.NEW.CUSTOM.GRID" 
											Mode="None" 
											UserDefinedSelectColumnVisible="False" 
											UserDefinedPageSize="10" 
											SystemFilterOnly="False" 
											DisplayRowCommand="True" 
											CompanyFilterMode="OnlyCompany" 
											UserDefinedCriteriaWhereClause="(A.LANCAMENTO = @CAMPO(HANDLE) AND A.DOCUMENTO = @CAMPO(DOCUMENTO))" 
											FormUrl="~/aga/a/Contabil/lancamentos/LancamentoCC.aspx" 
											ShowExport="True" 
											UserDefinedDisableRowSelection="False" 
											PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" 
											Level="20" 
											Order="32" />
                        </div>
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="ErpTab2" Text="Dimensões gerenciais">
                    <div class="erp-unbox">
                        <div class="row" id="centroCustoRow">
                            <wes:SimpleGrid runat="server" 
										    ID="DIMENSESGERENCIAIS" 
											Title="Dimensões gerenciais" 
											Subtitle="" 
											PortletCssClass="" 
											PortletLayout="Default" 
											BootstrapCols="12" 
											FontIcon="" 
											ShowTitle="true" 
											ProviderWidgetUniqueId="LANAMENTOS" 
											ChromeState="Normal" 
											CanDelete="True" 
											CanUpdate="True" 
											CanInsert="True" 
											EntityViewName="CT_LANCAMENTODIMENSOES.GRID" 
											Mode="None" 
											UserDefinedSelectColumnVisible="False" 
											UserDefinedPageSize="10" 
											SystemFilterOnly="False" 
											DisplayRowCommand="True" 
											CompanyFilterMode="OnlyCompany" 
											UserDefinedCriteriaWhereClause="(A.LANCAMENTOCONTABIL = @CAMPO(HANDLE))" 
											FormUrl="~/aga/a/Contabil/DimensoesGerencias/Form.aspx" 
											ShowExport="True" 
											UserDefinedDisableRowSelection="False" 
											PageId="AGA_A_CONTABIL_LANCAMENTOS_LANCAMENTOSCONTABEIS" 
											Level="20" 
											Order="42" />
                        </div>
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
    
    <script type="text/javascript">
		setTimeout(function() {
			$('#ctl00_Main_STATUS_1_ctl04').find('.number')[0].innerText = 'R$ ' + $('#ctl00_Main_STATUS_1_ctl04').find('.number')[0].innerText;
		}, 700);
	</script>
</asp:Content>
    