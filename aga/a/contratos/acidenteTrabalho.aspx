<%@ Page Title="Acidente de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ACIDENTEDETRABALHO" Title="Acidente de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ACIDENTESTRABALHO.ACIDENTE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ACIDENTE_TRABALHO_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS" class="active"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TERCEIROSENVOLVIDOS"><a data-toggle="tab" href="#tabTERCEIROSENVOLVIDOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Terceiros envolvidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinaturas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Auditoria")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ACIDENTEDETRABALHO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_DOCUMENTOANEXOS.DOCANEXO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ACIDENTETRABALHO= @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/anexoAcidenteTrabalho.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ACIDENTE_TRABALHO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTERCEIROSENVOLVIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TERCEIROSENVOLVIDOS" Title="Terceiros envolvidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ACIDENTEDETRABALHO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ACIDENTESTERCEIROS.ACIDTERC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ACIDENTETRABALHO= @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/acidenteTerceiros.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ACIDENTE_TRABALHO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ACIDENTEDETRABALHO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.ACIDENTETRABALHO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTOACIDENTE=@CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ACIDENTE_TRABALHO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ACIDENTEDETRABALHO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_ACIDENTESTRABALHO.AUDITORIA.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE=@CAMPO(HANDLE)" UserDefinedCommandsVisible="False" PageId="ACIDENTE_TRABALHO_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    