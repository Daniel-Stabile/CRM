<%@ Page Title="Item de consumos - Lotes" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.ItemConsumo.Lote.LoteformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ITEMDECONSUMO" Title="Item de Consumo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PR_ITEMCONSUMOS.MANIPULARLOTE.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_PR_ITEMCONSUMOS_LOTES" Level="20" Order="10"  />
     

       <wes:SimpleGrid Visible="true" ProviderWidgetUniqueId="ITEMDECONSUMO" UserDefinedDisableRowSelection="true" runat="server" ID="LOTES" Title="Produtos"  DisplayRowCommand="true" CustomCommandsVisible="true"  ShowExport="true" UserDefinedCommandsVisible="true"  UserDefinedSelectColumnVisible="false"/>
       
        </div>
    

          <style type="text/css">
        #ITEMDECONSUMO th, td {
            white-space:nowrap !important;
        }

      

     

        .tooltip {
	        opacity: 1 !important;
        }

        .error-tooltip-inner, .tooltip-inner {
            background-color: #000 !important;
        }

      

        .input-group, .form-group {
            z-index: 0 !important;
        }
    </style>
      </asp:Content>
    
    