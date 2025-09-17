using System;

namespace Controllers.Models.Utils
{
    /// <summary>
    /// Meta informações referentes à API requisitada.
    /// </summary>
    public class Meta
    {
        /// <summary>
        /// Data e hora da consulta, conforme especificação RFC-3339, formato UTC.
        /// </summary>
        /// <example>2021-05-21T08:30:00Z</example>
        public DateTime RequestDateTime { get; set; }

        public Meta()
        {
            RequestDateTime = DateTime.Now;
        }
    }
}