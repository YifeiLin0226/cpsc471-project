using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using ProjectTemp.Helpers;


namespace ProjectTemp.Controllers
{
    [Route("api/ValuesController")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        
        // GET api/ValuesController/GetValues
        [HttpGet]
        [Route("GetValues")]
        public ActionResult<IEnumerable<string>> GetValues()
        {
            return new string[] { "value1", "value2" };
        }
        /*
        // GET api/ValuesController/GetValuesById?id=5
        [HttpGet]
        [Route("GetValuesById")]
        public ActionResult<IEnumerable<string>> GetValuesById(int id)
        {
            return new string[] { "value1" };
        }

        // PUT api/ValuesController/InsertEmployee
        [HttpPut]
        [Route("InsertEmployee")]
        public void InsertEmployee([FromBody] JObject emp)
        {
            string empName = (string)emp["empName"];
            string empBdate = (string)emp["empBdate"];
        }

        // PUT api/ValuesController/UpdateEmployee
        [HttpPost]
        [Route("UpdateEmployee")]
        public void UpdateEmployee([FromBody] JObject emp)
        {
            int empId = (int)emp["empId"];
            string empName = (string)emp["empName"];
            string empBdate = (string)emp["empBdate"];
            
        }
        */

        [HttpPost]
        [Route("train/AddTrain")]
        public int InsertTrain([FromBody] JObject train)
        {
            int trainId = (int)train["trainId"];
            int nocars = (int)train["nocars"];
            string company_name = (string)train["company_name"];
            bool passenger_flag = (bool)train["passenger_flag"];
            int economy_class = (int)train["economy_class"];
            int business_class = (int)train["business_class"];
            bool freight_flag = (bool)train["freight_flag"];
            double max_cargo = (double)train["max_cargo"];
            double max_volume = (double)train["max_volume"];
            DatabaseModel dm = new DatabaseModel();
          
            return dm.AddTrain(trainId, nocars, company_name, passenger_flag, economy_class, business_class, freight_flag, max_cargo, max_volume);
        }

        [HttpGet]
        [Route("train/GetTrainsFromCompany")]
        public ActionResult<IEnumerable<string>>GetTrainsFromCompany(string company_name)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.GetTrainsFromCompany(company_name));
        }

        [HttpGet]
        [Route("ticket/GetTicketInfo")]
        public ActionResult<IEnumerable<string>>GetTicketInfo(int ticketNumber,int ID)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.getTicketInfo(ticketNumber, ID));
        }

        [HttpGet]
        [Route("route/GetRouteInfo")]
        public ActionResult<IEnumerable<string>>GetRouteInfo(int routeNumber)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.getRouteInfo(routeNumber));
        }

        [HttpPut]
        [Route("route/AssignTrain")]
        public int AssignTrain(int routeNumber,int trainID)
        {
            DatabaseModel dm = new DatabaseModel();
            return dm.AssignTrain(routeNumber, trainID);
        }

        [HttpPut]
        [Route("driver/AssignDriver")]
        public ActionResult<IEnumerable<string>>AssignDriver(int driverID,int trainID)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.AssignDriver(driverID, trainID));
        }

        [HttpPut]
        [Route("mechanic/AssignMechanic")]
        public ActionResult<IEnumerable<string>> AssignMechanic(int mechanicID, int trainID)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.AssignMechanic(mechanicID, trainID));
        }

        [HttpGet]
        [Route("ticket/FindTicket")]
        public ActionResult<IEnumerable<string>> FindTicket(int routeNumber)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.FindTicket(routeNumber));
        }

        [HttpPut]
        [Route("company/AdjustPrice")]
        public ActionResult<IEnumerable<string>> AdjustPrice(int routeNumber,string classType,int price)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.AdjustPrice(routeNumber, classType, price));
        }
        [HttpPost]
        [Route("route/AddStation")]
        public ActionResult<IEnumerable<string>> AddStation(int routeNumber, string stationName)
        {
            DatabaseModel dm = new DatabaseModel();
            return Ok(dm.AddStation(routeNumber, stationName));
        }
    }
}
