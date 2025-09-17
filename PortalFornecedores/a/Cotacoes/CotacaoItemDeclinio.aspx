<%@ Page Title="Declínio da rodada" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CONFIRMARDECLNIODARODADA" Title="Confirmar declínio dos itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_WEB_DECLINAR_RODADA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_FOR_COTACAO_RODADA_ITENS_DECLINIO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENSDARODADA" Title="Itens da rodada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONFIRMARDECLNIODARODADA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_FOR_COTACAO_ITENS_DECLINAR.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="15" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="    A.COTACAO = @CAMPO(COTACAO)
   AND (A.QUANTIDADECOTADA = 0 OR A.VALORUNITARIO = 0)
   AND A.EHCANCELADO &lt;&gt; 'S' 
AND A.RODADA = (SELECT X.HANDLE 
                  FROM CP_WEB_COTACAORODADAS X
                 WHERE X.COTACAO = A.COTACAO
                   AND X.NUMERORODADA = (SELECT MAX(W.NUMERORODADA)
                                           FROM CP_WEB_COTACAORODADAS W
                                          WHERE W.COTACAO = X.COTACAO) )" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_FOR_COTACAO_RODADA_ITENS_DECLINIO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    