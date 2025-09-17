<%@ Page Title="Aprovar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Aprovar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CN_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
 (A.STATUS = 2) AND 
(
(A.GRUPOASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C WHERE 

B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO 

AND B.ATIVO = 'S')) 
OR
(A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, 

CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND 
((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 

'S'))
)
)
AND (A.TIPO=2)" FormUrl="~/aga/a/f/aga_t2255_at4486_hs865b0154.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES_CONVENIOS__APROVAR_GRID" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="APROVAR" Title="Aprovar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_REQUISICOES.APROVAR.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
 (A.STATUS = 2) AND 
(
(A.GRUPOASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C WHERE 

B.GRUPO = C.HANDLE AND ((C.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (C.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA)) AND B.USUARIO = @USUARIO 

AND B.ATIVO = 'S')) 
OR
(A.GRUPOASSINATURAS IN (SELECT D.GRUPO FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, 

CP_GRUPOALCADAS G WHERE D.GRUPO = G.HANDLE AND I.GRUPO = G.HANDLE AND I.HANDLE = D.INTEGRANTE AND 
((G.EHHIERARQUIA = 'S' AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR (G.EHHIERARQUIA = 'N' AND I.SEQUENCIA = A.SEQUENCIAALCADA)) AND D.USUARIOAUTORIZADO = @USUARIO AND I.USUARIO = D.USUARIO AND D.ATIVO = 'S' AND I.ATIVO = 'S' AND I.AUSENTE = 

'S'))
)
)
AND (A.TIPO=2)" FormUrl="~/aga/a/f/aga_t2255_at4486_hs865b0154.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES_CONVENIOS__APROVAR_GRID" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    