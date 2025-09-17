<%@ Page Title="Carga de informações de movimentação fiscal PIS/COFINS" Language="C#" Inherits="aga.e.SPED.PISCOFINS.MovimentacoesPISCOFINSPage, Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">

    <style>
        .altura {
            height: 100px !important;
        }

        .table tbody tr td {
            padding: 0px;
        }
		
    </style>

  <div class="row">
    <wes:AjaxForm
      runat="server"
      ID="CARGAMOVIMENTACOESFISCALPISCOFINS"
      Title="Carga de informações das movimentações fiscais ICMS/IPI"
      Subtitle=""
      PortletCssClass=""
      PortletLayout="Default"
      BootstrapCols="5"
      FontIcon=""
      ShowTitle="false"
      ProviderWidgetUniqueId=""
      ChromeState="Normal"
      CanDelete="False"
      CanUpdate="True"
      CanInsert="True"
      EntityViewName="ED_VTCARGAMOVIMENTACAOCONTRIB.FORM"
      FormMode="None"
      IncludeRecordInRecentItems="True"
      UserDefinedCommandsVisible="True"
      CustomCommandsVisible="true"
      PredefinedCommandsVisible="true"
      PageId="AGA_A_SPED_PISCOFINS_MOVIMENTACOES"
      Level="20"
      Order="10"
    />
	<div class="col-md-7">
		<div class="portlet light">
			<div class="tabbable-line">
				<ul class="nav nav-tabs">
					<li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TABELAMOVIMENTACAO" class="active"><a data-toggle="tab" href="#tabTABELAMOVIMENTACAO">Tabelas de movimentação</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tabTABELAMOVIMENTACAO">
						<div class="row">
							<wes:SimpleGrid runat="server" ID="TABELAMOVIMENTACAO" Title="Tabelas de movimentação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false"  ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="EDPC_ITENSCARGA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SPED_PISCOFINS_MOVIMENTACOES" Level="20" Order="20" />

						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
  </div>
  
    <script type="text/javascript">
        var pagina = Sys.WebForms.PageRequestManager.getInstance();
        if (!pagina.get_isInAsyncPostBack()) {
            pagina.add_pageLoaded(function () {
                
            });
        }

        $("th > a").click(function(event){
            console.log("a click");
            event.stopPropagation();  
        });
    </script>
</asp:Content>
