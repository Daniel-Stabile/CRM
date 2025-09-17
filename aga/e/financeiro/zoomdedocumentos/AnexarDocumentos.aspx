<%@ Page Title="Anexar documentos" Language="C#" CodeFile="~/aga/e/financeiro/zoomdedocumentos/AnexarDocumentos.aspx.cs" Inherits="zoomdedocumentosAnexarDocumentosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Src="~/uc/erp/UploadMultipleFiles.ascx" TagName="uploadMultipleFiles" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
     <script type="text/javascript">
        $(function () {
            _extensionsAllowed = null;
            _totalFiles = 10;
        })
    </script>    
    <div id="umfRow" class="row">
        <erp:uploadMultipleFiles runat="server" ID="umfAnexarDocumentos" />
    </div>
</asp:Content>