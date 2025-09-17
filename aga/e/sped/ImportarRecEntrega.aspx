<%@ Page Title="Importar recibo de entrega" Language="C#" CodeFile="~/aga/e/sped/ImportarRecEntrega.aspx.cs" Inherits="ImportarRecEntregaPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Src="~/uc/erp/UploadMultipleFiles.ascx" TagName="uploadMultipleFiles" TagPrefix="erp" %>

      <asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
        <style>
         
        </style>
        <script type="text/javascript">
            $(function () {
			    _extensionsAllowed = null;
                _totalFiles = 1;
            })
        </script>
        <div id="umfRow">
            <erp:uploadMultipleFiles runat="server" ID="umfRecEntrega" />
        </div>
    </asp:Content>    