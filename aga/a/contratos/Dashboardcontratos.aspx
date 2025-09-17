<%@ Page Title="Dashboard contratos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:Tile runat="server" ID="APROVARCOMPRAS" Title="aprovar compras" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOS_T.DATASOURCE.GRID" CompanyFilterMode="OnlyCompany" CriteriaWhereClause="(
           (
               STATUS = 1
               AND LIBERADO = 'S'
           )
           AND
           (
               (
                   GRUPODEASSINATURAS IN(SELECT C.HANDLE
                                             FROM CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                            WHERE B.GRUPO = C.HANDLE
                                                  AND
                                                  (
                                                      (
                                                          C.EHHIERARQUIA = 'S'
                                                          AND B.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                      )
                                                      OR
                                                      (
                                                          C.EHHIERARQUIA &lt;&gt; 'S'
                                                          AND B.SEQUENCIA = SEQUENCIAALCADA
                                                      )
                                                  )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S'
                                          )
               )
               OR
               (
                   GRUPODEASSINATURAS IN (SELECT D.GRUPO
                                              FROM CP_GRUPOALCADASUSUARIOS D,
                                                   CP_GRUPOALCADASINTEGRANTES I,
                                                   CP_GRUPOALCADAS G
                                             WHERE D.GRUPO = G.HANDLE
                                                   AND I.GRUPO = G.HANDLE
                                                   AND I.HANDLE = D.INTEGRANTE
                                                   AND
                                                   (
                                                       (
                                                           G.EHHIERARQUIA = 'S'
                                                           AND I.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                       )
                                                       OR
                                                       (
                                                           G.EHHIERARQUIA = 'N'
                                                           AND I.SEQUENCIA = SEQUENCIAALCADA
                                                       )
                                                   )
                                                   AND D.USUARIOAUTORIZADO = @USUARIO
                                                   AND I.USUARIO = D.USUARIO
                                                   AND D.ATIVO = 'S'
                                                   AND I.ATIVO = 'S'
                                                   AND I.AUSENTE = 'S'
                                           )
               )
           )
       )
       AND
       (
           TIPOCONTRATO IN(SELECT X.HANDLE
                               FROM CN_TIPOSCONTRATOS X
                              WHERE X.HANDLE = TIPOCONTRATO
                                    AND X.TIPO = 1
                                    AND X.EHCONTRATOCONVENIO = 'N'
                            )
       )


" CommandName="CMD_REDIRECIONAR_GRID_CONTRATOS_COMPRA" Value="QTD" Description="Contratos de compra para aprovar" Icon="fa fa-file-text-o" Color="blue" ValueAggregation="None" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="1"  />
        <wes:Tile runat="server" ID="APROVARFATURAMENTO" Title="aprovar faturamento" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOS_T.DATASOURCE.GRID" CompanyFilterMode="OnlyCompany" CriteriaWhereClause="
       (
           (
               STATUS = 1
               AND LIBERADO = 'S'
           )
           AND
           (
               (
                   GRUPODEASSINATURAS IN(SELECT C.HANDLE
                                             FROM CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                            WHERE B.GRUPO = C.HANDLE
                                                  AND
                                                  (
                                                      (
                                                          C.EHHIERARQUIA = 'S'
                                                          AND B.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                      )
                                                      OR
                                                      (
                                                          C.EHHIERARQUIA &lt;&gt; 'S'
                                                          AND B.SEQUENCIA = SEQUENCIAALCADA
                                                      )
                                                  )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S'
                                          )
               )
               OR
               (
                   GRUPODEASSINATURAS IN (SELECT D.GRUPO
                                              FROM CP_GRUPOALCADASUSUARIOS D,
                                                   CP_GRUPOALCADASINTEGRANTES I,
                                                   CP_GRUPOALCADAS G
                                             WHERE D.GRUPO = G.HANDLE
                                                   AND I.GRUPO = G.HANDLE
                                                   AND I.HANDLE = D.INTEGRANTE
                                                   AND
                                                   (
                                                       (
                                                           G.EHHIERARQUIA = 'S'
                                                           AND I.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                       )
                                                       OR
                                                       (
                                                           G.EHHIERARQUIA = 'N'
                                                           AND I.SEQUENCIA = SEQUENCIAALCADA
                                                       )
                                                   )
                                                   AND D.USUARIOAUTORIZADO = @USUARIO
                                                   AND I.USUARIO = D.USUARIO
                                                   AND D.ATIVO = 'S'
                                                   AND I.ATIVO = 'S'
                                                   AND I.AUSENTE = 'S'
                                           )
               )
           )
       )
       AND
       (
           TIPOCONTRATO IN(SELECT X.HANDLE
                               FROM CN_TIPOSCONTRATOS X
                              WHERE X.HANDLE = TIPOCONTRATO
                                    AND X.TIPO = 2
                                    AND X.EHCONTRATOCONVENIO = 'N'
                            )
       )
