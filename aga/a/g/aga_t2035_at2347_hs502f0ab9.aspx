<%@ Page Title="Confirmar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL ) AND 
((A.LIBERADOCONFIRMACAO = 'S' OR A.LIBERADOCONFIRMACAO IS NULL) AND 
(A.STATUSPROPOSTA = 1) AND ((A.GRUPOASSINATURAS IS NULL AND A.CONFIRMANTE = @USUARIO) OR
 (A.GRUPOASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,
CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA = 'S' 
AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND B.ATIVO = 'S') OR 
(A.GRUPOASSINATURAS IN
 (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C 
WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA &lt;&gt; 'S' AND
 B.SEQUENCIA = A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND B.ATIVO = 'S')))))" FormUrl="~/aga/a/f/aga_t2035_at2347_hs502f0ab9.aspx" UserDefinedDisableRowSelection="False" PageId="CM_PASTAPROPOSTAS__CONFIRMAR_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    