using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coderush.Models
{
    public class SalesTarget
    {
        public int SalestargetId { get; set; }
        public int SalesmanId { get; set; }
        [Required]
        public double WaterValue1 { get; set; }
        [Required]
        public double WaterValue2 { get; set; }
        public double WaterValue3 { get; set; }
        [Required]
        public double JuiceValue1 { get; set; }
        [Required]
        public double JuiceValue2 { get; set; }
        public double JuiceValue3 { get; set; }
        public double TotalValue1 { get; set; }
        public double TotalValue2 { get; set; }
        public double TotalValue3 { get; set; }
        public string Status { get; set; }

    }
}