" CommandName="CMD_REDIRECIONAR_GRID_CONTRATOS_FATURAMENTO" Value="QTD" Description="Contratos de faturamento para aprovar" Icon="fa fa-file-text-o" Color="green" ValueAggregation="None" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="2"  />
        <wes:Tile runat="server" ID="APROVARCONVENIO" Title="aprovar convenio" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOS_T.DATASOURCE.GRID" CompanyFilterMode="OnlyCompany" CriteriaWhereClause="
       (
           (
               STATUS = 1
               AND LIBERADO = 'S'
           )
           AND
           (
               (
                   GRUPODEASSINATURAS IN(SELECT C.HANDLE
                                             FROM CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                            WHERE B.GRUPO = C.HANDLE
                                                  AND
                                                  (
                                                      (
                                                          C.EHHIERARQUIA = 'S'
                                                          AND B.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                      )
                                                      OR
                                                      (
                                                          C.EHHIERARQUIA &lt;&gt; 'S'
                                                          AND B.SEQUENCIA = SEQUENCIAALCADA
                                                      )
                                                  )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S'
                                          )
               )
               OR
               (
                   GRUPODEASSINATURAS IN (SELECT D.GRUPO
                                              FROM CP_GRUPOALCADASUSUARIOS D,
                                                   CP_GRUPOALCADASINTEGRANTES I,
                                                   CP_GRUPOALCADAS G
                                             WHERE D.GRUPO = G.HANDLE
                                                   AND I.GRUPO = G.HANDLE
                                                   AND I.HANDLE = D.INTEGRANTE
                                                   AND
                                                   (
                                                       (
                                                           G.EHHIERARQUIA = 'S'
                                                           AND I.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                       )
                                                       OR
                                                       (
                                                           G.EHHIERARQUIA = 'N'
                                                           AND I.SEQUENCIA = SEQUENCIAALCADA
                                                       )
                                                   )
                                                   AND D.USUARIOAUTORIZADO = @USUARIO
                                                   AND I.USUARIO = D.USUARIO
                                                   AND D.ATIVO = 'S'
                                                   AND I.ATIVO = 'S'
                                                   AND I.AUSENTE = 'S'
                                           )
               )
           )
       )
       AND
       (
           TIPOCONTRATO IN(SELECT X.HANDLE
                               FROM CN_TIPOSCONTRATOS X
                              WHERE X.HANDLE = TIPOCONTRATO
                                    AND X.TIPO = 3
                                    AND X.EHCONTRATOCONVENIO = 'S'
                            )
       )
