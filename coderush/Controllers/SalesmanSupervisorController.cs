using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using coderush.Data;
using coderush.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using static coderush.HtmlHelpers;


namespace coderush.Controllers
{
    [Authorize(Roles = Pages.MainMenu.SalesmanSupervisor.RoleName)]
    public class SalesmanSupervisorController : Controller
    {
        private readonly ApplicationDbContext _context;
        public SalesmanSupervisorController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult Index(int id = 0)
        {
            string salesmanString = "[";
            //String userEmail = Convert.ToString(TempData["UserEmail"]).ToUpper().Trim();
            String userEmail = Convert.ToString(TempData.Peek("UserEmail"));
            string markers = "[";
            List<SalesmanLocation> salesmanLocationsList = new List<SalesmanLocation>();
            Supervisor supervisor = _context.Supervisor.Where(x => x.Email.ToUpper().Equals(userEmail)).FirstOrDefault();
            ApplicationUser User = _context.ApplicationUser.Where(x => x.Email.Equals(userEmail)).FirstOrDefault();

            List<Salesman> salesmanList = null;
            if (id == 0)
            {
                salesmanList = _context.Salesman.Where(x => x.SupervisorId.Equals(supervisor.SupervisorId)).ToList();
            }
            else
            {
                salesmanList = _context.Salesman.Where(x => x.SupervisorId.Equals(supervisor.SupervisorId) && x.SalesmanId.Equals(id)).ToList();
            }

            if (salesmanList == null)
            {
                return NotFound();
            }
            else
            {
                foreach (var item in salesmanList)
                {
                    SalesTarget salesTarget = _context.SalesTarget.Where(x => x.SalesmanId == item.SalesmanId && x.Status == StatusList.approved).SingleOrDefault();
                    if (salesTarget != null)
                    {
                        Location location = _context.Location.Where(x => x.LocationId == item.LocationId).SingleOrDefault();
                        SalesmanLocation salesmanLocation = new SalesmanLocation();
                        salesmanLocation.salesman = item;
                        salesmanLocation.location = location;
                        markers += "['" + location.Description + "'," + location.Latitude + "," + location.Longitude + "],";

                        salesmanLocationsList.Add(salesmanLocation);
                    }

                    salesmanString += "{ text: '" + item.SalesmanName + "', value: '" + item.SalesmanId + "'},";
                }
            }
            salesmanString = salesmanString + "]";
            markers = markers + "];";
            ViewBag.Markers = markers;
            ViewBag.Salesman = salesmanString;
            return View(salesmanLocationsList);

        }

        public JsonResult GetFilteredData(int id = 0)
        {
            String userEmail = Convert.ToString(TempData.Peek("UserEmail"));
            List<Mydata> mydatalist = new List<Mydata>();
            var markers = "[";
            List<SalesmanLocation> salesmanLocationsList = new List<SalesmanLocation>();
            Supervisor supervisor = _context.Supervisor.Where(x => x.Email.ToUpper().Equals(userEmail)).FirstOrDefault();
            ApplicationUser User = _context.ApplicationUser.Where(x => x.Email.Equals(userEmail)).FirstOrDefault();
            if (User.UserType.ToUpper().Trim() == UserType.Supervisor)
            {
                List<Salesman> salesmanList = null;
                if (id == 0)
                {
                    salesmanList = _context.Salesman.Where(x => x.SupervisorId.Equals(supervisor.SupervisorId)).ToList();
                }
                else
                {
                    salesmanList = _context.Salesman.Where(x => x.SupervisorId.Equals(supervisor.SupervisorId) && x.SalesmanId.Equals(id)).ToList();
                }

                if (salesmanList == null)
                {
                    return Json("");
                }
                else
                {
                    foreach (var item in salesmanList)
                    {
                        SalesTarget salesTarget = _context.SalesTarget.Where(x => x.SalesmanId == item.SalesmanId && x.Status == StatusList.approved).SingleOrDefault();
                        if (salesTarget != null)
                        {
                            Location location = _context.Location.Where(x => x.LocationId == item.LocationId).SingleOrDefault();
                            SalesmanLocation salesmanLocation = new SalesmanLocation();
                            salesmanLocation.salesman = item;
                            salesmanLocation.location = location;
                            markers += "['" + location.Description + "'," + location.Latitude + "," + location.Longitude + "],";
                            Mydata m = new Mydata(location.Description, location.Latitude, location.Longitude);
                            mydatalist.Add(m);
                            salesmanLocationsList.Add(salesmanLocation);
                        }
                    }
                }
                markers = markers + "];";
                //ViewBag.Markers = "[['Bondi Beach', -33.890542, 151.274856],['Coogee Beach', -33.923036, 151.259052],];";

                return Json(mydatalist, new Newtonsoft.Json.JsonSerializerSettings());
            }
            else
            {
                return Json("");
            }
        }

        
    }
    
}