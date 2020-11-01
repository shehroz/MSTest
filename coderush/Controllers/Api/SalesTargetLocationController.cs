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
    [Route("api/SalesTargetLocation")]
    public class SalesTargetLocationController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SalesTargetLocationController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/GetSalesTargetLocation
        [HttpGet]
        public async Task<IActionResult> GetSalesTargetLocation()
        {
            List<SalesTargetLocation> Items = await _context.SalesTargetLocation.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }


        [HttpPost("[action]")]
        public IActionResult Insert([FromBody]CrudViewModel<SalesTargetLocation> payload)
        {
            SalesTargetLocation salestargetlocation = payload.value;
            _context.SalesTargetLocation.Add(salestargetlocation);
            _context.SaveChanges();
            return Ok(salestargetlocation);
        }

        [HttpPost("[action]")]
        public IActionResult Update([FromBody]CrudViewModel<SalesTargetLocation> payload)
        {
            SalesTargetLocation salestargetlocation = payload.value;
            _context.SalesTargetLocation.Update(salestargetlocation);
            _context.SaveChanges();
            return Ok(salestargetlocation);
        }

        [HttpPost("[action]")]
        public IActionResult Remove([FromBody]CrudViewModel<SalesTargetLocation> payload)
        {
            SalesTargetLocation salestargetlocation = _context.SalesTargetLocation
                .Where(x => x.SalesTargetLocationId == (int)payload.key)
                .FirstOrDefault();
            _context.SalesTargetLocation.Remove(salestargetlocation);
            _context.SaveChanges();
            return Ok(salestargetlocation);

        }
    }
}