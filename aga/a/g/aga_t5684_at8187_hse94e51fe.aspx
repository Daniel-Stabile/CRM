<%@ Page Title="Confirmar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITEMMOVIMENTACAOREQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
 (A.STATUS = 2) AND 
 (
   (A.GRUPOASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C, PD_ASSINATURAS H
                           WHERE B.GRUPO = C.HANDLE AND 
                                 ( H.ITEMMOVIMENTACAOREQUISICAO = A.HANDLE AND H.USUARIO = B.USUARIO ) AND
                                 (
                                   (C.EHHIERARQUIA = 'S' AND H.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR 
                                   (C.EHHIERARQUIA &lt;&gt; 'S' AND H.SEQUENCIA = A.SEQUENCIAALCADA)
                                 ) AND 
                                 B.USUARIO = @USUARIO AND 
                                 B.ATIVO = 'S'
                         )
   ) OR
   (A.GRUPOASSINATURAS IN (SELECT D.GRUPO 
                             FROM CP_GRUPOALCADASUSUARIOS D, CP_GRUPOALCADASINTEGRANTES I, CP_GRUPOALCADAS G, PD_ASSINATURAS H 
                            WHERE D.GRUPO = G.HANDLE AND 
                                  I.GRUPO = G.HANDLE AND 
                                  I.HANDLE = D.INTEGRANTE AND 
                                  ( H.ITEMMOVIMENTACAOREQUISICAO = A.HANDLE AND H.USUARIO = I.USUARIO ) AND
                                  (
                                    (G.EHHIERARQUIA = 'S' AND H.SEQUENCIA &gt;= A.SEQUENCIAALCADA) OR 
                                    (G.EHHIERARQUIA = 'N' AND H.SEQUENCIA = A.SEQUENCIAALCADA)
                                  ) AND 
                                  D.USUARIOAUTORIZADO = @USUARIO AND 
                                  I.USUARIO = D.USUARIO AND 
                                  D.ATIVO = 'S' AND 
                                  I.ATIVO = 'S' AND 
                                  I.AUSENTE = 'S'
                          )
   ) OR
   (@USUARIO IN ( SELECT B.USUARIO FROM PD_ASSINATURAS B
                    JOIN CP_GRUPOALCADASINTEGRANTES C ON ( C.GRUPO = A.GRUPOASSINATURAS )
                    JOIN CP_GRUPOALCADAS D ON (D.HANDLE = C.GRUPO)
                   WHERE B.ITEMMOVIMENTACAOREQUISICAO = A.HANDLE AND 
                         (
                           ( D.EHHIERARQUIA = 'S' AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA ) OR
                           ( D.EHHIERARQUIA &lt;&gt; 'S' AND B.SEQUENCIA = A.SEQUENCIAALCADA )
                         ) AND 
                         C.ATIVO = 'S' AND 
                         C.AUSENTE = 'N' AND 
                         C.TABTIPO = 2
                )
   )
 )
)" FormUrl="~/aga/a/f/aga_t5684_at8187_hse94e51fe.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_MOVIMENTACAOREQUISICOES__CONFIRMAR_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    