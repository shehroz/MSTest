using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coderush.Models
{
    public class City
    {
        public int CityId { get; set; }
        [Required]
        public string CityName { get; set; }
    }
}
