<%@ Page Title="Remessa Bancaria CRE" Language="C#" CodeFile="~/Erp/Financeiro/RemessaBancaria/Inserir.aspx.cs" Inherits="RemessaBancariaInserirPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDPARCELAS" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_FN_PARCELAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="99" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PREVISAO &lt;&gt; 'S'
       AND A.EMABERTO = 'S'
       AND A.REMESSA IS NULL
       AND A.TEMRETENCAONABAIXA = 'N'
       AND A.DOCUMENTO IN (SELECT HANDLE
                             FROM FN_DOCUMENTOS B
                            WHERE B.OPERACAOCANCELAMENTO IS NULL
                                  AND
                                  (
                                      B.ENTRADASAIDA = 'S'
                                      OR
                                      (
                                          B.ENTRADASAIDA = 'E'
                                          AND B.TIPODEMOVIMENTO = 3
                                      )
                                  )
                          ) 
" UserDefinedDisableRowSelection="False" PageId="ERP_FINANCEIRO_REMESSABANCARIA_INSERIR" Level="20" Order="200"  />
        </div>
    
      </asp:Content>
    