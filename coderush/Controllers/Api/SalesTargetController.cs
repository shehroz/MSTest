using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using coderush.Data;
using coderush.Models;
using coderush.Models.SyncfusionViewModels;
using Microsoft.AspNetCore.Authorization;

namespace coderush.Controllers.Api
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/SalesTarget/")]
    public class SalesTargetController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SalesTargetController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/GetSalesTarget
        [HttpGet]
        public async Task<IActionResult> GetSalesTarget()
        {
            List<SalesTarget> Items = await _context.SalesTarget.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }
        [HttpPost("[action]")]
        public IActionResult Insert([FromBody]CrudViewModel<SalesTarget> payload)
        {
            SalesTarget salestarget = payload.value;
            salestarget.WaterValue3 = salestarget.WaterValue1 + salestarget.WaterValue2;
            salestarget.JuiceValue3 = salestarget.JuiceValue1 + salestarget.JuiceValue2;
            salestarget.TotalValue1 = salestarget.WaterValue1 + salestarget.JuiceValue1;
            salestarget.TotalValue2 = salestarget.WaterValue2 + salestarget.JuiceValue2;
            salestarget.TotalValue3 = salestarget.TotalValue1 + salestarget.TotalValue2;
            _context.SalesTarget.Add(salestarget);
            _context.SaveChanges();
            return Ok(salestarget);
        }

        [HttpPost("[action]")]
        public IActionResult Update([FromBody]CrudViewModel<SalesTarget> payload)
        {
            SalesTarget salestarget = payload.value;
            salestarget.WaterValue3 = salestarget.WaterValue1 + salestarget.WaterValue2;
            salestarget.JuiceValue3 = salestarget.JuiceValue1 + salestarget.JuiceValue2;
            salestarget.TotalValue1 = salestarget.WaterValue1 + salestarget.JuiceValue1;
            salestarget.TotalValue2 = salestarget.WaterValue2 + salestarget.JuiceValue2;
            salestarget.TotalValue3 = salestarget.TotalValue1 + salestarget.TotalValue2;

            _context.SalesTarget.Update(salestarget);
            _context.SaveChanges();
            return Ok(salestarget);
        }

        [HttpPost("[action]")]
        public IActionResult Remove([FromBody]CrudViewModel<SalesTarget> payload)
        {
            SalesTarget salestarget = _context.SalesTarget
                .Where(x => x.SalestargetId == (int)payload.key)
                .FirstOrDefault();
            _context.SalesTarget.Remove(salestarget);
            _context.SaveChanges();
            return Ok(salestarget);

        }
    }
}