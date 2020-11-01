using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coderush.Models
{
    public class Supervisor
    {
        public int SupervisorId { get; set; }
        public string Name { get; set; }
        public int CityId { get; set; }
        public string Email { get; set; }

    }
}
