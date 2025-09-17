<%@ Page Title="Detalhes do item" Language="C#"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">
<script runat="server">

    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("PRODUTO->DESCRICAO", "PRODUTO", "DESCRICAO");
        AddWebPartStaticConnection("PRODUTO->FIGURA", "PRODUTO", "FIGURA");
        AddWebPartStaticConnection("PRODUTO->FILIAIS", "PRODUTO", "FILIAIS");        
        
    }
    
    
    protected override void OnPreRenderComplete(EventArgs e)
    { 
        base.OnPreRenderComplete(e);
        var entidade = PRODUTO.GetEntity();
        TITULO.Title = entidade.Fields["NOME"].ToString();
    }
</script>
    
    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }
    </style>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="TITULO" />
            </div>

            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8">
                     <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">

                        <erp:ErpTab runat="server" ID="ErpTab1" Text="Produto">
                            <div class="row">
		                        <wesWidget:AjaxForm 
                                    runat="server"
                                    ID="PRODUTO" 
                                    Title=""
                                    FormMode="View"
                                    BootstrapCols="12"
                                    UserDefinedCommandsVisible="false"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 									
                                    IncludeRecordInRecentItems="False"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    ChromeState="Normal"
                                    EntityViewName="PORTAL_INT_ITEM_SIMPLIFICADO_PRODUTO.FORM"
                                    PageWidgetHandle="110"  />
	                        </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab2" Text="Descrição">
                            <div class="row">
		                        <wesWidget:AjaxForm 
                                    runat="server"
                                    ID="DESCRICAO" 
                                    Title=""
                                    FormMode="ReadOnly"
                                    BootstrapCols="12"
                                    UserDefinedCommandsVisible="True"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                                    IncludeRecordInRecentItems="False"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    ChromeState="Normal"
                                    HideDeveloperCommands="false"
                                    EntityViewName="PORTAL_INT_ITEM_SIMPLIFICADO_DESCRICAO.FORM"
                                    PageWidgetHandle="110"  />
	                        </div>
                        </erp:ErpTab>

                        <erp:ErpTab runat="server" ID="ErpTab3" Text="Unidades">
                            <div class="row">
		                        <wesWidget:AjaxForm 
                                    runat="server"
                                    ID="UNIDADES" 
                                    Title=""
                                    FormMode="View"
                                    BootstrapCols="12"
                                    UserDefinedCommandsVisible="True"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                                    IncludeRecordInRecentItems="False"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False"
                                    ShowTitle="False"
                                    ChromeState="Normal"
                                    HideDeveloperCommands="false"
                                    EntityViewName="PORTAL_INT_ITEM_SIMPLIFICADO_UNIDADES.FORM"
                                    PageWidgetHandle="110"  />
	                        </div>
                        </erp:ErpTab>

                    </erp:ErpTabControl>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="row">
		                <wesWidget:AjaxForm 
                            runat="server"
                            ID="FIGURA" 
                            Title=""
                            FormMode="ReadOnly"
                            BootstrapCols="12"
                            UserDefinedCommandsVisible="True"
                            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" 
                            IncludeRecordInRecentItems="False"
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            ChromeState="Normal"
                            HideDeveloperCommands="true"
                            EntityViewName="PORTAL_INT_ITEM_SIMPLIFICADO_IMAGEM.FORM"
                            PageWidgetHandle="110"  />
	                </div>
                </div>
            </div>

            <div class="row">
                <wesWidget:SimpleGrid runat="server"
                    ID="FILIAIS"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_INT_ITEM_SIMPLIFICADO_FILIAIS.GRID"
                    UserDefinedDisableRowSelection="false"
                    UserDefinedCommandsVisible="true"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="OnlyCompany"
                    DisplayRowCommand="True"
                    UserDefinedCriteriaWhereClause="A.PRODUTOPAI = @CAMPO(HANDLE)"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    EmptyDataText="Sem filiais cadastrada para este produto."
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="True"
                    Title="Filiais"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
	        </div>
        </div>
    </div>
</asp:content>
