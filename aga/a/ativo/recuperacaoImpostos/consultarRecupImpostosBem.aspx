<%@ Page Title="Recuperação impostos do bem" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="BEM" Title="Bem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AT_ITENS.COMPACTO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CIAPCRDITOSDEICMSCOMFATOR" class="active"><a data-toggle="tab" href="#tabCIAPCRDITOSDEICMSCOMFATOR"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Créditos CIAP (com Fator)")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CIAPMOVIMENTAESCIAP"><a data-toggle="tab" href="#tabCIAPMOVIMENTAESCIAP"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Movimentações CIAP")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CIAPOUTROSCRDITOSDEICMS"><a data-toggle="tab" href="#tabCIAPOUTROSCRDITOSDEICMS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Outros créditos CIAP")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CIAPPARCELASDERECUPERAODEICMS"><a data-toggle="tab" href="#tabCIAPPARCELASDERECUPERAODEICMS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"CIAP&gt;Parcelas de recuperação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PISCOFINSPARCELASDERECUPERAODEPISCOFINS"><a data-toggle="tab" href="#tabPISCOFINSPARCELASDERECUPERAODEPISCOFINS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"PIS/COFINS&gt;Parcelas de recuperação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PISCOFINSPROCESSOSREFERENCIADOS"><a data-toggle="tab" href="#tabPISCOFINSPROCESSOSREFERENCIADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"PIS/COFINS&gt;Processos referenciados")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCIAPCRDITOSDEICMSCOMFATOR">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CIAPCRDITOSDEICMSCOMFATOR" Title="Créditos CIAP (com Fator)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMCREDITOSICMS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1735_at6459_hs56754bb9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCIAPMOVIMENTAESCIAP">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CIAPMOVIMENTAESCIAP" Title="Movimentações CIAP" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMCIAPMOVIMENTACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3995_at6460_hsfc7364df.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabCIAPOUTROSCRDITOSDEICMS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CIAPOUTROSCRDITOSDEICMS" Title="Outros créditos CIAP" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_ITEMCIAPOUTROSCREDITOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4074_at6461_hs85bc4df5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabCIAPPARCELASDERECUPERAODEICMS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CIAPPARCELASDERECUPERAODEICMS" Title="CIAP&gt;Parcelas de recuperação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMPARCELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.IMPOSTO IN(
     SELECT PARFIL.IMPOSTO 
       FROM AT_ITENS ITE, AT_PARAMETROFILIAL PARFIL
      WHERE ITE.HANDLE = A.ITEM
        AND ITE.FILIAL = PARFIL.FILIAL ) AND (A.ITEM = @CAMPO(HANDLE))
" FormUrl="~/aga/a/f/aga_t3122_at6462_hsfe44b1b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabPISCOFINSPARCELASDERECUPERAODEPISCOFINS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PISCOFINSPARCELASDERECUPERAODEPISCOFINS" Title="PIS/COFINS&gt;Parcelas de recuperação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMPARCELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(
A.IMPOSTO = (
      SELECT PAR.IMPOSTOPIS FROM AT_PARAMETROS PAR
       WHERE PAR.EMPRESA = @EMPRESAMESTRE(AT_PARAMETROS) )
OR
A.IMPOSTO = (
      SELECT PAR.IMPOSTOCOFINS FROM AT_PARAMETROS PAR
       WHERE PAR.EMPRESA = @EMPRESAMESTRE(AT_PARAMETROS) )
) AND (A.ITEM = @CAMPO(HANDLE))
" FormUrl="~/aga/a/f/aga_t3122_at6463_hs88b0aeb8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabPISCOFINSPROCESSOSREFERENCIADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PISCOFINSPROCESSOSREFERENCIADOS" Title="PIS/COFINS&gt;Processos referenciados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BEM" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_ITEMPROCESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4122_at6464_hs6e2373b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="RECUPERACAO_IMPOSTOS_ATIVO" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    