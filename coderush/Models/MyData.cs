using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace coderush.Models
{
    public class Mydata
    {
        public string desc { get; set; }
        public string lat { get; set; }
        public string lon { get; set; }
        public Mydata(string Desc, string Lat, string Lon)
        {
            this.desc = Desc;
            this.lat = Lat;
            this.lon = Lon;
        }
    }
}
