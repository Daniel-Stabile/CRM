<%@ Page Title="Lançamentos" Language="C#" AutoEventWireup="true" CodeFile="lancamentos.aspx.cs" Inherits="AdiantamentosLancamentosPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:content id="Lancamento" contentplaceholderid="Main" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div>
                <wes:SimpleGrid runat="server"
                    ID="LANCAMENTOSADT" 
                    UserDefinedPageSize="6" 
                    UserDefinedSelectColumnVisible="false"                    
                    Mode="None" 
                    ShowTitle="true" 
                    Title="Lançamentos" 
                    DisplayRowCommand="false" 
                    UserDefinedDisableRowSelection="false"
                    CanInsert="false" 
                    CanUpdate="false" 
                    CanDelete="false" 
                    EntityViewName="LANCAMENTOS_ADTO_CLI_FORN.DATASOURCE.GRID" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div>
                <wes:SimpleGrid runat="server" 
                    ID="RESUMOLANCAMENTO" 
                    FormMode="View" 
                    BootstrapCols="12" 
                    ShowTitle="false"
                    EntityViewName="RESUMO_LANCAMENTOS_ADTO_CLI_FORN.DATASOURCE.GRID" 
                    CanDelete="False" 
                    CanUpdate="False" 
                    CanInsert="False"
                    ChromeState="Normal" 
                    IncludeRecordInRecentItems="True" 
                    UserDefinedCommandsVisible="True" 
                    ProviderWidgetUniqueId="LANCAMENTOSADT"
                    UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT DOC.HANDLE FROM CT_LANCAMENTOS DOC JOIN CT_CONTAS CON ON (CON.HANDLE = DOC.CONTA) JOIN CT_HISTORICOSPADROES HIS ON (HIS.HANDLE = DOC.HISTORICO) WHERE DOC.HANDLE = @CAMPO(HANDLE) )"
                    HideDeveloperCommands="false" />
            </div>
        </div>
        <div class="col-md-6">
            <div>
                <wes:SimpleGrid runat="server"
                    ID="RESUMOGRID" 
                    UserDefinedPageSize="3" 
                    UserDefinedSelectColumnVisible="false"
                    UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)" 
                    ProviderWidgetUniqueId="LANCAMENTOSADT"
                    Mode="None" 
                    ShowTitle="false" 
                    DisplayRowCommand="false" 
                    UserDefinedDisableRowSelection="true"
                    CanInsert="false" 
                    CanUpdate="false" 
                    CanDelete="false" 
                    EntityViewName="RESUMO_GRID_CT_LANCAMENTOS_CC_ADTO.DATASOURCE.GRID" />
            </div>
        </div>
    </div>    
</asp:content>
