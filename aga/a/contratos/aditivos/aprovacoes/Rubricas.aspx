<%@ Page Title="Rubricas de aditivos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.aprovacoes.RubricarDocumentos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RUBRICASDEADITIVOS" Title="Rubricas de aditivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_MODELODOCUMENTOS.RUBRICAS_ADITIVOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT B.HANDLE
  FROM CN_MODELODOCUMENTOS B
       JOIN CN_CONTRATOADITIVOS ON B.ADITIVO = CN_CONTRATOADITIVOS.HANDLE
       JOIN CN_CONTRATOS ON CN_CONTRATOADITIVOS.CONTRATO = CN_CONTRATOS.HANDLE
       JOIN CN_CONTRATOCOORDENADORES ON CN_CONTRATOADITIVOS.CONTRATO = CN_CONTRATOCOORDENADORES.CONTRATO
 WHERE B.ADITIVO &lt;&gt; NULL
       AND CN_CONTRATOADITIVOS .STATUS = 6
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
)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RUBRICAS_ADITIVOS" Level="20" Order="10"  />
        </div>
    
        <style>
              #RUBRICASDEADITIVO th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    