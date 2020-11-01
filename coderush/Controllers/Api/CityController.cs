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
    [Route("api/City")]
    public class CityController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CityController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/City
        [HttpGet]
        public async Task<IActionResult> GetCity()
        {
            List<City> Items = await _context.City.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }


        [HttpPost("[action]")]
        public IActionResult Insert([FromBody]CrudViewModel<City> payload)
        {
            City city = payload.value;
            _context.City.Add(city);
            _context.SaveChanges();
            return Ok(city);
        }

        [HttpPost("[action]")]
        public IActionResult Update([FromBody]CrudViewModel<City> payload)
        {
            City city = payload.value;
            _context.City.Update(city);
            _context.SaveChanges();
            return Ok(city);
        }

        [HttpPost("[action]")]
        public IActionResult Remove([FromBody]CrudViewModel<City> payload)
        {
            City city = _context.City
                .Where(x => x.CityId == (int)payload.key)
                .FirstOrDefault();
            _context.City.Remove(city);
            _context.SaveChanges();
            return Ok(city);

        }
    }
}