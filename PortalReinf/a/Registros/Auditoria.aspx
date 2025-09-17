<%@ Page Title="Auditoria" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_AUDITORIAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="REINF_REGISTROS_AUDITORIA" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $( document ).ready(function() {
    var xml = $("#ctl00_Main_AUDITORIA_PageControl_XML_XML div div span").html();
    xml = formatXML(xml);
    var res = xml.replace(/</g, "&lt;").replace(/>/g, "&gt;");
    $("#ctl00_Main_AUDITORIA_PageControl_XML_XML div div span").html(res)
    
    xml = $("#ctl00_Main_AUDITORIA_PageControl_XMLRETORNO_XMLRETORNO div div span").html();
    xml = formatXML(xml);
    res = xml.replace(/</g, "&lt;").replace(/>/g, "&gt;");
    $("#ctl00_Main_AUDITORIA_PageControl_XMLRETORNO_XMLRETORNO div div span").html(res)
    
    xml = $("#ctl00_Main_AUDITORIA_PageControl_GERAL_GERAL_SITUACAO_3 div div span").html();
    res = xml.replace(/</g, "&lt;").replace(/>/g, "&gt;");
    $("#ctl00_Main_AUDITORIA_PageControl_GERAL_GERAL_SITUACAO_3 div div span").html(res)
});

function formatXML(input)
{
    indent = '\t';
    
    xmlString = input.replace(/^\s+|\s+$/g, '');
    xmlString = input
                   .replace( /(<([a-zA-Z]+\b)[^>]*>)(?!<\/\2>|[\w\s])/g, "$1\n" ) 
                   .replace( /(<\/[a-zA-Z]+[^>]*>)/g, "$1\n")
                   .replace( />\s+(.+?)\s+<(?!\/)/g, ">\n$1\n<")
                   .replace( />(.+?)<([a-zA-Z])/g, ">\n$1\n<$2")
                   .replace(/\?></, "?>\n<");
    xmlArr = xmlString.split('\n');  
    var tabs = '';  
    var start = 0;  
    
    if (/^<[?]xml/.test(xmlArr[0]))  start++;  
    
    for (var i = start; i < xmlArr.length; i++)
    {  
        var line = xmlArr[i].replace(/^\s+|\s+$/g, '');  
    
        if (/^<[/]/.test(line))  
        {
            tabs = tabs.replace(indent, '');  
            xmlArr[i] = tabs + line;  
        }
        else if (/<.*>.*<\/.*>|<.*[^>]\/>/.test(line))
        {
             xmlArr[i] = tabs + line;
        }
        else if (/<.*>/.test(line)) 
        {
            xmlArr[i] = tabs + line;  
            tabs += indent;  
        }
        else  
        {
            xmlArr[i] = tabs + line;  
        }
    }
    
    return  xmlArr.join('\n');  
}

              </script>
      </asp:Content>
    