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
    [Route("api/Supervisor")]
    public class SupervisorController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SupervisorController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Supervisor
        [HttpGet]
        public async Task<IActionResult> GetSupervisor()
        {
            List<Supervisor> Items = await _context.Supervisor.ToListAsync();
            int Count = Items.Count();
            return Ok(new { Items, Count });
        }
        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetSupervisorByCityId([FromRoute]int id)
        {
            City city = new City();
            List<Supervisor> supervisorList = new List<Supervisor>();
            city = await _context.City.SingleOrDefaultAsync(x => x.CityId.Equals(id));
            if (city != null && city.CityId != 0)
            {
                supervisorList = await _context.Supervisor.Where(x => x.CityId.Equals(city.CityId)).ToListAsync();

            }
            return Ok(supervisorList);
        }

        [HttpPost("[action]")]
        public IActionResult Insert([FromBody]CrudViewModel<Supervisor> payload)
        {
            Supervisor supervisor = payload.value;
            _context.Supervisor.Add(supervisor);
            _context.SaveChanges();
            return Ok(supervisor);
        }

        [HttpPost("[action]")]
        public IActionResult Update([FromBody]CrudViewModel<Supervisor> payload)
        {
            Supervisor supervisor = payload.value;
            _context.Supervisor.Update(supervisor);
            _context.SaveChanges();
            return Ok(supervisor);
        }

        [HttpPost("[action]")]
        public IActionResult Remove([FromBody]CrudViewModel<Supervisor> payload)
        {
            Supervisor supervisor = _context.Supervisor
                .Where(x => x.SupervisorId == (int)payload.key)
                .FirstOrDefault();
            _context.Supervisor.Remove(supervisor);
            _context.SaveChanges();
            return Ok(supervisor);

        }
    }
}