using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmTiposRecursos
/// </summary>
namespace Models.Crm
{
    public class CrmTiposRecursos
    {
        public long? Handle                     { get; set; }
        public string Recurso                   { get; set; }
        public string Servico                   { get; set; }
        public decimal ValorHora                { get; set; }
        public decimal ValorHoraOportunidade    { get; set; }

        public CrmTiposRecursos()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}
