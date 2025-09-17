<%@ Page Title="Rubricar documento" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.aprovacoes.RubricarDocumentos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RUBRICARDOCUMENTO" Title="Rubricas de contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_MODELODOCUMENTOS.RUBRICAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT B.HANDLE
  FROM CN_MODELODOCUMENTOS B
       JOIN CN_CONTRATOS ON B.CONTRATO = CN_CONTRATOS.HANDLE
       JOIN CN_CONTRATOCOORDENADORES ON B.CONTRATO = CN_CONTRATOCOORDENADORES.CONTRATO
 WHERE B.CONTRATO &lt;&gt; NULL
       AND CN_CONTRATOS.STATUS = 10
       AND
       (
               (
                   CN_CONTRATOS.PESSOA IN (SELECT PESSOA
                                         FROM Z_GRUPOUSUARIOS
                                        WHERE Z_GRUPOUSUARIOS.HANDLE = @USUARIO)
                   AND B.STATUSRUBRICACONTRATADO = 1
               )
               OR
               (
                   CN_CONTRATOCOORDENADORES.CARGO = 1
                   AND CN_CONTRATOCOORDENADORES.USUARIO = @USUARIO
                   AND B.STATUSRUBRICACONTRATANTE = 1
               )
        ) 
)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="APROVACOES_RUBRICAS" Level="20" Order="10"  />
        </div>
    
        <style>
              #RUBRICARDOCUMENTO th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    