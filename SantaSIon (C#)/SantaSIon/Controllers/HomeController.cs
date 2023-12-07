using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SantaSIon.Models;
using System.Diagnostics;

namespace SantaSIon.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly SantaSionContext _context;

        public HomeController(ILogger<HomeController> logger, SantaSionContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var eventos = _context.Eventos.ToList();

            eventos.ForEach(evento =>
            {
                evento.Descripcion = evento.Descripcion?.Replace("\n", "<br>")?.Replace("\r", "<br>");
            });
            return View(eventos);
        }
        public IActionResult Perfiles(Guid id)
        {
            var membresia = _context.Membresias.FirstOrDefault(m => m.Id == id);

            if (membresia == null)
            {
                return NotFound();
            }

            var roles = _context.RolMembresia
                .Where(rm => rm.MenmbresiaId == id)
                .Select(rm => rm.Rol)
                .ToList();

            var comunidades = _context.MembresiasComunidades
                .Where(mc => mc.MembresiaId == id)
                .Select(mc => mc.Comunidad)
                .ToList();

            var esDirectivo = _context.Directivos.Any(d => d.MembresiaId == id);
            var directivos = new List<Directivo>();
            var puestosDirectiva = new List<Directiva>();

            if (esDirectivo)
            {
                directivos = _context.Directivos.Where(d => d.MembresiaId == id).ToList();
                var directivaIds = directivos.Select(d => d.DirectivasId).ToList();
                puestosDirectiva = _context.Directivas.Where(d => directivaIds.Contains(d.Id)).ToList();
            }

            var modelo = new PerfilViewModel
            {
                Membresia = membresia,
                Roles = roles,
                Comunidades = comunidades,
                Directivos = directivos,
                PuestosDirectiva = puestosDirectiva
            };

            return View(modelo);
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