<%@ Page Title="Documentos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
<script runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
         AddCellAdapter(new Benner.Corporativo.Wes.WebApp.GridCellStatusAdapter(ConsultaDocumentosContasReceber, "STATUS"));        
    } 
   
    

    
</script>


    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="ConsultaDocumentosContasReceber"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CONTAS_RECEBER.GRID"
            Title="Documentos >> Contas à receber"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            DefaultFilterName=""       
            UserDefinedCriteriaWhereClause="(A.FILIAL IN @FILIAIS) AND (((A.ENTRADASAIDA = 'S' OR A.ENTRADASAIDA = 'O') AND (A.TIPODEMOVIMENTO IN (1, 2))) OR ((A.ENTRADASAIDA = 'E' OR A.ENTRADASAIDA = 'I') AND (A.TIPODEMOVIMENTO = 3))) AND (A.ABRANGENCIA <> 'R' AND A.ABRANGENCIA <> 'F' AND A.ABRANGENCIA <> 'A' AND A.ABRANGENCIA <> 'B' AND A.ABRANGENCIA <> 'D' AND A.ABRANGENCIA <> 'G' AND A.ABRANGENCIA <> 'H') AND ((A.EFETUANDOINTEGRACAO <> 'S') OR (A.EFETUANDOINTEGRACAO IS NULL)) "         
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Financeiro/ContasReceber/ContasReceberVisualizar.aspx" />
    </div>
</asp:Content>
