<%@ Page Title="Suprimentos - Indicadores" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.indicadores.SuprimentosIndicadores" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRA.INDICADORES.GRID" DefaultFilterName="Filtro indicadores" Mode="FixedRequired" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="0"  />
        <wes:AjaxForm runat="server" ID="BOTOCOLETA" Title="Botão Coleta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_AGENDAMENTOCOLETA.BOTAOCOLETA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="1"  />
        <wes:AmCharts runat="server" ID="OCEMITIDASPERODO" Title="OC emitidas período" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_GRAFICO_VALOR_TOTAL_OCS_EMITIDAS.DATASOURCE.GRID" Mode="None" CompanyFilterMode="None" ChartType="Doughnut" ChartHeight="469" ChartDefinition="eyJ0eXBlIjoicGllIiwibGFuZ3VhZ2UiOiJwdCIsInRoZW1lIjoibGlnaHQiLCJwdWxsT3V0T25seU9uZSI6dHJ1ZSwidGl0bGVGaWVsZCI6InN0YXR1cyIsInZhbHVlRmllbGQiOiJ2YWxvciIsImFscGhhRmllbGQiOiJmaWxsX2FscGhhX2ZpZWxkIiwiYmFsbG9vblRleHQiOiJbW3RpdGxlXV08YnI+PHNwYW4gc3R5bGU9J2ZvbnQtc2l6ZToxNHB4Jz48Yj5bW3BlcmNlbnRzXV0lPC9iPjwvc3Bhbj4iLCJsYWJlbFRleHQiOiJbW3RpdGxlXV06IFtbcGVyY2VudHNdXSUiLCJsYWJlbHNFbmFibGVkIjpmYWxzZSwibGVnZW5kIjp7ImVuYWJsZWQiOmZhbHNlLCJhbGlnbiI6ImNlbnRlciIsIm1hcmtlclR5cGUiOiJjaXJjbGUiLCJwb3NpdGlvbiI6InRvcCJ9LCJjb2xvcnMiOlsiIzI2QzI4MSIsIiM0Qzg3QjkiLCIjRTg3RTA0Il0sImlubmVyUmFkaXVzIjoiNzAlIiwicmFkaXVzIjo5MCwiYW5nbGUiOjAsImRlcHRoM0QiOjAsImRlY2ltYWxTZXBhcmF0b3IiOiIsIn0=" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="4"  />
        <wes:Tile runat="server" ID="TOTALRECEBIDAS" Title="Total recebidas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_VALOR_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.STATUSOC = 4 AND
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES)" ValueFormat="N2" Value="VALOROCRECEBIMENTO" Description="Total recebidas" Icon="fa fa-cart-arrow-down" Color="green-jungle" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="5"  />
        <wes:Tile runat="server" ID="QUANTIDADEOCRECEBIDAS" Title="Quantidade OC recebidas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_QUANTIDADE_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.ORDEMCOMPRA IN ( SELECT ORDEMCOMPRA FROM CP_DWINDICADORESREGISTROS A WHERE 
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND A.STATUSOC = 4
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES))" Value="ORDEMCOMPRA" Description="Quantidade OC recebidas" Icon="fa fa-cart-arrow-down" Color="green-jungle" ValueAggregation="Count" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="6"  />
        <wes:Tile runat="server" ID="TOTALPARCIALRECEBIDAS" Title="Total parcial - recebidas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_VALOR_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.STATUSOC = 3 AND
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES)" ValueFormat="N2" Value="VALOROCRECEBIMENTO" Description="Total parcial - recebidas" Icon="fa fa-cart-plus" Color="blue-soft" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="9"  />
        <wes:Tile runat="server" ID="TOTALPARCIALARECEBER" Title="Total parcial - a receber" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_VALOR_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.STATUSOC = 3 AND
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES)" ValueFormat="N2" Value="SALDOVALOROCITEM" Description="Total parcial - a receber" Icon="fa fa-cart-plus" Color="blue-soft" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="12"  />
        <wes:Tile runat="server" ID="QUANTIDADEOCRECEBIDASPARCIAL" Title="Quantidade OC recebidas parcial" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_QUANTIDADE_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.ORDEMCOMPRA IN ( SELECT ORDEMCOMPRA FROM CP_DWINDICADORESREGISTROS A WHERE 
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND A.STATUSOC = 3
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES))" Value="ORDEMCOMPRA" Description="Quantidade OC recebidas parcial" Icon="fa fa-cart-plus" Color="blue-soft" ValueAggregation="Count" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="21"  />
        <wes:Tile runat="server" ID="TOTALAPROVADAS" Title="Total aprovadas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_VALOR_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.STATUSOC = 2 AND
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES)" ValueFormat="N2" Value="VALOROCITEM" Description="Total aprovadas" Icon="fa fa-shopping-cart" Color="yellow-gold" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="24"  />
        <wes:Tile runat="server" ID="QUANTIDADEOCAPROVADAS" Title="Quantidade OC aprovadas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_QUANTIDADE_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.ORDEMCOMPRA IN ( SELECT ORDEMCOMPRA FROM CP_DWINDICADORESREGISTROS A WHERE 
