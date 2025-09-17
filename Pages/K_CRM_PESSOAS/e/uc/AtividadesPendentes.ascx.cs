using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.Scripting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_K_CRM_PESSOAS_e_AtividadesPendentes : UserControlBase<EntityBase>
{
    public EntityDefinition tarUsuario = null;
    public Entities<EntityBase> resultList = new Entities<EntityBase>();
    public List<Atividade> timelineList = new List<Atividade>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //testeNovo.HRef = Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);
            
        }
    }

    protected override void OnPreRender(EventArgs e)
    {
        
        
        //Busca a entidade selecionada no Widget Provedor
        EntityBase entidadeBase = GetProviderEntity();
        if (entidadeBase != null)
        {
            //tarUsuario = EntityDefinition.GetByName("K_CRM_TAREFAUSUARIO");

            string handle = entidadeBase.Fields["HANDLE"].ToString();
            Query query = new Query();
            query.CommandText.AppendLine(" SELECT A.HANDLE,A.TIPO,A.RESPONSAVEL,B.NOME USUARIO,A.DATACONCLUSAO,A.DATAAGENDAMENTO,A.DESCRICAO,A.RESUMOATIVIDADE,A.TAREFA,C.NOME NOMETAREFA,D.ICONE");
            query.CommandText.AppendLine(" FROM K_CRM_TAREFAUSUARIO A");
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS  B ON B.HANDLE  = A.RESPONSAVEL");
            query.CommandText.AppendLine(" JOIN K_CRM_TAREFAS    C ON C.HANDLE  = A.TAREFA");
            query.CommandText.AppendLine(" JOIN K_CRM_TIPOTAREFA D ON C.TIPO    = D.HANDLE");
            query.CommandText.AppendLine(" WHERE A.PESSOA = :HANDLE AND A.VERTICAL IS NULL AND A.STATUS = 1");
            query.CommandText.AppendLine(" ORDER BY A.DATAAGENDAMENTO ASC");

            query.Parameters.Add("HANDLE", Convert.ToInt32(handle));

            Entities<EntityBase> resultSet = query.Execute();

            foreach (EntityBase result in resultSet)
            {
                Atividade item = new Atividade();

                if (result.Fields["DESCRICAO"] == null)
                {
                    item.detalhes = "";
                }
                else
                    item.detalhes = result.Fields["DESCRICAO"].ToString();

                if (result.Fields["RESUMOATIVIDADE"] != null)
                    item.detalhes = result.Fields["RESUMOATIVIDADE"].ToString();

                if (result.Fields["DATACONCLUSAO"] == null)
                {
                    item.dataConclusao = "";
                }
                else
                {
                    item.dataConclusao = result.Fields["DATACONCLUSAO"].ToString();
                    item.dataConclusaoCss = "font-grey";
                }

                if (result.Fields["DATAAGENDAMENTO"] != null)
                {
                    item.dataConclusao = result.Fields["DATAAGENDAMENTO"].ToString();
                    item.dataConclusaoCss = "font-red";
                }

                switch (result.Fields["TIPO"].ToString())
                {
                    case "1":
                        item.cssClass = result.Fields["ICONE"].ToString();
                        item.cssColor = "bg-blue-steel";
                        break;
                    case "2":
                        item.cssClass = result.Fields["ICONE"].ToString();
                        item.cssColor = "bg-red";
                        break;
                    case "3":
                        item.cssClass = result.Fields["ICONE"].ToString();
                        item.cssColor = "bg-green-jungle";
                        break;
                }

                item.usuario                = result.Fields["USUARIO"].ToString();
                item.tarefa                 = result.Fields["TAREFA"].ToString();
                item.nomeTarefa             = result.Fields["NOMETAREFA"].ToString();
                item.handle                 = result.Fields["HANDLE"].ToString();
                item.Resposta(result.Fields["RESPONSAVEL"].ToString());
                timelineList.Add(item);

            }

            timeline.DataSource = timelineList;
            timeline.DataBind();

            //======FORM LINK
            var outPut = new FormLinkDefinition
            {
                
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_TAREFAUSUARIO",
                IsModalPage = false,
                TargetFormMode = FormLinkDefinition.FormMode.Insert,
                Url = "~/Pages/K_CRM_TAREFAUSUARIO/form.aspx",
                WhereClause = new WhereClause("A.PESSOA = " + handle + " AND A.USUARIO = " + BennerIdentity.Current.UserHandle) 
                               
            };
            
            //novaTarefa.HRef = Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);
            
        }

        base.OnPreRender(e);
    }

    public class Atividade
    {
        public string cssClass { get; set; }
        public string cssColor { get; set; }
        public string usuario { get; set; }
        public string dataConclusao { get; set; }
        public string dataAgendamento { get; set; }
        public string detalhes { get; set; }
        public string tarefa { get; set; }
        public string nomeTarefa { get; set; }
        public string handle { get; set; }
        public string codigo { get; set; }
        public string href { get; set; }

        public string dataConclusaoCss { get; set; }
        public Atividade()
        {
            this.cssClass = "";
            this.usuario = "";
            this.dataConclusao = "";
            this.detalhes = "";
            this.tarefa = "";
            this.nomeTarefa = "";
            this.handle = "";
            this.dataConclusaoCss = "";
        }
        public void Resposta(string responsavel)
        {
            List<Benner.Tecnologia.Common.Parameter> parametros = new List<Benner.Tecnologia.Common.Parameter>()
            {
                new Benner.Tecnologia.Common.Parameter("HANDLE", handle),
                //new Benner.Tecnologia.Common.Parameter("TAREFA", tarefa),
                //new Benner.Tecnologia.Common.Parameter("DATACONCLUSAO", DateTime.Now),
                //new Benner.Tecnologia.Common.Parameter("USUARIOCONCLUSAO", BennerIdentity.Current.UserHandle)
            };

            //if(responsavel == BennerIdentity.Current.UserHandle.ToString())
            //{
                
                var outPut = new FormLinkDefinition
                {
                    TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                    TargetEntityDefinitionName = "K_CRM_TAREFAUSUARIO",
                    IsModalPage = false,
                    TargetFormMode = FormLinkDefinition.FormMode.View,
                    TargetEntityHandle = new Handle(handle),
                    Url = "~/Pages/K_CRM_TAREFAUSUARIO/form.aspx",
                    WhereClause = new WhereClause("A.HANDLE = :HANDLE                           "
                                              //" AND A.TAREFA = :TAREFA                      " +
                                              //" AND A.DATACONCLUSAO = :DATACONCLUSAO        " +
                                              //" AND A.USUARIOCONCLUSAO = :USUARIOCONCLUSAO    "
                                              , parametros)
                };
                href = Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: false, absoluteUrl: true);
                
            //}
            //else
            //{
            //    var outPut = new UrlLinkDefinition
            //    {
            //        IsModalPage = true,
            //        Url = "../../AccessDenied.aspx"
            //    };
            //    href = Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true);
            //}
            
        }
    }
}