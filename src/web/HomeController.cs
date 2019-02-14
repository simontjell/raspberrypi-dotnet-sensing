using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Unosquare.RaspberryIO;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace web
{
    public class HomeController : Controller
    {
        private readonly string _scriptPath;

        public HomeController(IConfiguration configuration)
        {
            _scriptPath = (configuration?["bme680:readoncepath"] as string ?? throw new ArgumentNullException(nameof(configuration)));
        }

        public class SensourOutput
        {
            public double Temperature { get; set; }
            public double Pressure { get; set; }
            public double Humidity { get; set; }
        }

        [Route("sensor")]
        public IActionResult Index()
            => System.IO.File.Exists(_scriptPath) ? (IActionResult)Json(ReadSensorOutput()) : NotFound("Sensor reader script not found");

        private SensourOutput ReadSensorOutput()
        {
            var process = new Process { StartInfo = new ProcessStartInfo { FileName = _scriptPath, RedirectStandardOutput = true } };
            process.Start();
            process.WaitForExit();
            return Newtonsoft.Json.JsonConvert.DeserializeObject<SensourOutput>(process.StandardOutput.ReadToEnd());
        }

        [Route("status")]
        public IActionResult GetStatus()
            => Ok(Pi.Info.ToString());
    }
}
