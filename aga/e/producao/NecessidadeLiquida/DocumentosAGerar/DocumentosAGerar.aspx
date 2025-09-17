<%@ Page Title="Documentos a Gerar" Language="C#"  Inherits="Benner.Corporativo.Wes.WebApp.aga.e.producao.NecessidadeLiquida.DocumentosAGerar.DocumentosAGerarDocumentosAGerarPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="DOCUMENTOSAGERAR" Title="Documentos a Gerar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_VTNECESSIDADELIQDOCAGERAR.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="NECESSIDADELIQUIDA_DOCUMENTOSAGERAR" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="GRIDORDENSPRODUCAO" Title="Ordens de Produção" UserDefinedSelectColumnVisible ="false" UserDefinedDisableRowSelection="true"/>
        <wes:SimpleGrid runat="server" ID="GRIDORDENSCOMPRA" Title="Ordens de Compra" UserDefinedSelectColumnVisible ="false" UserDefinedDisableRowSelection="true"/>
        </div>
    
      </asp:Content>
    