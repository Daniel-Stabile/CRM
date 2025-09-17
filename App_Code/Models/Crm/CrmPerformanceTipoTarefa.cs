using Models.Generico;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de CrmPerformanceTipoTarefa
/// </summary>
namespace Models.Crm
{
    public class CrmPerformanceTipoTarefa
    {
        public string Handle { get; set; }
        public string Tarefa { get; set; }
        public string Resposta { get; set; }
        public CrmVertical Vertical { get; set; }
        public Usuario Responsavel { get; set; }
        public string DataConclusao { get; set; }


        public CrmPerformanceTipoTarefa()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}