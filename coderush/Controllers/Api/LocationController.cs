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
    //[Authorize]
    [Produces("application/json")]
    [Route("api/Location")]
    public class LocationController : Controller
    {
        private readonly ApplicationDbContext _context;

        public LocationController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Location
        [HttpGet]
        public async Task<IActionResult> GetLocations()
        {
            List<Location> Items = await _context.Location.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }


        [HttpPost("[action]")]
        public IActionResult Insert([FromBody]CrudViewModel<Location> payload)
        {
            Location location = payload.value;
            _context.Location.Add(location);
            _context.SaveChanges();
            return Ok(location);
        }

        [HttpPost("[action]")]
        public IActionResult Update([FromBody]CrudViewModel<Location> payload)
        {
            Location location = payload.value;
            _context.Location.Update(location);
            _context.SaveChanges();
            return Ok(location);
        }

        [HttpPost("[action]")]
        public IActionResult Remove([FromBody]CrudViewModel<Location> payload)
        {
            Location location = _context.Location
                .Where(x => x.LocationId == (int)payload.key)
                .FirstOrDefault();
            _context.Location.Remove(location);
            _context.SaveChanges();
            return Ok(location);

        }
    }
}