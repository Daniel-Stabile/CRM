<%@ Page Title="Consulta NFe" Language="C#"
    Inherits="PortalRepresentante.NFe.ConsultaNFePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="NOTASFISCAISELETRONICA"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_DOCUMENTOSNFE.GRID"
            UserDefinedCriteriaWhereClause="A.DOCUMENTO IN (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.AGENTEVENDAS = (SELECT C.PESSOA FROM Z_GRUPOUSUARIOS C WHERE C.HANDLE = @USUARIO))"
            Title="Notas Fiscais Eletrônicas >> "
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            DefaultFilterName="Todos"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalRepresentante/e/NFe/DetalhesNFe.aspx" />
            
    </div>
</asp:Content>
