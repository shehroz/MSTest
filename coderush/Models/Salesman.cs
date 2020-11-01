using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coderush.Models
{
    public class Salesman
    {
        public int SalesmanId { get; set; }

        [DisplayName("Salesman Name")]
        [Required]
        public string SalesmanName { get; set; }
        [DisplayName("Location")]
        public int LocationId { get; set; }
        [DisplayName("Supervisor")]
        public int SupervisorId { get; set; }
        [DisplayName("City")]
        public int CityId { get; set; }
        public string Email { get; set; }
    }
}
