using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using PingUtil.Lib;

namespace PingUtil.Controllers
{
    [HandleError] //[] = Attribute
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            ViewData["Depots"] = Pinger.GetDepots();
            //This function is run when /Home/Index is requested

                  return View();
        }
        

        [HttpPost]
        public ActionResult Index(string ip, int times)
        {

            var results = new List<string>();

            for (var i = 0; i < times; i++)
            {
                var reply = Pinger.PingHost(ip);
                results.Add(reply);
            }

            ViewData["Results"] = results;
            ViewData["Times"] = times;
            ViewData["HostName"] = ip;
            ViewData["Depots"] = Pinger.GetDepots();
            
            //This function is run when /Home/Index is requested

            return View();
        }

        
        
       

    }
}
