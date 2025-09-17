<%@ Page Title="Variações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Variações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PRODUTOVARIACOESMESTRE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2529" class="active"><a data-toggle="tab" href="#tabWIDGET_2529"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Almoxarifados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6433"><a data-toggle="tab" href="#tabWIDGET_6433"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Balancetes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_453_7437"><a data-toggle="tab" href="#tabWIDGET_453_7437"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Classificação NVE&gt;Atributos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2556"><a data-toggle="tab" href="#tabWIDGET_2556"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Clientes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7467"><a data-toggle="tab" href="#tabWIDGET_7467"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Custos manufaturados no SPED")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7132"><a data-toggle="tab" href="#tabWIDGET_7132"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"FCI")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2557"><a data-toggle="tab" href="#tabWIDGET_2557"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Fornecedores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7162"><a data-toggle="tab" href="#tabWIDGET_7162"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Média ponderada do preço")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7524"><a data-toggle="tab" href="#tabWIDGET_7524"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de documento habilitação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMBALAGENS"><a data-toggle="tab" href="#tabEMBALAGENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Embalagens")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2529">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2529" Title="Almoxarifados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOVARIACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1511_at2529_hsa1f63c46.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6433">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6433" Title="Balancetes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_MOVIMENTACAOVARIACAOTOTAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1958_at6433_hsc18be4d6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_453_7437">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_453_7437" Title="Classificação NVE&gt;Atributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_TR_NVEATRIBUTO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN(

SELECT B.HANDLE
  FROM PD_PRODUTOVARIACOESMESTRE VARIACAOMESTRE
       INNER JOIN PD_PRODUTOS ON (PD_PRODUTOS.HANDLE = VARIACAOMESTRE.CODIGOREFERENCIA)
       INNER JOIN TR_TIPIS ON (TR_TIPIS.HANDLE = PD_PRODUTOS.CLASSIFICACAOTIPI)
       INNER JOIN TR_NVEATRIBUTO B ON (B.NCM = TR_TIPIS.HANDLE)
 WHERE VARIACAOMESTRE.HANDLE = @RASTRO(PD_PRODUTOVARIACOESMESTRE)
   AND PD_PRODUTOS.TRIBUTACAO = 1

UNION

SELECT B.HANDLE
  FROM PD_PRODUTOVARIACOESMESTRE VARIACAOMESTRE
       INNER JOIN PD_PRODUTOS ON (PD_PRODUTOS.HANDLE = VARIACAOMESTRE.CODIGOREFERENCIA)
       INNER JOIN PD_FAMILIASPRODUTOS ON (PD_FAMILIASPRODUTOS.HANDLE = PD_PRODUTOS.FAMILIA)
       INNER JOIN TR_TIPIS ON (TR_TIPIS.HANDLE = PD_FAMILIASPRODUTOS.CLASSIFICACAOTIPI)
       INNER JOIN TR_NVEATRIBUTO B ON (B.NCM = TR_TIPIS.HANDLE)
 WHERE VARIACAOMESTRE.HANDLE = @RASTRO(PD_PRODUTOVARIACOESMESTRE)
   AND PD_PRODUTOS.TRIBUTACAO = 2

)" FormUrl="~/aga/a/f/aga_t5091_at7437_hs5675840.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2556">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2556" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_VARIACAOCLIENTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1509_at2556_hs37a948db.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7467">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7467" Title="Custos manufaturados no SPED" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_CUSTOMANUFATURADOSPED.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5142_at7467_hsf04b98ac.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7132">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7132" Title="FCI" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PRODUTOVARIACAOFCI.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.VARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4723_at7132_hsadde2e77.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2557">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2557" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_VARIACAOFORNECEDORES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.VARIACAO = @CAMPO(HANDLE) AND A.PRODUTO = @CAMPO(CODIGOREFERENCIA) AND A.FAMILIA = @CAMPO(FAMILIA)" FormUrl="~/aga/a/f/aga_t1506_at2557_hs7b810373.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7162">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7162" Title="Média ponderada do preço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="AGA_PD_PRODUTOMEDIAPRECOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOVARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4752_at7162_hs1f30b87a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7524">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7524" Title="Tipos de documento habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_DOCUMENTOHABILITACAOITEM.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.VARIACAO = @RASTRO(PD_PRODUTOVARIACOESMESTRE) AND (A.VARIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5169_at7524_hs8611b409.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabEMBALAGENS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="EMBALAGENS" Title="Embalagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOEMBALAGENS.EMBALAGENS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(CODIGOREFERENCIA) AND A.VARIACAO = @CAMPO(HANDLE)" PageId="CARGA_DE_PRODUTOS__VARIACOES_FORM" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    