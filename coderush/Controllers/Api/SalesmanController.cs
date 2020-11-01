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


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace coderush.Controllers.Api
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/Salesman")]
    public class SalesmanController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SalesmanController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Salesman
        [HttpGet]
        public async Task<IActionResult> GetSalesman()
        {
            List<Salesman> Items = await _context.Salesman.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }


        [HttpPost("[action]")]
        public IActionResult Insert([FromBody]CrudViewModel<Salesman> payload)
        {
            Salesman salesman = payload.value;
            salesman.LocationId = salesman.CityId;
            _context.Salesman.Add(salesman);
            _context.SaveChanges();
            return Ok(salesman);
        }

        [HttpPost("[action]")]
        public IActionResult Update([FromBody]CrudViewModel<Salesman> payload)
        {
            Salesman salesman = payload.value;
            salesman.LocationId = salesman.CityId;
            _context.Salesman.Update(salesman);
            _context.SaveChanges();
            return Ok(salesman);
        }

        [HttpPost("[action]")]
        public IActionResult Remove([FromBody]CrudViewModel<Salesman> payload)
        {
            Salesman salesman = _context.Salesman
                .Where(x => x.SalesmanId == (int)payload.key)
                .FirstOrDefault();
            _context.Salesman.Remove(salesman);
            _context.SaveChanges();
            return Ok(salesman);
        }
        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetSalesmanLocation([FromRoute]int id)
        {
            string markers = "";
            Salesman salesman = new Salesman();
            Location location = new Location();
            salesman = await _context.Salesman.SingleOrDefaultAsync(x => x.SalesmanId.Equals(id));
            if (salesman != null && salesman.SalesmanId != 0)
            {
                location = await _context.Location.Where(x => x.LocationId.Equals(salesman.LocationId)).SingleOrDefaultAsync();
                markers += "[{";
                markers += string.Format("'title': '{0}',", location.CityName);
                markers += string.Format("'lat': '{0}',", location.Latitude);
                markers += string.Format("'lng': '{0}',", location.Longitude);
                markers += string.Format("'description': '{0}'", location.Description);
                markers += "}]";
            }
            ViewBag.Markers = markers;
            return Ok(location);
        }
        //[HttpPost("[action]/{id}")]
        [HttpGet("[action]")]
        //public async Task<IActionResult> SalesmanLocation([FromRoute]int id)
        public async Task<IActionResult> SalesmanLocation(string latitute, string longitude, int salesmanId)
        {
            Salesman salesman = await _context.Salesman.SingleOrDefaultAsync(x => x.SalesmanId.Equals(salesmanId));
            if (salesman == null)
            {
                return NotFound();
            }
            else
            {
                Location location =await _context.Location.SingleOrDefaultAsync(x => x.LocationId.Equals(salesman.LocationId));
                location.Latitude = latitute;
                location.Longitude = longitude;
                _context.Location.Update(location);
                _context.SaveChanges();
                return Ok(location);
            }
            
        }
        
    }
}
