using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CalendarEvent
/// </summary>
namespace Models.Calendar
{
    public class CalendarEvent
    {
        public String id { get; set; }
        public String title { get; set; }
        public String start { get; set; }
        public String end { get; set; }
        public String color { get; set; }

        public CalendarEvent()
        {

        }

        public CalendarEvent(String I, String t, String ds, String de, String col)
        {
            this.id = I;
            this.title = t;
            this.start = ds;
            this.end = de;
            this.color = col;
        }

    }
}