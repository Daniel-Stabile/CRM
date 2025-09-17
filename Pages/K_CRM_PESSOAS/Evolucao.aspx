<%@ Page Title="Evolução" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AmCharts runat="server" ID="K_EVOLUO" Title="Evolução" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_V1_EVOLUCAO.DATASOURCE.GRID" Mode="None" CompanyFilterMode="OnlyCompany" CriteriaWhereClause=" ( (@FILIAL IN (SELECT HANDLE FROM FILIAIS) AND A.FILIAL = @FILIAL) OR ( @FILIAL NOT IN (SELECT HANDLE FROM FILIAIS) AND  A.FILIAL &lt;&gt; @FILIAL))" ChartType="Column" ChartHeight="400" ChartDefinition="eyJ0eXBlIjoic2VyaWFsIiwibGFuZ3VhZ2UiOiJwdCIsInRoZW1lIjoibGlnaHQiLCJleHBvcnQiOnsiZW5hYmxlZCI6dHJ1ZX0sImNhdGVnb3J5RmllbGQiOiJtZXMiLCJzdGFydER1cmF0aW9uIjoxLCJjYXRlZ29yeUF4aXMiOnsiZ3JpZFBvc2l0aW9uIjoic3RhcnQifSwiZ3JhcGhzIjpbeyJsYWJlbFRleHQiOiIiLCJiYWxsb29uVGV4dCI6IltbY2F0ZWdvcnldXSA6IFtbdmFsdWVdXSIsImlkIjoiQW1HcmFwaC0xIiwidGl0bGUiOiJvcG9ydHVuaWRhZGVzX2dhbmhhcyIsImFscGhhRmllbGQiOiJmaWxsX2FscGhhX2ZpZWxkIiwidmFsdWVGaWVsZCI6Im9wb3J0dW5pZGFkZXNfZ2FuaGFzIiwidHlwZSI6ImNvbHVtbiIsImZpbGxBbHBoYXMiOjF9XSwidmFsdWVBeGVzIjpbeyJpZCI6IlZhbHVlQXhpcy0xIiwidGl0bGUiOiIifV0sImxlZ2VuZCI6eyJlbmFibGVkIjp0cnVlLCJwb3NpdGlvbiI6ImJvdHRvbSIsInVzZUdyYXBoU2V0dGluZ3MiOnRydWV9fQ==" PageId="K_PAGES_K_CRM_PESSOAS_EVOLUCAO" Level="50" Order="10"  />
        </div>
    
      </asp:Content>
    