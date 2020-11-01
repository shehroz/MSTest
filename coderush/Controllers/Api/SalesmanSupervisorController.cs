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
using static coderush.HtmlHelpers;

namespace coderush.Controllers.Api
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/SalesmanSupervisor")]
    public class SalesmanSupervisorController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SalesmanSupervisorController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/SupervisorSalesman
        [HttpGet]
        public async Task<IActionResult> GetSupervisorSalesman()
        {
            string markers = "";
            List<SalesmanLocation> salesmanLocationsList = new List<SalesmanLocation>();
            List<Salesman> salesmanList =await _context.Salesman.ToListAsync();
            if (salesmanList == null)
            {
                return NotFound();
            }
            else
            {
                foreach (var item in salesmanList)
                {
                    SalesTarget salesTarget = await _context.SalesTarget.Where(x => x.SalesmanId == item.SalesmanId && x.Status == StatusList.approved).SingleOrDefaultAsync();
                    if (salesTarget != null)
                    {
                        Location location = await _context.Location.Where(x => x.LocationId == item.LocationId).SingleOrDefaultAsync();
                        SalesmanLocation salesmanLocation = new SalesmanLocation();
                        salesmanLocation.salesman = item;
                        salesmanLocation.location = location;
                        markers += "[" + location.Latitude + "," + location.Longitude + "]";
                        salesmanLocationsList.Add(salesmanLocation);
                    }
                }
            }
            ViewBag.Markers = markers;
            int Count = salesmanLocationsList.Count();
            return Ok(new { salesmanLocationsList, Count });

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