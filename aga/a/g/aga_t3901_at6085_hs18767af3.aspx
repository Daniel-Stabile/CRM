<%@ Page Title="11.03 - Retenção de Merc. e Serv. (E) PJ" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="11.03 - Retenção de Merc. e Serv. (E) PJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_IMPOSTODOCUMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="DOCUMENTO IN ( SELECT HANDLE 
                                FROM IN_NOTAS 
                              WHERE EMPRESA = @EMPRESA 
                                   AND TIPOREGISTRO IN(1,2,3) 
                                   AND EHNOTADETERCEIRO='N' 
                                   AND INDICADORMOVIMENTO = 'E' )" FormUrl="~/aga/a/f/aga_t3901_at6085_hs18767af3.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__REGISTRO113_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    