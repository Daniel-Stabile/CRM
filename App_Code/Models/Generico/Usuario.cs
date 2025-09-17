using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Usuario
/// </summary>
namespace Models.Generico
{
    public class Usuario
    {
        public long? Handle      { get; set; }
        public string Nome      { get; set; }
        public string Apelido   { get; set; }
        public string Imagem    { get; set; }
        public string Cargo     { get; set; }
        public string Filial    { get; set; }
        public string Vertical  { get; set; }

        public Usuario()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }

    }

}