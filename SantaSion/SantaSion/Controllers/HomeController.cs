using Microsoft.AspNetCore.Mvc;
using SantaSIon.Models;
using System.Diagnostics;

namespace SantaSIon.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly SantaSionContext _context; // Asegúrate de tener el contexto de la base de datos aquí.

        public HomeController(ILogger<HomeController> logger, SantaSionContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            // Recuperar la lista de eventos que deseas mostrar en la página de inicio
            var eventos = _context.Eventos.ToList();

            foreach (var evento in eventos)
            {
                // Limpia los caracteres de nueva línea de la descripción
                evento.Descripcion = evento.Descripcion?.Replace("\n", "").Replace("\r", "");
            }
            return View(eventos);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}