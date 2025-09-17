<%@ Page Title="Requisições de convênios" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.requisicoes.AdicionarBadgesStatusRequisicoesConvenio" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REQUISIESDECONVNIO" Title="Requisições de convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_REQUISICOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 2" FormUrl="~/aga/a/contratos/requisicoes/requisicaocadastrar.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_REQUISICOES_CONVENIOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    