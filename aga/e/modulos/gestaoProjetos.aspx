<%@ Page Title="Gestão projetos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.GestaoProjetos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="COMANDOS" Title="COMANDOS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PROJETOS.MODULO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="MODULO_GESTAO_PROJETOS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="CAPAMDULO" Title="Capa Módulo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GP_PARAMETROS.CAPAMODULO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.EMPRESA = @EMPRESA" UserDefinedCommandsVisible="False" PageId="MODULO_GESTAO_PROJETOS" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
            ExibirMenusModuloProjetos();
        </script>

        <style>
          .image-control {
            display: flex;
            justify-content: center;
            align-items: center;
           }
        </style>

      </asp:Content>