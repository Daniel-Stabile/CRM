<%@ Page Title="Analisar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Analisar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_PESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(((A.EHCLIENTE = 'S') OR (A.EHFORNECEDOR = 'S'))
  AND (    A.STATUS    = 2 ) 
  AND (    A.GRUPODEASSINATURAS IN ( SELECT C.HANDLE
                                                FROM CP_GRUPOALCADASINTEGRANTES B,
                                                     CP_GRUPOALCADAS C
                                               WHERE B.GRUPO = C.HANDLE
                                                 AND (    (     C.EHHIERARQUIA = 'S'
                                                            AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA )
                                                       OR (     C.EHHIERARQUIA &lt;&gt; 'S'
                                                            AND B.SEQUENCIA = A.SEQUENCIAALCADA ) )
                                                 AND B.USUARIO = @USUARIO
                                                 AND B.ATIVO = 'S' )
        OR A.GRUPODEASSINATURAS IN ( SELECT D.GRUPO
                                                FROM CP_GRUPOALCADASUSUARIOS D,
                                                     CP_GRUPOALCADASINTEGRANTES I,
                                                     CP_GRUPOALCADAS G
                                               WHERE D.GRUPO = G.HANDLE
                                                 AND I.GRUPO = G.HANDLE
                                                 AND I.HANDLE = D.INTEGRANTE
                                                 AND (    (     G.EHHIERARQUIA = 'S'
                                                            AND I.SEQUENCIA &gt;= A.SEQUENCIAALCADA )
                                                       OR (     G.EHHIERARQUIA = 'N'
                                                            AND I.SEQUENCIA = A.SEQUENCIAALCADA ) )
                                                 AND D.USUARIOAUTORIZADO = @USUARIO
                                                 AND I.USUARIO = D.USUARIO
                                                 AND D.ATIVO = 'S'
                                                 AND I.ATIVO = 'S'
                                                 AND I.AUSENTE = 'S' ) ) )" FormUrl="~/aga/a/f/aga_t717_at6717_hsb1fa0ff6.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_CLIENTE_COM_APROVACAO__CLIENTES_APROVACAO_ANALISAR_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    