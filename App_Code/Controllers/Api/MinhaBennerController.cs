using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components.WebApp.Controllers;
using Controllers.Models.Crm;
using Models.Crm;
using Nest;
using RazorEngine;
using SM.Crm.Definicoes.Comum.MinhaBenner;
using SM.Crm.Definicoes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Policy;
using System.Web;
using System.Web.Http;

namespace Controllers.Api
{
    /// <summary>
    /// Descrição resumida de MinhaBennerController
    /// </summary>
    [RoutePrefix("api/crm/minhabenner")]
    public class MinhaBennerController : EslController
    {
        [HttpGet, Route("listaTarefas")]
        public IHttpActionResult GetTarefas(int? page = 1, int? pageSize = 25, string usuarioSolicitacao = null, string status = null)
        {
            Uri requestUri = ActionContext.Request.RequestUri;
            string hostWithoutPort = requestUri.GetComponents(UriComponents.SchemeAndServer, UriFormat.UriEscaped);
            string url = hostWithoutPort + requestUri.PathAndQuery;

            var crit = new Criteria("A.TAREFA IN (SELECT HANDLE FROM K_CRM_TAREFAS WHERE NOME = 'Contato realizado Minha Benner')", CompanyFilterMode.None);

            var tarefasUsuarios = CrmTarefaUsuario.GetMany(crit).OrderByDescending(x => x.Handle).AsEnumerable();

            if (!string.IsNullOrEmpty(usuarioSolicitacao))
            {
                tarefasUsuarios = tarefasUsuarios.Where(x => x.UsuarioSolicitacaoMinhaBenner != null && x.UsuarioSolicitacaoMinhaBenner.Contains(usuarioSolicitacao));
            }

            if (!string.IsNullOrEmpty(status))
            {
                tarefasUsuarios = tarefasUsuarios.Where(x => x.Status.Description.Equals(status, StringComparison.OrdinalIgnoreCase));
            }

            var response = new List<CrmTarefaUsuarioViewModel>();
            if(tarefasUsuarios.Count() > 0)
            {
                foreach (var tarefasUsuario in tarefasUsuarios)
                {
                    var registro = new CrmTarefaUsuarioViewModel()
                    {
                        Status = tarefasUsuario.Status.Description,
                        UsuarioSolicitacao = tarefasUsuario.UsuarioSolicitacaoMinhaBenner ?? "",
                        DataInclusao = tarefasUsuario.DataInclusao.Value.ToString("dd/MM/yyyy"),
                        DataConclusao = tarefasUsuario.DataConclusao != null ? tarefasUsuario.DataConclusao.Value.ToString("dd/MM/yyyy") : "",
                        DetalhesSolicitacao = tarefasUsuario.ResumoAtividade,
                        RetornoTarefa = tarefasUsuario.Descricao ?? "",
                        ResponsavelTarefa = tarefasUsuario.Responsavel.Instance.Nome,
                        Empresa = tarefasUsuario.EmpresaInstance.Nome,
                        Cnpj = tarefasUsuario.EmpresaInstance.CNPJ,
                        Vertical = tarefasUsuario.VerticalInstance.Nome
                    };

                    response.Add(registro);
                }
            
            }

            return Ok(response.AsEnumerable(), url, page, pageSize);
        }

