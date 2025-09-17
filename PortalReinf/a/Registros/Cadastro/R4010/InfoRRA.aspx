<%@ Page Title="Informações Complementares Relativos a Rendimentos Recebidos Acumuladamente - RRA" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INFORMAESCOMPLEMENTARESRELATIVOSARENDIMENTOSRECEBIDOSACUMULADAMENTERRA" Title="Informações Complementares Relativos a Rendimentos Recebidos Acumuladamente-RRA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010INFORRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_INFORRA" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="IDENTIFICAODOADVOGADO" Title="Identificação do Advogado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INFORMAESCOMPLEMENTARESRELATIVOSARENDIMENTOSRECEBIDOSACUMULADAMENTERRA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_IDENTIFICACAOADVOGADO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010INFORRRA = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/IdentificacaoAdvogado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_INFORRA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    