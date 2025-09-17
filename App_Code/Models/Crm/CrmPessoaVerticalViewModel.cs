using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Controllers.Models.Crm
{
    /// <summary>
    /// Descrição resumida de CrmPessoaVerticalViewModel
    /// </summary>
    public class CrmPessoaVerticalViewModel
    {
        public CrmPessoaVerticalViewModel()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

        public string CNPJ { get; set; }
        public string RazaoSocial { get; set; }
        public string Vertical { get; set; }
    }
}