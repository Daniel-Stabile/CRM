using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmProdutoUsuario
/// </summary>
namespace Models.Crm
{
    public class CrmProdutoUsuario
    {
        public long? Handle { get; set; }
        public string Nome { get; set; }
        public decimal PorcentagemValor { get; set; }
        public int Quantidade { get; set; }

        public CrmProdutoUsuario()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
            Quantidade = 1;
        }
    }

}