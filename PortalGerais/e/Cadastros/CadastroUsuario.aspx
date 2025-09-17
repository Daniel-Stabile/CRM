<%@ Page Title="Usuário" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">


    <script runat="server">
    
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            FrmCadastroUsuario.CanUpdate = FrmCadastroUsuario.GetEntityHandle().IsValid();
            FrmCadastroUsuario.CanInsert = FrmCadastroUsuario.GetEntityHandle().IsInvalid();
        }    
    
    </script>

    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FrmCadastroUsuario"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_GER_USUARIO.FORM"
            UserDefinedSelectColumnVisible="False"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            Title="Dados do usuário>>"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
