<%@ Page Title="Editor de layout" Language="C#" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.EditReportHtmlPage" %>
<%@ Register Assembly="Stimulsoft.Report.MobileDesign" Namespace="Stimulsoft.Report.MobileDesign" TagPrefix="Stimulsoft" %>

<asp:content id="Content1" contentplaceholderid="Main" runat="Server">
    <script>
        $(document).ready(function () {
            function calcReportDimensions() {
                var reportContainer = $("span.report-edit-stimulsoft");
                var pageContainer = $('div.page-container');

                var pageContainerTop = 65;
                if (window.innerHeight < pageContainer.outerHeight() + pageContainerTop) {
                    reportContainer.css('height', (pageContainer.outerHeight() - pageContainerTop) + 'px');
                } else {
                    reportContainer.css('height', window.innerHeight - reportContainer.offset().top + 'px');
                }
            }
            calcReportDimensions();

            $(window).on('resize', function () {
                calcReportDimensions();
            });
        });
    </script>
    <Stimulsoft:StiMobileDesigner ID="stiMobileDesigner" runat="server" OnSaveReport="OnSaveReport" OnGetReport="OnGetReport" 
        CssClass="report-edit-stimulsoft ignore-context-menu" Theme="Office2013WhiteBlue" GlobalizationFile=".\SiteSettings\Localization\pt-BR.xml"
        ShowSaveButton="True"
        ShowFileMenuNew="false" 
        ShowFileMenuOpen="false" 
        ShowFileMenuClose="false"   />
</asp:content>
