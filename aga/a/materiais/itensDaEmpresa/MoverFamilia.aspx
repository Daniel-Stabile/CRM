<%@ Page Title="Mover família" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="MOVERFAMLIADESTINO" Title="Mover família - Destino" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="PD_VTMOVERFAMILIA.PRODUTOS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.PRODUTOPAI = @RASTRO(PD_PRODUTOSPAI)" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_PRODUTOS_MOVERFAMILIA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    