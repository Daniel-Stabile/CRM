<%@ Page Title="Pré cadastro de CT-e" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Tributos.PreCadastroCte.PreCadastroCtePreCadastroCtePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PRCADASTRODECTE" Title="Pré cadastro de CT-e" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_PRERECEBIMENTONFES.PRECADASTROCTE.GRID" DefaultFilterName="Pré-definido padrão" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOARQUIVOXML IN (1,4,5,6)" FormUrl="~/aga/a/Tributos/PreCadastroCte/PreCadastroCteForm.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_PRECADASTROCTE" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    