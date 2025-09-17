<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AtividadesPendentes.ascx.cs" Inherits="Pages_K_CRM_PESSOAS_e_AtividadesPendentes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<script>
    $(document).ready(function () {
        $(".element_tarefa_pendente").hover(function () {
            $(this).css('background-color', '#e9edef');
        });
        $('.element_tarefa_pendente').mouseleave(function () {
            $(this).css('background-color', '#fafafa');
          })
    });
</script>
<div class="row">
	<div class="col-lg-12">
		<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption">
					<span class="caption-subject bold font-green-soft uppercase">Tarefas</span>
					<!--<span class="caption-helper"></span>-->
				</div>
				<div class="actions">
                    <%--<a id="teste" runat="server" class="btn blue pull-left">Novo</a>--%>
					<%--<!--<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="#" data-original-title="" title="Tela Cheia"></a>--%>
				</div>
			</div>
			<div class="portlet body form" id="portletTimeline">
                <div class="widget-body row">
				    <div class="col-md-12 ">
					    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; ">
						    <div class="scroller" style="max-height: 339px; overflow: auto; width: auto;" data-always-visible="1" data-rail-visible="0" data-initialized="1">
							    <asp:ListView ID="timeline" runat="server">
                                    <LayoutTemplate>
                                        <ul class="feeds">
                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"/>
                                        </ul>
                                    </LayoutTemplate>
                                        
                                    <ItemTemplate>
                                        <li class="element_tarefa_pendente">
                                            <a href="<%#Eval("href") %>" style="text-decoration:none">
                                                <div class="col1">
										            <div class="cont" style="width:80%;width:-moz-calc(100% - 75px);width: -webkit-calc(100% - 75px);width: -o-calc(100% - 75px);width:calc(100% - 75px);">
											            <div class="cont-col1">
												            <div class="label label-sm <%#Eval("cssColor") %>" data-toggle="tooltip" title="<%# Eval("tarefa")%>">
													            <i class="<%# Eval("cssClass")%>"></i>
												            </div>
											            </div>
											            <div class="cont-col2">
												            <div class="desc">
													            <label style="font-weight:bold;cursor:pointer"><%# Eval("nomeTarefa")%></label><br/>
													            <p style="font-size:12px"><%# Eval("detalhes")%></p>
													            <span class="pull-right badge bg-blue" style="font-size:10px"><%# Eval("usuario")%></span>
												            </div>
											            </div>
										            </div>
									            </div>
									            <div class="col2">
									               <div class="date <%# Eval("dataConclusaoCss")%>" style="font-size:12px;min-width:75px">
											            <%# Eval("dataConclusao")%>
									               </div>
									            </div>
                                            </a>
								        </li>
                                    </ItemTemplate>

                                    <EmptyDataTemplate>
                                        <table class="table table-hover simple-grid" cellspacing="0" border="0" style="border-collapse:collapse;">
								            <tbody>
									            <tr>
										            <td colspan="4">Sem dados para exibir.</td>
									            </tr>
								            </tbody>
							            </table>
                                    </EmptyDataTemplate>
							    </asp:ListView>
                                
						    </div>
                            <%--<div class="slimScrollBar" style="background: rgb(187, 187, 187); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 189.952px;"></div>--%>
					    </div>
				    </div>
                </div>
			</div>
		</div>
	</div>
</div>

<%--<div class="form-actions top nobg no-border commands-bar fluid list-commands-bar">
    <a href="javascript:__doPostBack('ctl00$Main$K_CONTATOS','New')" class="btn green btn-new command-action predef-action editable" title="Ctrl + Insert"><i class="fa fa-plus btn-action"></i> Novo</a>
</div> 
<div class="row">
	<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; ">
        <div class="scroller" style="max-height: 300px; overflow: auto; width: auto;" data-always-visible="1" data-rail-visible="0" data-initialized="1">
	        <% if (timeline.Count == 0) {%>
            <table class="table table-hover simple-grid" cellspacing="0" border="0" style="border-collapse:collapse;">
		        <tbody>
                    <tr>
			            <td colspan="4">Sem dados para exibir.</td>
		            </tr>
	            </tbody>
            </table>
            <%}else{%>
             <ul class="feeds">
			    <% foreach( Atividade result in timeline) {%>
	            <li>
	    	        <div class="col1">
	    		        <div class="cont" style="width:80%;width:-moz-calc(100% - 75px);width: -webkit-calc(100% - 75px);width: -o-calc(100% - 75px);width:calc(100% - 75px);">
	    			        <div class="cont-col1">
	    				        <div class="label label-sm <%= result.cssColor%>" data-toggle="tooltip" title="<%= result.tarefa%>">
	    					        <i class="<%= result.cssClass%>"></i>
	    					    </div>
	    				    </div>
	    				    <div class="cont-col2">
	    				        <div class="desc">
                                    <label style="font-weight:bold"><%= result.tarefa %></label><br/>
                                    <p style="font-size:12px"><%= result.detalhes %></p>
                                    <span class="pull-right font-blue" style="font-size:10px"><%= result.usuario %></span>
	    					    </div>
	    				    </div>
	    		        </div>
	    		    </div>
	    		    <div class="col2">
                        <%if (result.dataAgendamento == null)
                            {%>
	    			   <div class="date" style="font-size:12px;min-width:75px">
                            <%=  result.dataConclusao %>
	    			   </div>
                        <%}
                        else
                        { %>
	    			   <div class="date font-red" style="font-size:12px;min-width:75px">
                            <%=  result.dataAgendamento %>
	    			   </div>
                        <%} %>
	    		    </div>
	    	    </li>
                <% } }%>
		    </ul>
		</div>
    </div>
</div>--%>