@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND A.STATUSOC = 2
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES))" Value="ORDEMCOMPRA" Description="Quantidade OC aprovadas" Icon="fa fa-shopping-cart" Color="yellow-gold" ValueAggregation="Count" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="26"  />
        <wes:Tile runat="server" ID="TOTALCOMPRAS" Title="Total compras" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_VALOR_TOTAL_OCS_EMITIDAS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="@CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES)" ValueFormat="N2" Value="VALOR" Description="Total compras" Icon="fa fa-th-large" Color="dark" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="27"  />
        <wes:Tile runat="server" ID="QUANTIDADETOTALOC" Title="Quantidade total OC" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADORES_SUPRIMENTOS_QUANTIDADE_OCS.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.ORDEMCOMPRA IN ( SELECT ORDEMCOMPRA FROM CP_DWINDICADORESREGISTROS A WHERE @CONDICAO('EMPRESA', 'EM', EMPRESAS) 
AND @CONDICAO('FILIAL', 'EM', FILIAIS)
AND @CONDICAO('FAMILIA', 'EM', FAMILIAS)
AND @CONDICAO('DATACONFIRMACAO', 'MAIOR OU IGUAL', PERIODO)
AND @CONDICAO('DATACONFIRMACAO', 'MENOR OU IGUAL', DATAFINALPERIODO)
AND @CONDICAO('FORNECEDOR', 'EM', FORNECEDORES)
AND A.STATUSOC IN (2, 3, 4)
AND @CONDICAO('COMPRADOR', 'EM', COMPRADORES))" Value="ORDEMCOMPRA" Description="Quantidade total OC" Icon="fa fa-th-large" Color="dark" ValueAggregation="Count" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="41"  />
        <wes:ActionView runat="server" ID="HISTRICOLTIMOS6MESESVALORESOCPORSTATUS" Title="Histórico últimos 6 meses - Valores OC por status" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosHistoricoMesesStatusOc" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="51"  />
        <wes:ActionView runat="server" ID="HISTRICOLTIMOS6MESESVALORESCOMPRAS" Title="Histórico últimos 6 meses - Valores compras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosHistoricoMesesValoresCompra" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="54"  />
        <wes:ActionView runat="server" ID="EFICINCIACOMPRADORES" Title="Eficiência compradores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosEficienciaValoresCompras" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="57"  />
        <wes:AmCharts runat="server" ID="SAVINGPORCOMPRADOR" Title="Saving por comprador" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="10" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADOR_SUPRIMENTOS_SAVING_COMPRADOR.DATASOURCE.GRID" Mode="None" CompanyFilterMode="None" ChartType="Column" ChartHeight="330" ChartDefinition="eyJ0eXBlIjoic2VyaWFsIiwibGFuZ3VhZ2UiOiJwdCIsImV4cG9ydCI6eyJlbmFibGVkIjp0cnVlfSwiY2F0ZWdvcnlGaWVsZCI6ImNvbXByYWRvciIsInN0YXJ0RHVyYXRpb24iOjEsImNhdGVnb3J5QXhpcyI6eyJncmlkUG9zaXRpb24iOiJzdGFydCJ9LCJncmFwaHMiOlt7ImxhYmVsVGV4dCI6IiIsImJhbGxvb25UZXh0IjoiW1tjYXRlZ29yeV1dIDogW1t2YWx1ZV1dIiwiaWQiOiJBbUdyYXBoLTEiLCJ0aXRsZSI6IlZhbG9yIGJhc2VsaW5lIiwiYWxwaGFGaWVsZCI6ImZpbGxfYWxwaGFfZmllbGQiLCJ2YWx1ZUZpZWxkIjoidmFsb3Jjb3RhY2FvIiwidHlwZSI6ImNvbHVtbiIsImZpbGxBbHBoYXMiOjEsImZpbGxDb2xvcnMiOiIjNGM4N2I5IiwibGluZUNvbG9yIjoiIzRjODdiOSIsImJ1bGxldENvbG9yIjoiIzRjODdiOSIsImNvZGUiOiJmdW5jdGlvbiBjdXN0b21pemF0aW9uKHNlcmllLCB2YWx1ZUF4aXMpIHtcbiAgICBzZXJpZS5jb2x1bW5zLnRlbXBsYXRlLmNvbHVtbi5jb3JuZXJSYWRpdXNUb3BMZWZ0ID0gMDtcbiAgICBzZXJpZS5jb2x1bW5zLnRlbXBsYXRlLmNvbHVtbi5jb3JuZXJSYWRpdXNUb3BSaWdodCA9IDA7XG4gICAgc2VyaWUuY29sdW1ucy50ZW1wbGF0ZS5jb2x1bW4uZmlsbE9wYWNpdHkgPSAxLjA7XG4gICAgXG4gICAgdmFsdWVBeGlzLm51bWJlckZvcm1hdHRlciA9IG5ldyBhbTRjb3JlLk51bWJlckZvcm1hdHRlcigpO1xuICAgIHZhbHVlQXhpcy5udW1iZXJGb3JtYXR0ZXIubnVtYmVyRm9ybWF0ID0gXCIjLjBhXCI7IFxuICAgIHZhbHVlQXhpcy5jdXJzb3JUb29sdGlwRW5hYmxlZCA9IGZhbHNlO1xuICAgIFxuICAgIHNlcmllLmNvbHVtbnMudGVtcGxhdGUudG9vbHRpcFRleHQgPSBcInt2YWx1ZVkuZm9ybWF0TnVtYmVyKCcjLjBhJyl9XCI7XG59In0seyJiYWxsb29uVGV4dCI6IltbdmFsdWVdXSIsImxhYmVsVGV4dCI6IiIsImlkIjoic2VyaWUtMTY3MTEyNjc5MTE1MiIsInRpdGxlIjoiVmFsb3IgY29tcHJhIiwidmFsdWVGaWVsZCI6InZhbG9yb2MiLCJhbHBoYUZpZWxkIjoiZmlsbF9hbHBoYV9maWVsZCIsInR5cGUiOiJjb2x1bW4iLCJidWxsZXQiOm51bGwsImxpbmVBbHBoYSI6MCwiZmlsbEFscGhhcyI6MSwiZmlsbENvbG9ycyI6IiNlODdlMDQiLCJsaW5lQ29sb3IiOiIjZTg3ZTA0IiwiYnVsbGV0Q29sb3IiOiIjZTg3ZTA0IiwiY29kZSI6ImZ1bmN0aW9uIGN1c3RvbWl6YXRpb24oc2VyaWUsIHZhbHVlQXhpcykge1xuICAgIHNlcmllLmNvbHVtbnMudGVtcGxhdGUuY29sdW1uLmNvcm5lclJhZGl1c1RvcExlZnQgPSAwO1xuICAgIHNlcmllLmNvbHVtbnMudGVtcGxhdGUuY29sdW1uLmNvcm5lclJhZGl1c1RvcFJpZ2h0ID0gMDtcbiAgICBzZXJpZS5jb2x1bW5zLnRlbXBsYXRlLmNvbHVtbi5maWxsT3BhY2l0eSA9IDEuMDtcbiAgICBcbiAgICB2YWx1ZUF4aXMubnVtYmVyRm9ybWF0dGVyID0gbmV3IGFtNGNvcmUuTnVtYmVyRm9ybWF0dGVyKCk7XG4gICAgdmFsdWVBeGlzLm51bWJlckZvcm1hdHRlci5udW1iZXJGb3JtYXQgPSBcIiMuMGFcIjsgXG4gICAgXG4gICAgc2VyaWUuY29sdW1ucy50ZW1wbGF0ZS50b29sdGlwVGV4dCA9IFwie3ZhbHVlWS5mb3JtYXROdW1iZXIoJyMuMGEnKX1cIjtcbn0ifSx7ImJhbGxvb25UZXh0IjoiW1tjYXRlZ29yeV1dIDogW1t2YWx1ZV1dIiwibGFiZWxUZXh0IjoiIiwiaWQiOiJzZXJpZS0xNjcxMTM2MzQ1MTU0IiwidGl0bGUiOiJTYXZpbmciLCJ2YWx1ZUZpZWxkIjoidmFsb3JzYXZpbmciLCJhbHBoYUZpZWxkIjoiZmlsbF9hbHBoYV9maWVsZCIsInR5cGUiOiJjb2x1bW4iLCJidWxsZXQiOm51bGwsImxpbmVBbHBoYSI6MCwiZmlsbEFscGhhcyI6MSwiZmlsbENvbG9ycyI6IiNiMGI2YmYiLCJsaW5lQ29sb3IiOiIjYjBiNmJmIiwiYnVsbGV0Q29sb3IiOiIjYjBiNmJmIiwiY29kZSI6ImZ1bmN0aW9uIGN1c3RvbWl6YXRpb24oc2VyaWUsIHZhbHVlQXhpcykge1xuICAgIHNlcmllLmNvbHVtbnMudGVtcGxhdGUuY29sdW1uLmNvcm5lclJhZGl1c1RvcExlZnQgPSAwO1xuICAgIHNlcmllLmNvbHVtbnMudGVtcGxhdGUuY29sdW1uLmNvcm5lclJhZGl1c1RvcFJpZ2h0ID0gMDtcbiAgICBzZXJpZS5jb2x1bW5zLnRlbXBsYXRlLmNvbHVtbi5maWxsT3BhY2l0eSA9IDEuMDtcbiAgICBcbiAgICB2YWx1ZUF4aXMubnVtYmVyRm9ybWF0dGVyID0gbmV3IGFtNGNvcmUuTnVtYmVyRm9ybWF0dGVyKCk7XG4gICAgdmFsdWVBeGlzLm51bWJlckZvcm1hdHRlci5udW1iZXJGb3JtYXQgPSBcIiMuMGFcIjsgXG4gICAgXG4gICAgc2VyaWUuY29sdW1ucy50ZW1wbGF0ZS50b29sdGlwVGV4dCA9IFwie3ZhbHVlWS5mb3JtYXROdW1iZXIoJyMuMGEnKX1cIjtcbn0ifSx7ImJhbGxvb25UZXh0IjoiW1tjYXRlZ29yeV1dIDogW1t2YWx1ZV1dIiwibGFiZWxUZXh0IjoiIiwiaWQiOiJzZXJpZS0xNjcxNDczNDU0NTA1IiwidGl0bGUiOiIlIFNhdmluZyIsInZhbHVlRmllbGQiOiJwZXJjZW50dWFsc2F2aW5nIiwiYWxwaGFGaWVsZCI6ImZpbGxfYWxwaGFfZmllbGQiLCJ0eXBlIjoibGluZSIsImJ1bGxldCI6InJvdW5kIiwibGluZUFscGhhIjoxLCJmaWxsQWxwaGFzIjowLCJmaWxsQ29sb3JzIjoiIzI2YzI4MSIsImxpbmVDb2xvciI6IiMyNmMyODEiLCJidWxsZXRDb2xvciI6IiMyNmMyODEiLCJjb2RlIjoiZnVuY3Rpb24gY3VzdG9taXphdGlvbihzZXJpZSwgdmFsdWVBeGlzKSB7XG4gICAgc2VyaWUudG9vbHRpcFRleHQgPSBcInt2YWx1ZVkuZm9ybWF0TnVtYmVyKCcjIy4jJyl9JVwiO1xufSJ9XSwidmFsdWVBeGVzIjpbeyJpZCI6IlZhbHVlQXhpcy0xIiwidGl0bGUiOiIifV0sImxlZ2VuZCI6eyJlbmFibGVkIjp0cnVlLCJwb3NpdGlvbiI6ImJvdHRvbSIsInVzZUdyYXBoU2V0dGluZ3MiOnRydWV9LCJ2ZXJzaW9uIjoiNCIsInJvdGF0ZSI6ZmFsc2UsInRoZW1lNCI6Im5vdGhlbWUiLCJjb2RlIjoiZnVuY3Rpb24gY3VzdG9taXphdGlvbihjaGFydCkge1xuICAgIGNoYXJ0Lmxhbmd1YWdlLmxvY2FsZVtcIl9kZWNpbWFsU2VwYXJhdG9yXCJdID0gXCIsXCI7XG5cbiAgICB2YXIgbmV3VmFsdWVBeGlzID0gY2hhcnQueUF4ZXMucHVzaChuZXcgYW00Y2hhcnRzLlZhbHVlQXhpcygpKTtcbiAgICBuZXdWYWx1ZUF4aXMucmVuZGVyZXIub3Bwb3NpdGUgPSB0cnVlO1xuICAgIG5ld1ZhbHVlQXhpcy5yZW5kZXJlci5ncmlkLnRlbXBsYXRlLmRpc2FibGVkID0gdHJ1ZTtcbiAgICBuZXdWYWx1ZUF4aXMucmVuZGVyZXIubWluV2lkdGggPSA1MDtcbiAgICBuZXdWYWx1ZUF4aXMuc3RyaWN0TWluTWF4ID0gdHJ1ZTtcbiAgICBuZXdWYWx1ZUF4aXMubnVtYmVyRm9ybWF0dGVyID0gbmV3IGFtNGNvcmUuTnVtYmVyRm9ybWF0dGVyKCk7XG4gICAgbmV3VmFsdWVBeGlzLm51bWJlckZvcm1hdHRlci5udW1iZXJGb3JtYXQgPSBcIiMnJSdcIlxuICAgIG5ld1ZhbHVlQXhpcy5jdXJzb3JUb29sdGlwRW5hYmxlZCA9IGZhbHNlO1xuICAgIFxuICAgIGNoYXJ0LnNlcmllcy52YWx1ZXNbM10ueUF4aXMgPSBuZXdWYWx1ZUF4aXM7XG4gICAgXG4gICAgdmFyIGNhdGVnb3J5QXhpcyA9IGNoYXJ0LnhBeGVzLnZhbHVlc1swXTtcbiAgICBjYXRlZ29yeUF4aXMudG9vbHRpcC5kaXNhYmxlZCA9IHRydWU7XG59In0=" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="58"  />
        <wes:Tile runat="server" ID="VALORCOMPRA" Title="Valor compra" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="2" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADOR_SUPRIMENTOS_SAVING_TOTAL_COMPRA.DATASOURCE.GRID" CompanyFilterMode="None" ValueFormat="N" Value="VALOROC" Description="Valor compra" Icon="icon-handbag" Color="yellow-gold" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="59"  />
        <wes:Tile runat="server" ID="VALORSAVING" Title="Valor Saving" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="2" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADOR_SUPRIMENTOS_SAVING_VALOR_TOTAL.DATASOURCE.GRID" CompanyFilterMode="None" ValueFormat="N" Value="VALORSAVING" Description="Valor saving" Icon="glyphicon glyphicon-saved" Color="grey-cascade" ValueAggregation="Sum" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="65"  />
        <wes:Tile runat="server" ID="PERCENTUALSAVING" Title="Percentual saving" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="2" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="INDICADOR_SUPRIMENTOS_SAVING_PERCENTUAL_TOTAL.DATASOURCE.GRID" CompanyFilterMode="None" Status="PERCENTUALSAVING" TotalValue="TOTAL" Value="PERCENTUALSAVING" Description="% Saving" Icon="glyphicon glyphicon-saved" Color="green-jungle" ValueAggregation="None" TileType="Flat" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="66"  />
        <wes:ActionView runat="server" ID="LEADTIMEMDIOPROCESSODECOMPRAS" Title="Lead time médio processo de compras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosLeadtimeCompras" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="68"  />
        <wes:ActionView runat="server" ID="TOP10PRODUTOSVALORCOMPRAS" Title="Top 10 Produtos - valor compras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosTop10Produtos" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="69"  />
        <wes:ActionView runat="server" ID="TOP10COMPRADORESVALORCOMPRAS" Title="Top 10 compradores - valor compras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosTop10Compradores" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="71"  />
        <wes:ActionView runat="server" ID="TOP10FAMILIA" Title="Top 10 Familia - valor compras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosTop10Familia" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="80"  />
        <wes:ActionView runat="server" ID="TOP10FORNECEDORES" Title="Top 10 Fornecedores - valor compras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" Controller="AmChartCorp" Action="SuprimentosTop10Fornecedores" PageId="AGA_A_SUPRIMENTOS_INDICADORES_SUPRIMENTOSINDICADORES" Level="20" Order="81"  />
        </div>
    
        <style>
              .amcharts-graph-serie-Cadastradas .amcharts-graph-column-front:hover {
   fill: rgb(82,94,100) !important;
   stroke: rgb(82,94,100) !important;
}

.amcharts-graph-serie-AAprovar .amcharts-graph-column-front:hover {
   fill: rgb(244,208,63) !important;
   stroke: rgb(244,208,63) !important;
}

.amcharts-graph-serie-Aprovadas .amcharts-graph-column-front:hover {
   fill: rgb(232,126,4) !important;
   stroke: rgb(232,126,4) !important;
}

.amcharts-graph-serie-RecebimentoParcial .amcharts-graph-column-front:hover {
   fill: rgb(76,135,185) !important;
   stroke: rgb(76,135,185) !important;
}

.amcharts-graph-serie-Recebidas .amcharts-graph-column-front:hover {
   fill: rgb(38,194,129) !important;
   stroke: rgb(38,194,129) !important;
}

              </style>
      </asp:Content>
    