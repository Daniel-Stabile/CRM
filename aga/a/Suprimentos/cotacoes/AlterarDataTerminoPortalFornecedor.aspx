<%@ Page Title="Alterar/Consultar data término do portal de fornecedores" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.AlterarDataTerminoPortalFornecedor" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ALTERARCONSULTARDATADETRMINODACOTAODOPORTALDEFORNECEDORES" Title="Alterar/Consultar data de término da cotação do portal de fornecedores" Subtitle="Para alterar a data, selecione as cotações desejadas e clique no botão Salvar." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_WEB_COTACOES.COTACAO.GRID" DefaultFilterName="AlterarDataCotacao" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="       (
           A.HANDLE IN (SELECT CW.HANDLE
                          FROM CP_WEB_COTACOES CW
                         WHERE CW.COTACAOCAPA IN (SELECT HANDLE
                                                    FROM CP_COTACOESCAPA
                                                   WHERE FILIAL IN @FILIAIS
                                                         AND EMPRESA = @EMPRESA
                                                 )
                       )
       )
       AND
       (
           A.STATUS IN (2, 3, 7)
       ) " ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_ALTERARDATATERMINOPORTALFORNECEDOR" Level="20" Order="50"  />
        </div>
    
      </asp:Content>
    