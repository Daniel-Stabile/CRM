<%@ Page Title="11.04 - Retenções NF Serv. (E) Terceiros" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="11.04 - Retenções NF Serv. (E) Terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IN_IMPOSTODOCUMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="DOCUMENTO IN ( SELECT HANDLE 
                                FROM IN_NOTAS 
                              WHERE EMPRESA = @EMPRESA 
                                   AND TIPOREGISTRO IN(1,2,3)
                                   AND EHNOTADETERCEIRO='S'
                                   AND TIPONOTA = 'A' )" FormUrl="~/aga/a/f/aga_t3901_at6086_hs76477af3.aspx" UserDefinedDisableRowSelection="False" PageId="IN_68__CARGA_DE_ARQUIVOS_TEXTOS__REGISTRO114_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    