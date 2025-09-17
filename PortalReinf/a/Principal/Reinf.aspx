<%@ Page Title="Reinf" Language="C#" Inherits="PortalReinf.a.Principal.ReinfPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:HtmlPanel runat="server" ID="REINF_1" Title="REINF" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" HtmlBase64="PGgxIGNsYXNzPSJwYWdlLXRpdGxlIj4gU1BFRCBFRkQtUkVJTkYgPC9oMT4KPHN0eWxlPgogLmN1c3RvbS1hY3Rpb24geyBtYXJnaW4tYm90dG9tOiAxNXB4OyB9Cjwvc3R5bGU+Cg==" PageId="PORTAL_REINF" Level="20" Order="20"  />
        <wes:CommandsPanel runat="server" ID="REINF" Title="Reinf" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_REINF_COMANDOS.GRID" VerticalOrientation="False" PageId="PORTAL_REINF" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="DETALHESDOSLEIAUTESNOREINF" Title="DETALHES DOS LEIAUTES NO REINF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_AUDITORIAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT MAX(B.HANDLE) FROM REINF_AUDITORIAS B WHERE  B.LEIAUTE IN (SELECT C.HANDLE
                            FROM REINF_TIPOARQUIVOS C
                          WHERE C.REINF &lt;&gt; 'R-5001'
                               AND C.REINF &lt;&gt; 'R-5011'
                               AND C.REINF &lt;&gt; 'R-9000'
                        )
GROUP BY B.HANDLEEVENTO,
B.LEIAUTE)" FormUrl="~/Default.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF" Level="20" Order="40"  />
        </div>
    
        <script type="text/javascript">
              $(document).ready(function () {
	$('body').on("click",
		'.openAudit',
		function (e) {
			$(e.target).closest('tr').find('#CMD_DETAIL_record')[0].click();
			e.preventDefault();
		});
      
      Erp.associarCallbackEmGridSelecao('DETALHESDOSLEIAUTESNOREINF', 'Erp.mudaVisualizacaoDeAcordoItensChecadosEmGrid("DETALHESDOSLEIAUTESNOREINF", "top-CMD_ExcluirSelecionado");');
                Erp.mudaVisualizacaoDeAcordoItensChecadosEmGrid("DETALHESDOSLEIAUTESNOREINF", "top-CMD_ExcluirSelecionado");
      
      var prm = window.Sys.WebForms.PageRequestManager.getInstance();
      if (!prm.get_isInAsyncPostBack()) {
        
        prm.add_endRequest(function (sender, args) {
            
            Erp.associarCallbackEmGridSelecao('DETALHESDOSLEIAUTESNOREINF', 'Erp.mudaVisualizacaoDeAcordoItensChecadosEmGrid("DETALHESDOSLEIAUTESNOREINF", "top-CMD_ExcluirSelecionado");');
                Erp.mudaVisualizacaoDeAcordoItensChecadosEmGrid("DETALHESDOSLEIAUTESNOREINF", "top-CMD_ExcluirSelecionado");
                
             
            
        });
      }

      
});


              </script>
        <style>
              .openAudit:hover {
    text-decoration: none;
}


              </style>
      </asp:Content>
    