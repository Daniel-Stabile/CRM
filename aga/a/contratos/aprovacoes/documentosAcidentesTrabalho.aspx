<%@ Page Title="Acidentes de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSACIDENTEDETRABALHO" Title="Documentos acidente de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_ACIDENTESTRABALHO.APROVACAO.GRID" DefaultFilterName="Padrao" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND A.HANDLE IN (SELECT A.HANDLE FROM CN_ACIDENTESTRABALHO A 
WHERE A.GRUPOASSINATURAS IN(SELECT C.HANDLE
                                           FROM   CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                           WHERE  B.GRUPO = C.HANDLE
                                                  AND
                           ( ( C.EHHIERARQUIA = 'S'
                               AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA )
                              OR ( C.EHHIERARQUIA &lt;&gt; 'S'
                                   AND B.SEQUENCIA = A.SEQUENCIAALCADA ) )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S')
UNION
SELECT A.HANDLE
  FROM CN_ACIDENTESTRABALHO A
       INNER JOIN CN_TIPOSDOCUMENTOS W ON W.HANDLE = A.TIPODOCUMENTO
       INNER JOIN CN_CONTRATOCOORDENADORES Y ON Y.CONTRATO=A.CONTRATO AND Y.USUARIO=@USUARIO
       WHERE W.TIPOAPROVACAO='G')" FormUrl="~/aga/a/contratos/aprovacoes/documentoAcidenteTrabalho.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ACIDENTES_PENDENTES_APROVACAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    