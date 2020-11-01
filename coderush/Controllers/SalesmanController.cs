using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using coderush.Data;
using coderush.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace coderush.Controllers
{
    
    public class SalesmanController : Controller
    {
        private readonly ApplicationDbContext _context;
        public SalesmanController(ApplicationDbContext context)
        {
            _context = context;
        }

        [Authorize(Roles = Pages.MainMenu.Salesman.RoleName)]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        
        [Authorize(Roles = Pages.MainMenu.SalesmanLocation.RoleName)]
        [HttpGet]
        public IActionResult SalesmanLocation(int id)
        {
            string markers = "";
            SalesmanLocation salesmanLocation = new SalesmanLocation();
            Salesman salesman = _context.Salesman.SingleOrDefault(x => x.SalesmanId.Equals(id));
            if (salesman == null)
            {
                return NotFound();
            }
            else
            {
                Location location = _context.Location.SingleOrDefault(x => x.LocationId.Equals(salesman.LocationId));
                salesmanLocation.location = location;
                markers += "[" + location.Latitude + "," + location.Longitude + "]";
            }
            if (salesmanLocation.location == null)
            {
                return NotFound();
            }
            ViewBag.Markers = markers;
            return View(salesmanLocation);
        }

        [Authorize(Roles = Pages.MainMenu.SalesmanView.RoleName)]

        [HttpGet]
        public IActionResult ViewSalesman()
        {
            return View();
        }
    }
}