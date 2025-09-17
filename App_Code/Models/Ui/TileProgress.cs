using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de TileProgress
/// </summary>
namespace Models.Ui
{
    public class TileProgress
    {
        public string Resume { get; set; }
        public decimal Percent { get; set; }
        public string Icon { get; set; }
        public string Text { get; set; }
        public string Color { get; set; }
        public string Status { get; set; }
        public string Link { get; set; }

        public TileProgress()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}