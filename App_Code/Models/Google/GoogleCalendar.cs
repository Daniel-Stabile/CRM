using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GoogleCalendar
/// </summary>
namespace Models.Google
{
    public class GoogleCalendar
    {
        public string calID { get; set; }
        public string type { get; set; }
        public string applicationName { get; set; }
        public string clientId { get; set; }
        public string clientSecret { get; set; }
        public string datafolder { get; set; }
        public string uri { get; set; }
        public string calendarApiKey { get; set; }
        public string urlAtual { get; set; }
        public string intParGoogle { get; set; }

        public GoogleCalendar()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}