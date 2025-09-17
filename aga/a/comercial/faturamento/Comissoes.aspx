<%@ Page Title="Comissões" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.faturamento.Comissoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COMISSO" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="COMISSES" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOCOMISSOES.WEB.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMISSOES_WEB" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="COMISSES" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOCOMISSOES.WEB.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMISSOES_WEB" Level="20" Order="40"  />
        </div>
    
        <script type="text/javascript">
              function esconderMensagem(){
    var msg = document.querySelector("#ctl00_Main_COMISSES_MsgUser_message");
    if(msg != undefined && msg.textContent == "Nenhum registro selecionado" ){
        $("#ctl00_Main_COMISSES_MsgUser").remove();
    }
}
              </script>
      </asp:Content>
    