" CommandName="CMD_REDIRECIONAR_GRID_CONTRATOS_CONVENIO" Value="QTD" Description="Contratos de convênio para aprovar " Icon="fa fa-file-text-o" Color="purple" ValueAggregation="None" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="3"  />
        <wes:Tile runat="server" ID="APROVARPERMUTAS" Title="aprovar permutas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOS_T.DATASOURCE.GRID" CompanyFilterMode="OnlyCompany" CriteriaWhereClause="
       (
           (
               STATUS = 1
               AND LIBERADO = 'S'
           )
           AND
           (
               (
                   GRUPODEASSINATURAS IN(SELECT C.HANDLE
                                             FROM CP_GRUPOALCADASINTEGRANTES B,
                                                  CP_GRUPOALCADAS C
                                            WHERE B.GRUPO = C.HANDLE
                                                  AND
                                                  (
                                                      (
                                                          C.EHHIERARQUIA = 'S'
                                                          AND B.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                      )
                                                      OR
                                                      (
                                                          C.EHHIERARQUIA &lt;&gt; 'S'
                                                          AND B.SEQUENCIA = SEQUENCIAALCADA
                                                      )
                                                  )
                                                  AND B.USUARIO = @USUARIO
                                                  AND B.ATIVO = 'S'
                                          )
               )
               OR
               (
                   GRUPODEASSINATURAS IN (SELECT D.GRUPO
                                              FROM CP_GRUPOALCADASUSUARIOS D,
                                                   CP_GRUPOALCADASINTEGRANTES I,
                                                   CP_GRUPOALCADAS G
                                             WHERE D.GRUPO = G.HANDLE
                                                   AND I.GRUPO = G.HANDLE
                                                   AND I.HANDLE = D.INTEGRANTE
                                                   AND
                                                   (
                                                       (
                                                           G.EHHIERARQUIA = 'S'
                                                           AND I.SEQUENCIA &gt;= SEQUENCIAALCADA
                                                       )
                                                       OR
                                                       (
                                                           G.EHHIERARQUIA = 'N'
                                                           AND I.SEQUENCIA = SEQUENCIAALCADA
                                                       )
                                                   )
                                                   AND D.USUARIOAUTORIZADO = @USUARIO
                                                   AND I.USUARIO = D.USUARIO
                                                   AND D.ATIVO = 'S'
                                                   AND I.ATIVO = 'S'
                                                   AND I.AUSENTE = 'S'
                                           )
               )
           )
       )
       AND
       (
           TIPOCONTRATO IN(SELECT X.HANDLE
                               FROM CN_TIPOSCONTRATOS X
                              WHERE X.HANDLE = TIPOCONTRATO
                                    AND X.TIPO = 4                                    
                            )
       )