        [HttpGet, Route("listaSemaforos")]
        public IHttpActionResult GetSemaforos(int? page = 1, int? pageSize = 25, string cnpj = null, string status = null)
        {
            Uri requestUri = ActionContext.Request.RequestUri;
            string hostWithoutPort = requestUri.GetComponents(UriComponents.SchemeAndServer, UriFormat.UriEscaped);
            string url = hostWithoutPort + requestUri.PathAndQuery;

            var semaforos = CrmPessoaSemaforo.GetAll().OrderByDescending(x => x.Handle).AsEnumerable();

            if (!string.IsNullOrEmpty(cnpj))
            {
                semaforos = semaforos.Where(x => x.Pessoa.Instance.CNPJ.Contains(cnpj));
            }

            if (!string.IsNullOrEmpty(status))
            {
                semaforos = semaforos.Where(x => x.Status.Description.Equals(status, StringComparison.OrdinalIgnoreCase));
            }

            var response = new List<CrmPessoaSemaforoViewModel>();
            foreach ( var semaforo in semaforos)
            {
                string desfecho = semaforo.Desfecho == null ? "" : semaforo.Desfecho;
                string motivoDesfecho = semaforo.MotivoDesfecho.Instance == null ? "" : semaforo.MotivoDesfecho.Instance.Nome;
                var registro = new CrmPessoaSemaforoViewModel()
                {
                    Codigo = semaforo.Codigo.ToString(),
                    Desfecho = desfecho,
                    MotivoDesfecho = motivoDesfecho,
                    Empresa = semaforo.Pessoa.Instance.Nome,
                    CNPJ = semaforo.Pessoa.Instance.CNPJ,
                    UsuarioInclusao = semaforo.UsuarioInclusao.Instance.Apelido,
                    UsuarioSolicitacao = semaforo.UsuarioSolicitacaoMinhaBenner,
                    DataInclusao = semaforo.DataInclusao == null ? null : semaforo.DataInclusao.Value.ToString("dd/MM/yyyy"),
                    DataFatoGerador = semaforo.DataFatoGerador == null ? null : semaforo.DataFatoGerador.Value.ToString("dd/MM/yyyy"),
                    DataEncerramento = semaforo.DataEncerramento == null ? null : semaforo.DataEncerramento.Value.ToString("dd/MM/yyyy"),
                    Prazo = semaforo.Prazo == null ? null : semaforo.Prazo.Value.ToString("dd/MM/yyyy"),
                    ResponsavelSemaforo = semaforo.ResponsavelSemaforo == null ? null : semaforo.ResponsavelSemaforo.Instance.Apelido,
                    Status = semaforo.Status.Description,
                    Resumo = semaforo.Resumo
                };

                foreach (var vertical in semaforo.VerticalProdutoHandles)
                    registro.Verticais += SM.Crm.Definicoes.Entidades.CrmVertical.Get(vertical).Nome + "; ";

                response.Add(registro);
            }

            return Ok(response.AsEnumerable(), url, page, pageSize);
        }

        [HttpGet, Route("listaVerticais")]
        public IHttpActionResult GetVerticais(string cnpj)
        {
            Uri requestUri = ActionContext.Request.RequestUri;
            string hostWithoutPort = requestUri.GetComponents(UriComponents.SchemeAndServer, UriFormat.UriEscaped);
            string url = hostWithoutPort + requestUri.PathAndQuery;

            var criteria = new Criteria("A.SUBFASE IN (SELECT HANDLE FROM K_CRM_SUBFASES WHERE NOME = 'Cliente') AND A.PESSOA IN (SELECT HANDLE FROM K_CRM_PESSOAS WHERE CNPJ = :CNPJ)");
            criteria.Parameters.Add("CNPJ", cnpj);
            criteria.CompanyFilterMode = CompanyFilterMode.None;
            var verticais = CrmPessoaVertical.GetMany(criteria).OrderByDescending(x => x.Handle).AsEnumerable();

            var response = new List<CrmPessoaVerticalViewModel>();
            foreach (var conta in verticais)
            {
                var registro = new CrmPessoaVerticalViewModel()
                {
                    CNPJ = conta.Pessoa.Instance.CNPJ,
                    RazaoSocial = conta.Pessoa.Instance.Nome,
                    Vertical = conta.Vertical.Instance.Nome
                };

                response.Add(registro);
            }

            return Ok(response.AsEnumerable());
        }

        [HttpPost, Route("cadastrarTarefa")]
        public CriarTarefaMinhaBennerResponseModel CadastrarTarefa(CriarTarefaMinhaBennerRequestModel request)
        {
            var result = CallBusinessComponent("SM.Crm.Definicoes.Componentes.GerenciadorMinhaBenner, SM.Crm.Definicoes", "CriarTarefaMinhaBenner", request);
            return (CriarTarefaMinhaBennerResponseModel)result;
        }

        [HttpPost, Route("cadastrarSemaforo")]
        public IHttpActionResult CadastrarSemaforo(CriarSemaforoMinhaBennerRequestModel request)
        {
            var result = (CriarSemaforoMinhaBennerResponseModel)CallBusinessComponent("SM.Crm.Definicoes.Componentes.GerenciadorMinhaBenner, SM.Crm.Definicoes", "CriarSemaforoMinhaBenner", request);
            if (result.Solicitacao.Contains("Não foi possivel realizar sua solicitação."))
                return BadRequest(result.Solicitacao);

            return Ok(result.Solicitacao);
        }

        private IHttpActionResult Paginate<T>(IEnumerable<T> data, string url, int? page = 1, int? pageSize = 25) where T : class
        {
            var paginatedData = data.ResultadoSearch(url, page, pageSize);
            return Ok(paginatedData);
        }

        private IHttpActionResult Ok<T>(IEnumerable<T> value, string url, int? page = 1, int? pageSize = 25) where T : class
        {
            return Paginate(value, url, page, pageSize);
        }
    }
}
