using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Controllers.Models.Crm
{
    /// <summary>
    /// Descrição resumida de CrmPessoaSemaforoViewModel
    /// </summary>
    public class CrmPessoaSemaforoViewModel
    {
        public CrmPessoaSemaforoViewModel()
        {
            Codigo = string.Empty;
            Desfecho = string.Empty;
            MotivoDesfecho = string.Empty;
            Empresa = string.Empty;
            CNPJ = string.Empty;
            UsuarioInclusao = string.Empty;
            DataInclusao = string.Empty;
            DataFatoGerador = string.Empty;
            DataEncerramento = string.Empty;
            Prazo = string.Empty;
            ResponsavelSemaforo = string.Empty;
            Status = string.Empty;
            Resumo = string.Empty;
            Verticais = string.Empty;
            UsuarioSolicitacao = string.Empty;
        }

        public string UsuarioSolicitacao { get; set; }
        public string Codigo { get; set; }
        public string Desfecho { get; set; }
        public string MotivoDesfecho { get; set; }
        public string Empresa { get;set; }
        public string CNPJ { get;set; }
        public string UsuarioInclusao { get;set; }
        public string DataInclusao { get;set; }
        public string DataFatoGerador { get;set; }
        public string DataEncerramento { get;set; }
        public string Prazo { get;set; }
        public string ResponsavelSemaforo { get;set; }
        public string Status {  get;set; }
        public string Resumo { get;set; }
        public string Verticais { get;set; }
    }
}
