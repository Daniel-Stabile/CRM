<%@ Page Title="Contas a pagar rápido" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONTASAPAGARRPIDO" Title="Contas a pagar rápido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOSRAPIDOS.PAGAR.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.USUARIO=@USUARIO" FormUrl="~/aga/a/financeiro/contaspagar/NovoRapido.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_CONTASPAGAR_RAPIDO" Level="20" Order="10"  />
        </div>
    
        <style>
              .ClassOK
{
    font-size: 20px!important;
    color: #26C281!important
    
}
.ClassError
{
    font-size: 20px!important;
    color: #E35B5A!important;
    
}
.ClassPending
{
    font-size: 20px!important;
    color: #4C87B9!important;
}
.popover
{
    width: 75%!important;
}

              </style>
      </asp:Content>
    