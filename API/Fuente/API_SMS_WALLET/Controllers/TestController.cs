using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace API_SMS_WALLET.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<TestController> _logger;

        public TestController(ILogger<TestController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            })
            .ToArray();
        }


        [HttpPost("Logic")]
        public async Task<IActionResult> LogicAsync()
        {
            string url = "http://localhost:4000/sms";

            // Your JSON data
            var data = new
            {
                Body = "Este es un mensaje de prueba desde Insomnia",
                From = "+1234567890",
                To = "+0987654321"
            };

            using (var httpClient = new HttpClient())
            {
                // Convert the data to JSON
                var json = Newtonsoft.Json.JsonConvert.SerializeObject(data);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                // Make the POST request
                var response = await httpClient.PostAsync(url, content);

                // Check the response status
                if (response.IsSuccessStatusCode)
                {
                    // Handle success
                    Console.WriteLine("Request successful");
                    Console.WriteLine(await response.Content.ReadAsStringAsync());
                }
                else
                {
                    // Handle error
                    Console.WriteLine($"Request failed with status code {response.StatusCode}");
                }
            }

            return Ok("asd");
        }
    }
}