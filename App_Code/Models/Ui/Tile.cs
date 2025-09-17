using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Tile
/// </summary>
namespace Models.Ui
{
    public class Tile
    {
        public string Color { get; set; }
        public string Icon { get; set; }
        public string Number { get; set; }
        public string Text { get; set; }
        public string Link { get; set; }
        public string NewClass { get; set; }

        public Tile()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
            Color  = "blue";
            Number = "0";
            Icon   = "fa fa-cogs";
            Text   = "Nenhum resultado";
            Link   = "#";
        }
    }
}