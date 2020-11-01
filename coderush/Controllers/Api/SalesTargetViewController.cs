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
using coderush.Services;

namespace coderush.Controllers.Api
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/SalesTargetView/")]
    public class SalesTargetViewController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IEmailSender _emailSender;

        public SalesTargetViewController(ApplicationDbContext context, IEmailSender emailSender)
        {
            _context = context;
            _emailSender = emailSender;
        }

        // GET: api/GetSalesTarget
        [HttpGet]
        public async Task<IActionResult> GetPendingSalesTarget()
        {
            List<SalesTarget> Items = await _context.SalesTarget.Where(x=>x.Status.Equals(StatusList.pending)).ToListAsync();
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

        [HttpGet("[action]")]
        public async Task<IActionResult> Approve()
        {
            List<string> emailList = new List<string>();
            List<SalesTarget> salesTarget = await _context.SalesTarget.Where(x => x.Status.Equals(StatusList.pending)).ToListAsync();
            if (salesTarget == null)
            {
                return NotFound();
            }
            else
            {
                foreach (var item in salesTarget)
                {
                    item.Status = StatusList.approved;
                    _context.SalesTarget.Update(item);
                    _context.SaveChanges();
                    Salesman salesman = _context.Salesman.Where(x => x.SalesmanId.Equals(item.SalesmanId)).FirstOrDefault();
                    Supervisor supervisor = _context.Supervisor.Where(x => x.SupervisorId.Equals(salesman.SupervisorId)).FirstOrDefault();

                    var match = emailList.FirstOrDefault(x=> x.Contains(supervisor.Email));
                    if (match == null)
                    {
                        emailList.Add(supervisor.Email);
                    }
                    match = emailList.FirstOrDefault(x => x.Contains(salesman.Email));
                    if (match == null)
                    {
                        emailList.Add(salesman.Email);
                    }
                }
                foreach (var item in emailList)
                {
                    await _emailSender.SendEmailConfirmationOnTargetAsync(item);
                }

                return Ok(salesTarget);
            }
            


        }
        [HttpGet("[action]")]
        public async Task<IActionResult> Reject()
        {
            List<SalesTarget> salesTarget = await _context.SalesTarget.Where(x => x.Status.Equals(StatusList.pending)).ToListAsync();
            if (salesTarget == null)
            {
                return NotFound();
            }
            else
            {
                foreach (var item in salesTarget)
                {
                    item.Status = StatusList.reject;
                    _context.SalesTarget.Update(item);
                    _context.SaveChanges();
                }

                return Ok(salesTarget);
            }

        }
    }
}