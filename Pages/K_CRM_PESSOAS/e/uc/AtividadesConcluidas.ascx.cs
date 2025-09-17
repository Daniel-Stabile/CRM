using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_K_CRM_PESSOAS_e_TimelineHistorico : UserControlBase<EntityBase>
{
    public EntityDefinition tarUsuario = null;
    public Entities<EntityBase> resultList = new Entities<EntityBase>();
    public List<Atividade> timelineList = new List<Atividade>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

    protected override void OnPreRender(EventArgs e)
    {
        //Busca a entidade selecionada no Widget Provedor
        EntityBase entidadeBase = GetProviderEntity();
        if (entidadeBase != null)
        {
            string handle = entidadeBase.Fields["HANDLE"].ToString();
            Handle responsavel = (entidadeBase.Fields["USUARIORESPONSAVEL"] as EntityAssociation).Handle;
            Query query = new Query();
            query.CommandText.AppendLine(" SELECT A.HANDLE,A.TIPO,A.RESPONSAVEL,B.NOME USUARIO,A.DATACONCLUSAO,A.DESCRICAO,D.ICONE,C.COR,A.TAREFA,C.NOME NOMETAREFA, E.EMAIL, A.STATUS ");
            query.CommandText.AppendLine(" FROM K_CRM_TAREFAUSUARIO A");
            query.CommandText.AppendLine(" JOIN Z_GRUPOUSUARIOS  B ON B.HANDLE  = A.RESPONSAVEL");
            query.CommandText.AppendLine(" JOIN K_CRM_TAREFAS    C ON C.HANDLE  = A.TAREFA");
            query.CommandText.AppendLine(" JOIN K_CRM_TIPOTAREFA D ON C.TIPO    = D.HANDLE");
            query.CommandText.AppendLine(" LEFT JOIN K_CRM_PESSOACONTATOEMAIL E ON A.PESSOAEMAIL    = E.HANDLE");
            query.CommandText.AppendLine(" WHERE A.PESSOA = :HANDLE AND A.VERTICAL IS NULL AND A.DATACONCLUSAO IS NOT NULL AND A.STATUS IN (2,3)");
            query.CommandText.AppendLine(" ORDER BY A.DATACONCLUSAO DESC");

            query.Parameters.Add("HANDLE", Convert.ToInt32(handle));

            Entities<EntityBase> resultSet = query.Execute();

            foreach (EntityBase result in resultSet)
            {
                Atividade item = new Atividade();

                if (result.Fields["DESCRICAO"] == null)
                {
                    result.Fields["DESCRICAO"] = "";
                    item.detalhes = result.Fields["DESCRICAO"].ToString();
                }
                else
                    item.detalhes = result.Fields["DESCRICAO"].ToString();

                item.cssClass = result.Fields["ICONE"].ToString();
                item.cssColor = "bg-"+ result.Fields["COR"].ToString();
                item.usuario = result.Fields["USUARIO"].ToString();

                if (result.Fields["EMAIL"] == null)
                {
                    result.Fields["EMAIL"] = "";
                    item.email = result.Fields["EMAIL"].ToString();
                }
                else
                    item.email = result.Fields["EMAIL"].ToString();

                item.dataConclusao = result.Fields["DATACONCLUSAO"].ToString();
                item.tarefa = result.Fields["TAREFA"].ToString();
                item.nomeTarefa = result.Fields["NOMETAREFA"].ToString() + (result.Fields["STATUS"].ToString() == "3"?"  ( Cancelado )":"");

                var roles = new Benner.Tecnologia.Common.Services.LocalAuthorizationService().GetUserRoles(BennerContext.Security.GetLoggedUserName());

                if (item.email != "")
                {
                    if((roles.Contains("K_CRM_GESTOR_COMERCIAL")) || responsavel == BennerContext.Security.GetLoggedUserHandle())
                        item.temEmail = "inline";
                    else
                        item.temEmail = "none";

                    var outPut = new FormLinkDefinition
                    {

                        TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                        TargetEntityDefinitionName = "K_CRM_EMAILS",
                        IsModalPage = true,
                        TargetFormMode = FormLinkDefinition.FormMode.View,
                        Url = "~/Pages/K_CRM_EMAILS/form.aspx",
                        WhereClause = new WhereClause("A.HANDLE = " + item.email)

                    };
                    item.emailLink = Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true);
                }
                else
                {
                    item.temEmail = "none";
                    item.emailLink = "#";
                }
                item.handle = result.Fields["HANDLE"].ToString();
                item.Resposta(result.Fields["RESPONSAVEL"].ToString());

                timelineList.Add(item);
            }
            
            timeline.DataSource = timelineList;
            timeline.DataBind();

        }
        base.OnPreRender(e);
    }
    public class Atividade
    {
        public string cssClass { get; set; }
        public string cssColor { get; set; }
        public string usuario { get; set; }
        public string dataConclusao { get; set; }
        public string detalhes { get; set; }
        public string tarefa { get; set; }
        public string nomeTarefa { get; set; }
        public string email { get; set; }
        public string emailLink { get; set; }
        public string temEmail { get; set; }
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
            this.dataConclusaoCss = "font-dark";
        }

        public void Resposta(string responsavel)
        {
            List<Benner.Tecnologia.Common.Parameter> parametros = new List<Benner.Tecnologia.Common.Parameter>()
            {
                new Benner.Tecnologia.Common.Parameter("HANDLE", handle),
            };

            var outPut = new FormLinkDefinition
            {
                TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                TargetEntityDefinitionName = "K_CRM_TAREFAUSUARIO",
                IsModalPage = true,
                TargetFormMode = FormLinkDefinition.FormMode.View,
                TargetEntityHandle = new Handle(handle),
                Url = "~/Pages/K_CRM_TAREFAUSUARIO/form.aspx",
                WhereClause = new WhereClause("A.HANDLE = :HANDLE                           "
                                          , parametros)
            };
            href = Benner.Tecnologia.Wes.Components.UriBuilder.Create(outPut, modal: true, absoluteUrl: true);
        }
    }
}