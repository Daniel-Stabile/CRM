using Models.Generico;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceOportunidade
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceOportunidade
    {
        public string Handle        { get; set; }
        public Usuario Responsavel   { get; set; }
        public string ValorTotal    { get; set; }
        public string ValorLu       { get; set; }
        public string ValorLum      { get; set; }
        public string ValorEscopo   { get; set; }
        public List<CrmPerformanceOportunidadeVertical> listaVerticais = new List<CrmPerformanceOportunidadeVertical>();

        public CrmPerformanceOportunidade()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}