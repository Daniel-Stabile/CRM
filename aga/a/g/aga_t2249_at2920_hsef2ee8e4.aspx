<%@ Page Title="Aguardando confirmação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Aguardando confirmação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FT_SOLICITACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND @USUARIO NOT IN (SELECT SH.USUARIO FROM FT_SOLICITACAOHISTORICO SH WHERE A.HANDLE = SH.SOLICITACAO AND SH.STATUS = 3)" FormUrl="~/aga/a/f/aga_t2249_at2920_hsef2ee8e4.aspx" UserDefinedDisableRowSelection="False" PageId="FT_PASTA_SOLICITACOES__AGUARDANDO_CONFIRMACAO_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    