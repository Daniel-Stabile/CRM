<%@ Page Title="Consultar requisições" Language="C#" AutoEventWireup="true"
         Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server" xmlns:asp="urn:asp.net">

<script runat="server">
  protected override void LoadWebPartConnections()
  {
  }

  protected override void OnInit(EventArgs e)
  {
      base.OnInit(e);
      AddCellAdapter(new Benner.Corporativo.Wes.WebApp.GridCellStatusAdapter(GridConsultaRequisicao, "STATUS"));
  }  
</script>
    <div class="row">
        <wesWidget:SimpleGrid runat="server"
            ID="GridConsultaRequisicao"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_REQUISICOES_CONSULTAR.GRID" 
            Title="Requisições &gt;&gt; listagem" 
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="True"
            DefaultFilterName=""       
            UserDefinedCriteriaWhereClause=" A.EMPRESA = @EMPRESA AND A.FILIAL IN @FILIAIS AND A.USUARIOINCLUIU = @USUARIO"       
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Suprimentos/Requisicoes/ConsultarRequisicao.aspx" 
                />
	</div>
</asp:Content>