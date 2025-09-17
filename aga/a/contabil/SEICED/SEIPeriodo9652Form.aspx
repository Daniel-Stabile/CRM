<%@ Page Title="SEI_CED_WEB" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:CommandsPanel runat="server" ID="PROCESSOS" Title="SEI-CED" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="SEI_PERIODOS_SEI_CED_WEB.CUSTOM.GRID" VerticalOrientation="False" PageId="SEI_PERIODOS_9652_FORM" Level="20" Order="20"  />		
        </div>

	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Exemplo de Imagem</title>
		<style>
			.imagem-margem {
				margin-left: 2cm;
				margin-top: 1cm;
			}
		</style>
	</head>
	<body>		
		<asp:Image ID="Image1" runat="server" CssClass="imagem-margem" ImageUrl="https://www1.tce.pr.gov.br/multimidia/2014/8/png/00265533.png" AlternateText="Imagem Exemplo" />
	</body>
	</html>
    
      </asp:Content>