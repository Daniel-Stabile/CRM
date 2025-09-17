<%@ Page Title="Anexar Documentos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Aquisicoes.AnexarDocumento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ANEXARDOCUMENTO" Title="Anexar Documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="LC_DOCUMENTOS.AQUISICAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="SELECT A.DOCUMENTO, A.HANDLE, B.NOME, A.CATEGORIA, A.PORTEEXIGIDO 
   FROM LC_DOCUMENTOS A, 
        LC_CATEGORIASDOCUMENTO B 
  WHERE A.EMPRESA = B.EMPRESA 
    AND A.CATEGORIA = B.HANDLE 
    AND A.HANDLE NOT IN (SELECT DISTINCT DOCUMENTO FROM LC_AQUISICAODOCUMENTOS 
                          WHERE AQUISICAO = @CAMPO(HANDLE)) 
 ORDER BY B.NOME,A.DOCUMENTO" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ANEXAR_DOC_AQUISICAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    