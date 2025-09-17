<%@ Page Title="Selecionar requisições" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.Requisicoes.SelecionarRequisicoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REQUEISIES" Title="Cotação de compra/Ordem de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_SELECIONAR_REQUISICOES.GRID" DefaultFilterName="Padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="1000" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CP_SELECIONAR_REQUISICOES" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(incluirLegendaBotoes);
    }
      
    incluirLegendaBotoes(); 
});


const incluirLegendaBotoes = () => {
    $("#ctl00_Main_REQUEISIES_toolbar, #ctl00_Main_REQUEISIES_footerCommands").find("> a").each((index, comando) => {
        var descricaoComando;
        if (comando.id == "top-EnviarCotacao") {
            descricaoComando = "Enviar para cotação interna";
        }
        else if (comando.id == "top-CMD_ENVIARPORTALFORNECEDOR") {
            descricaoComando = "Enviar para portal fornecedores";
        }
        else if (comando.id == "top-CMD_VOLTARSOLICITACAO") {
            descricaoComando = "Voltar solicitação para solicitante";
        }
        $(comando).find("i").css("padding-left", "8px");
        
        if (!$(comando).attr("title"))
            $(comando).attr("title", descricaoComando);
    });  
};
              </script>
      </asp:Content>
    