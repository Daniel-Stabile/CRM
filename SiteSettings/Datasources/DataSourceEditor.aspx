<%@ Page Title="Fonte de dados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.DataSourceEditor" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    
    <script>
        function resizeIframe(obj) {
            obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
        }
    </script>

    <iframe style="width: 100%" frameborder="0" id="Editor" runat="server">
        
    </iframe>

</asp:Content>
   