" CommandName="CMD_REDIRECIONAR_GRID_CONTRATOS_PERMUTA" Value="QTD" Description="Contratos de permuta para aprovar" Icon="fa fa-file-text-o" Color="yellow" ValueAggregation="None" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="4"  />
        <wes:Tile runat="server" ID="ADITIVOSDECOMPRAPARAAPROVAR" Title="Aditivos de compra para aprovar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="QTDADITIVOCOMPRAAPROVAR.DATASOURCE.GRID" CompanyFilterMode="None" Value="QTDE" Description="Aditivos de compra para aprovar" Icon="fa fa-file-text-o" Color="blue" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="8"  />
        <wes:Tile runat="server" ID="ADITIVOSDEFATURAMENTOPARAAPROVAR" Title="Aditivos de faturamento para aprovar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="QTDADITIVOFATURAMENTOAPROVAR.DATASOURCE.GRID" CompanyFilterMode="None" Value="QTDE" Description="Aditivos de faturamento para aprovar" Icon="fa fa-file-text-o" Color="green" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="9"  />
        <wes:Tile runat="server" ID="ADITIVOSDECONVNIOPARAAPROVAR" Title="Aditivos de convênio para aprovar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="QTDADITIVOCONVENIOAPROVAR.DATASOURCE.GRID" CompanyFilterMode="None" Value="QTDE" Description="Aditivos de convênio para aprovar" Icon="fa fa-file-text-o" Color="purple" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="10"  />
        <wes:Tile runat="server" ID="ADITIVOSDEPERMUTAPARAAPROVAR" Title="Aditivos de permuta para aprovar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="QTDADITIVOPERMUTAAPROVAR.DATASOURCE.GRID" CompanyFilterMode="None" Value="QTDE" Description="Aditivos de permuta para aprovar" Icon="fa fa-file-text-o" Color="yellow" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="11"  />
        <wes:AmCharts runat="server" ID="CONTRATOSDECOMPRA" Title="Contratos de compra" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOSCOMPRAS_G.DATASOURCE.GRID" Mode="None" CompanyFilterMode="OnlyCompany" ChartType="Column" ChartHeight="400" ChartDefinition="eyJ0eXBlIjoic2VyaWFsIiwibGFuZ3VhZ2UiOiJwdCIsInRoZW1lIjoibGlnaHQiLCJleHBvcnQiOnsiZW5hYmxlZCI6dHJ1ZX0sImNhdGVnb3J5RmllbGQiOiJzdGF0dXMiLCJzdGFydER1cmF0aW9uIjoxLCJjYXRlZ29yeUF4aXMiOnsiZ3JpZFBvc2l0aW9uIjoic3RhcnQifSwiZ3JhcGhzIjpbeyJiYWxsb25UZXh0IjoiW1tjYXRlZ29yeV1dIDogW1t2YWx1ZV1dIiwiaWQiOiJzZXJpZS0xNDk4NzQzMTI2NzIxIiwidGl0bGUiOiJWYWxvciIsInZhbHVlRmllbGQiOiJ2YWxvciIsInR5cGUiOiJjb2x1bW4iLCJsaW5lQWxwaGEiOjEsImZpbGxBbHBoYXMiOjEsInVybEZpZWxkIjoidXJsIiwiYnVsbGV0IjpudWxsfSx7ImJhbGxvblRleHQiOiJbW2NhdGVnb3J5XV0gOiBbW3ZhbHVlXV0iLCJpZCI6InNlcmllLTE0OTg1ODQ1MDkxMDUiLCJ0aXRsZSI6IlF1YW50aWRhZGUiLCJ2YWx1ZUZpZWxkIjoicXRkIiwidHlwZSI6ImxpbmUiLCJsaW5lQWxwaGEiOjEsImZpbGxBbHBoYXMiOjAsImJ1bGxldCI6InJvdW5kIiwidmFsdWVBeGlzIjoiVmFsdWVBeGlzLTIiLCJ5RmllbGQiOiJxdGQifV0sInZhbHVlQXhlcyI6W3siaWQiOiJWYWx1ZUF4aXMtMSIsInRpdGxlIjoiVmFsb3IifSx7ImlkIjoiVmFsdWVBeGlzLTIiLCJwb3NpdGlvbiI6InJpZ2h0IiwiZ3JpZEFscGhhIjowLCJ0aXRsZSI6IlF1YW50aXRhZGUifV0sInRpdGxlcyI6W3siY29sb3IiOiIjMkFCNEMwIiwiaWQiOiJUaXRsZS0xIiwic2l6ZSI6MTUsInRleHQiOiJDT05UUkFUT1MgREUgQ09NUFJBIn1dLCJsZWdlbmQiOnsiZW5hYmxlZCI6dHJ1ZSwidXNlR3JhcGhTZXR0aW5ncyI6dHJ1ZX0sInJvdGF0ZSI6ZmFsc2V9" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="15"  />
        <wes:AmCharts runat="server" ID="CONTRATOSDEFATURAMENTO" Title="Contratos de faturamento" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOSFATURAMENTO_G.DATASOURCE.GRID" Mode="None" CompanyFilterMode="OnlyCompany" ChartType="Column" ChartHeight="400" ChartDefinition="eyJ0eXBlIjoic2VyaWFsIiwibGFuZ3VhZ2UiOiJwdCIsInRoZW1lIjoibGlnaHQiLCJleHBvcnQiOnsiZW5hYmxlZCI6dHJ1ZX0sImNhdGVnb3J5RmllbGQiOiJzdGF0dXMiLCJzdGFydER1cmF0aW9uIjoxLCJjYXRlZ29yeUF4aXMiOnsiZ3JpZFBvc2l0aW9uIjoic3RhcnQifSwiZ3JhcGhzIjpbeyJiYWxsb29uVGV4dCI6IltbY2F0ZWdvcnldXSA6IFtbdmFsdWVdXSIsImlkIjoiQW1HcmFwaC0xIiwidGl0bGUiOiJWYWxvciIsInZhbHVlRmllbGQiOiJ2YWxvciIsImZpbGxBbHBoYXMiOjEsInVybEZpZWxkIjoidXJsIiwidHlwZSI6ImNvbHVtbiJ9LHsiYmFsbG9uVGV4dCI6IltbY2F0ZWdvcnldXSA6IFtbdmFsdWVdXSIsImlkIjoic2VyaWUtMTQ5ODU5NDk0MzAyNyIsInRpdGxlIjoiUXVhbnRpZGFkZSIsInZhbHVlRmllbGQiOiJxdGQiLCJ0eXBlIjoibGluZSIsImxpbmVBbHBoYSI6MSwidmFsdWVBeGlzIjoiVmFsdWVBeGlzLTIiLCJmaWxsQWxwaGFzIjowLjN9XSwidmFsdWVBeGVzIjpbeyJpZCI6IlZhbHVlQXhpcy0xIiwidGl0bGUiOiJWYWxvciJ9LHsiaWQiOiJWYWx1ZUF4aXMtMiIsInBvc2l0aW9uIjoicmlnaHQiLCJncmlkQWxwaGEiOjAsInRpdGxlIjoiUXVhbnRpZGFkZSJ9XSwidGl0bGVzIjpbeyJjb2xvciI6IiMyQUI0QzAiLCJpZCI6IlRpdGxlLTEiLCJzaXplIjoxNSwidGV4dCI6IkNPTlRSQVRPUyBERSBGQVRVUkFNRU5UTyJ9XSwibGVnZW5kIjp7ImVuYWJsZWQiOnRydWUsInVzZUdyYXBoU2V0dGluZ3MiOnRydWV9LCJyb3RhdGUiOmZhbHNlfQ==" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="20"  />
        <wes:AmCharts runat="server" ID="CONTRATOSDECONVENIO" Title="Contratos de convênio" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CONSULTA_CONTRATOSCONV_G.DATASOURCE.GRID" Mode="None" CompanyFilterMode="OnlyCompany" ChartType="Column" ChartHeight="400" ChartDefinition="eyJ0eXBlIjoic2VyaWFsIiwibGFuZ3VhZ2UiOiJwdCIsInRoZW1lIjoibGlnaHQiLCJleHBvcnQiOnsiZW5hYmxlZCI6dHJ1ZX0sImNhdGVnb3J5RmllbGQiOiJzdGF0dXMiLCJzdGFydER1cmF0aW9uIjoxLCJjYXRlZ29yeUF4aXMiOnsiZ3JpZFBvc2l0aW9uIjoic3RhcnQifSwiZ3JhcGhzIjpbeyJiYWxsb29uVGV4dCI6IltbY2F0ZWdvcnldXSA6IFtbdmFsdWVdXSIsImlkIjoiQW1HcmFwaC0xIiwidGl0bGUiOiJWYWxvciIsInZhbHVlRmllbGQiOiJ2YWxvciIsImZpbGxBbHBoYXMiOjEsInVybEZpZWxkIjoidXJsIiwidHlwZSI6ImNvbHVtbiJ9LHsiYmFsbG9uVGV4dCI6IltbY2F0ZWdvcnldXSA6IFtbdmFsdWVdXSIsImlkIjoic2VyaWUtMTQ5ODY1NDU1MzI5MyIsInRpdGxlIjoiUXVhbnRpZGFkZSIsInZhbHVlRmllbGQiOiJxdGQiLCJ0eXBlIjoibGluZSIsImxpbmVBbHBoYSI6MSwiZmlsbEFscGhhcyI6MCwidmFsdWVBeGlzIjoiVmFsdWVBeGlzLTIiLCJidWxsZXQiOiJyb3VuZCJ9XSwidmFsdWVBeGVzIjpbeyJpZCI6IlZhbHVlQXhpcy0xIiwidGl0bGUiOiJWYWxvciJ9LHsiaWQiOiJWYWx1ZUF4aXMtMiIsInBvc2l0aW9uIjoicmlnaHQiLCJncmlkQWxwaGEiOjAsInRpdGxlIjoiUXVhbnRpZGFkZSJ9XSwidGl0bGVzIjpbeyJjb2xvciI6IiMyQUI0QzAiLCJpZCI6IlRpdGxlLTEiLCJzaXplIjoxNSwidGV4dCI6IkNPTlRSQVRPUyBERSBDT05Ww4pOSU8gIn1dLCJsZWdlbmQiOnsiZW5hYmxlZCI6dHJ1ZSwidXNlR3JhcGhTZXR0aW5ncyI6dHJ1ZX0sInJvdGF0ZSI6ZmFsc2V9" PageId="AGA_A_CONTRATOS_PAINELCONTRATOS" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    