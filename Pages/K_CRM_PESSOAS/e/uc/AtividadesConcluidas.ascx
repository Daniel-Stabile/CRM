<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AtividadesConcluidas.ascx.cs" Inherits="Pages_K_CRM_PESSOAS_e_TimelineHistorico" %>
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
					<span class="caption-subject bold font-green-soft uppercase">Histórico</span>
				</div>
				<div class="actions">
				</div>
			</div>
			<div class="portlet body form" id="portletTimeline">
                <div class="widget-body row">
                    <div class="col-md-12 top nobg no-border fluid" style="padding:10px 15px;margin-bottom:10px">
                    </div>
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
					    </div>
				    </div>
                </div>
			</div>
		</div>
	</div>
</div>
