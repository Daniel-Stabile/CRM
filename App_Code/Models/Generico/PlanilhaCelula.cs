using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de PlanilhaCelula
/// </summary>
namespace Models.Generico
{
    public class PlanilhaCelula
    {
        public int Coluna { get; set; }
        public string Valor { get; set; }

        public PlanilhaCelula()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}