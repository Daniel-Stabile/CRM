<%@ Page Title="Importar Orçamento" Language="C#" CodeFile="~/aga/e/orcamento/ImportarOrcamento.aspx.cs" Inherits="orcamentoImportarOrcamentoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Src="~/uc/erp/UploadMultipleFiles.ascx" TagName="uploadMultipleFiles" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script type="text/javascript">
        $(function () {
            _extensionsAllowed = ['.xls', '.xlsx'];
            _totalFiles = 1;
        })

        function CloseModalAndRefresh() {
            setTimeout(function () {
                parent.Benner.ModalPage.hide();
                parent.location.reload();
            }, 2000);
        }
    </script>
    <div id="umfRow" class="row">
        <erp:uploadMultipleFiles runat="server" ID="umfXMLSReceita" />
    </div>
</asp:Content>
