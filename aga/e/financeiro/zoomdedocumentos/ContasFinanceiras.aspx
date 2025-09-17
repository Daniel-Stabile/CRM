<%@ Page Title="Contas financeiras" Language="C#" CodeFile="~/aga/e/financeiro/zoomdedocumentos/ContasFinanceiras.aspx.cs" Inherits="aga_e_financeiro_zoomdedocumentos_ContasFinanceiras" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Src="~/uc/generico/ContasFinanceirasForm.ascx" TagName="contasFinanceirasForm" TagPrefix="generico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <div id="umfRow" class="row">
        <generico:contasFinanceirasForm runat="server" ID="ContasFinanceirasUC" CodigoInterno="ciBCP" />
    </div>
</asp:Content>
