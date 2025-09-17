<%@ Page Title="Requisições de contratos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.aprovacoes.AprovarRequisicoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APROVAESDEREQUISIESDECONTRATOS" Title="Aprovações de requisições de contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_REQUISICOES.APROVACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2
      AND
       (
           (
               A.GRUPOASSINATURAS IN (SELECT C.HANDLE
                                        FROM CP_GRUPOALCADASINTEGRANTES B,
                                             CP_GRUPOALCADAS C
                                       WHERE B.GRUPO = C.HANDLE
                                             AND
                                             (
                                                 (
                                                     C.EHHIERARQUIA = 'S'
                                                     AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA
                                                 )
                                                 OR
                                                 (
                                                     C.EHHIERARQUIA &lt;&gt; 'S'
                                                     AND B.SEQUENCIA = A.SEQUENCIAALCADA
                                                 )
                                             )
                                             AND B.USUARIO = @USUARIO
                                             AND B.ATIVO = 'S'
                                     )
           )
           OR
           (
               A.GRUPOASSINATURAS IN (SELECT D.GRUPO
                                        FROM CP_GRUPOALCADASUSUARIOS D,
                                             CP_GRUPOALCADASINTEGRANTES I,
                                             CP_GRUPOALCADAS G
                                       WHERE D.GRUPO = G.HANDLE
                                             AND I.GRUPO = G.HANDLE
                                             AND I.HANDLE = D.INTEGRANTE
                                             AND
                                             (
                                                 (
                                                     G.EHHIERARQUIA = 'S'
                                                     AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA
                                                 )
                                                 OR
                                                 (
                                                     G.EHHIERARQUIA = 'N'
                                                     AND I.SEQUENCIA = A.SEQUENCIAALCADA
                                                 )
                                             )
                                             AND D.USUARIOAUTORIZADO = @USUARIO
                                             AND I.USUARIO = D.USUARIO
                                             AND D.ATIVO = 'S'
                                             AND I.ATIVO = 'S'
                                             AND I.AUSENTE = 'S'
                                     )
           )
       ) " FormUrl="~/aga/a/contratos/aprovacoes/requisicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQ_CONTRATOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    