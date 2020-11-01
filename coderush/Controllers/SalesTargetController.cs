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
    [Authorize(Roles = Pages.MainMenu.SalesTarget.RoleName)]
    public class SalesTargetController : Controller
    {
        private readonly ApplicationDbContext _context;
        public SalesTargetController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Detail(int id)
        {
            Salesman salesmanDetail = _context.Salesman.SingleOrDefault(x => x.SalesmanId.Equals(id));

            if (salesmanDetail == null)
            {
                return NotFound();
            }

            return View(salesmanDetail);
        }
        public IActionResult ViewSalesTarget()
        {
            return View();
        }
    }
}