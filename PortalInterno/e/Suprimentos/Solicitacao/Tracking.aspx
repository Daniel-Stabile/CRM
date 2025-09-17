<%@ Page Title="Catalogo" Language="C#" Inherits="PortalInterno.Suprimentos.Solicitacoes.Tracking, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <script runat="server">
        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            var entidade = ITEM.GetEntity();
            var status = entidade["STATUS"].GetInt32();
            var liberada = entidade.Fields["LIBERADA"].ToString().Equals("True");//solicitacao.Liberada.Value;



            if(status != 5)
            {
                img1.Src = "~/Content/img/LapisCor.png";
                TarjaCancelado.Visible = false;
            }
            else
            {
                img1.Src = "~/Content/img/LapisPB.png";
                TarjaCancelado.Visible = true;
            }


            if(liberada && status != 5)
            {
                img2.Src = "~/Content/img/setaDireitaPreta.png";
                img3.Src = "~/Content/img/DedoCor.png";
                label1.InnerText = "Solicitação efetuada";
            }
            else
            {
                img2.Src = "~/Content/img/setaDireitaCinza.png";
                img3.Src = "~/Content/img/DedoPB.png";
            }

            if(status >= 2 && status != 5)
            {
                img4.Src = "~/Content/img/setaDireitaPreta.png";
                img5.Src = "~/Content/img/atendendoCor.png";
                label2.InnerText = "Aprovada";
            }
            else
            {
                img4.Src = "~/Content/img/setaDireitaCinza.png";
                img5.Src = "~/Content/img/atendendoPB.png";
            }

            if((status == 4 || status == 6) && status != 5)
            {
                img6.Src = "~/Content/img/setaDireitaPreta.png";
                img7.Src = "~/Content/img/finalizadoCor.png";
                label3.InnerText = "Atendida";
            }
            else
            {
                img6.Src = "~/Content/img/setaDireitaCinza.png";
                img7.Src = "~/Content/img/finalizadoPB.png";
            }



        }

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ITEM->ITENS", "ITEM", "ITENS");
        }

    </script>

    <style>
        #WidgetEscondid {
            display: none;
        }            
        
        #Imagens {
            margin: auto;
            display: table;
        }

        #td1, #td2, #td4, #td5, #td7, #td8, #td10, #td11 {
            margin: auto;
            display: table;
            font-size: 13px;
        }

        #td6, #td9, #td3 {
            padding-bottom: 15px;
        }

        #Tarja {
            background-color: #FF6161;
            color: white;
            margin: auto;
            display: table;
            width: 100%
               
        }
   
    </style>
    


        <div class="portlet light">

            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" Title="Tracking de atendimento" ID="Titulo" />
            </div>


              <div class="row">
                    <div class="row" id="LinhaImagens" runat="server">
                      <div class="col-md-12" id="caixa" runat="server" >
                        <div class="portlet light" id="form_wizard_1">
                            <div id="Imagens">
                                <div style="text-align: center">
                                    <table>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td1">
						                                    <img id="img1" src="" width="80" draggable="false" runat="server"/>  
					                                    </td>
				                                    </tr>
				                                    <tr>
					                                    <td id="td2">
						                                    <label id="label1" runat="server">Solicitação efetuada</label>
					                                    </td>
				                                    </tr>
			                                    </table>
		                                    </th>
	                                    </td>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td3">
						                                    <img id="img2" src="" width="50" draggable="false" runat="server"/>   
					                                    </td>
				                                    </tr>
			                                    </table>	
		                                    </th>
	                                    </td>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td4">
						                                    <img id="img3" src="" width="80" draggable="false" runat="server"/>
					                                    </td>
				                                    </tr>
				                                    <tr>
					                                    <td id="td5">
						                                    <label id="label2" runat="server">Aguard. aprovação</label>
					                                    </td>
				                                    </tr>
			                                    </table>	
		                                    </th>
	                                    </td>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td6">
						                                    <img id="img4" src="" width="50" draggable="false" runat="server"/>  
					                                    </td>
				                                    </tr>
			                                    </table>	
		                                    </th>
	                                    </td>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td7">
						                                    <img id="img5" src="" width="80" draggable="false" runat="server"/> 
					                                    </td>
				                                    </tr>
				                                    <tr>
					                                    <td id="tr8">
						                                    <label id="label3" runat="server">Em atendimento</label>
					                                    </td>
				                                    </tr>
			                                    </table>
		                                    </th>
	                                    </td>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td9">
						                                    <img id="img6" src="" width="50" draggable="false" runat="server"/>  
					                                    </td>
				                                    </tr>
			                                    </table>
		                                    </th>
	                                    </td>
	                                    <td>
		                                    <th>
			                                    <table>
				                                    <tr>
					                                    <td id="td10">
						                                    <img id="img7" src="" width="80" draggable="false" runat="server"/> 
					                                    </td>
				                                    </tr>
				                                    <tr>
					                                    <td id="td11">
						                                    <label id="label4" runat="server">Recebido/Finalizado</label>
					                                    </td>
				                                    </tr>
			                                    </table>
		                                    </th>
	                                    </td>
                                    </table>  
                                </div>
                            </div>
                            <div id="TarjaCancelado" runat="server">
                                <div style="text-align: center">
                                    <label id="Tarja">Item cancelado</label>
                                </div>
                            </div>                          
                        </div>
                      </div>
                    </div>
              </div>


            <div class="row">
                <wesWidget:AjaxForm
                    ID="ITEM"
                    runat="server"
                    EntityViewName="PORTAL_INT_ITEM_SOLICITACAO.FORM"
                    DisplayLabels="True"
                    ShowTitle="false"
                    CanDelete="false"
                    CanUpdate="false"
                    Title=""
                    CanInsert="false"
                    HideDeveloperCommands="true"
                    FormMode="ReadOnly"
                    EditButtonClass="green" />
            </div>

            <div class="row">
                <wesWidget:SimpleGrid
                    runat="server"
                    ID="ITENS"
                    BootstrapCols="12"
                    UserDefinedDisableRowSelection="True"
                    FormUrl=""
                    Title="Histórico"
                    UserDefinedCriteriaWhereClause="A.SOLICITACAOITEM = @CAMPO(HANDLE)"
                    UserDefinedDataSourceParameters=""
                    DisplayRowCommand="True"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="10"
                    Mode="None"
                    FilterVisible="False"
                    UserDefinedSelectColumnVisible="False"
                    DefaultFilterName=""
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="True"
                    ChromeState="Normal"
                    EntityViewName="PORTAL_INT_HISTORICO_ITEM_SOLICITACAO.GRID"
                    PageWidgetHandle="108" />
            </div>        
        </div>
</asp:Content>
