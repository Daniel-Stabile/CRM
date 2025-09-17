<%@ Page Title="Orçamento físico" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTROORAMENTOS" Title="Filtro orçamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_FILTROORCAMENTOFISICO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_ORCAMENTOFISICO_ORCAMENTOFISICO" Level="20" Order="10"  />
        <wes:ActionView runat="server" ID="ORAMENTOFSICO" Title="Orçamento Físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTROORAMENTOS" ChromeState="Normal" Controller="OrcamentoFisico" Action="Orcar" PageId="AGA_A_ORCAMENTO_ORCAMENTOFISICO_ORCAMENTOFISICO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              if (($('select[data-field="CENTROCUSTO"]').length > 0 && $('select[data-field="CENTROCUSTOGERENCIAL"]').length > 0) || ($('select[data-field="PROJETO"]').length > 0 && $('select[data-field="PROJETOGERENCIAL"]').length > 0))
            window.location = Benner.Page.getApplicationPath() + "aga/a/orcamento/orcamentofisico/OrcamentosFisicos.aspx";

              </script>
      </asp:Content>
    