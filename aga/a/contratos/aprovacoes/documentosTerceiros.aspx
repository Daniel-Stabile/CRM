<%@ Page Title="Terceiros" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSTERCEIROS" Title="Documentos terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATODOCUMENTOS.APROVTERCEIROS.GRID" DefaultFilterName="Padrao" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FUNCIONARIOTERCEIRO IS NOT NULL AND 
A.SITUACAO='E' AND A.HANDLE IN (SELECT A.HANDLE FROM CN_CONTRATODOCUMENTOS A
INNER JOIN CN_DOCUMENTOVALIDADES Z ON Z.DOCUMENTO = A.HANDLE
AND Z.GRUPOASSINATURAS IN(SELECT C.HANDLE
                                           FROM   CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                           WHERE  B.GRUPO = C.HANDLE
                                                  AND
                           ( ( C.EHHIERARQUIA = 'S'
                               AND B.SEQUENCIA &gt;= Z.SEQUENCIAALCADA )
                              OR ( C.EHHIERARQUIA &lt;&gt; 'S'
                                   AND B.SEQUENCIA = Z.SEQUENCIAALCADA ) )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S')
UNION
SELECT A.HANDLE
  FROM CN_CONTRATODOCUMENTOS A
       INNER JOIN CN_DOCUMENTOVALIDADES Z ON Z.DOCUMENTO = A.HANDLE 
       INNER JOIN CN_TIPOSDOCUMENTOS W ON W.HANDLE = A.DOCUMENTO
       INNER JOIN CN_CONTRATOCOORDENADORES Y ON Y.CONTRATO=A.CONTRATO AND Y.USUARIO=@USUARIO
       WHERE W.TIPOAPROVACAO='G')" FormUrl="~/aga/a/contratos/aprovacoes/documentoTerceiro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TERCEIROS_PENDENTES_APROVACAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    