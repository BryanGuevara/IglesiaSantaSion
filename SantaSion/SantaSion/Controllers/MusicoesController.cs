using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SantaSIon.Models;

namespace SantaSIon.Controllers
{
    public class MusicoesController : Controller
    {
        private readonly SantaSionContext _context;

        public MusicoesController(SantaSionContext context)
        {
            _context = context;
        }

        // GET: Musicoes
        public async Task<IActionResult> Index()
        {
            var musicos = await _context.Musicos
                .Include(m => m.Membresia)
                .Include(m => m.Instrumento)
                .ToListAsync();

            return View(musicos);
        }

        // GET: Musicoes/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.Musicos == null)
            {
                return NotFound();
            }

            var musico = await _context.Musicos
                .Include(m => m.Membresia)
                .Include(m => m.Instrumento)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (musico == null)
            {
                return NotFound();
            }

            return View(musico);
        }

        // GET: Musicoes/Create
        // GET: Musicoes/Create
        public IActionResult Create()
        {
            // Cargar la lista de membresías e instrumentos para mostrar en la vista de creación
            ViewBag.Membresias = new SelectList(_context.Membresias, "Id", "ConocidoComo");
            ViewBag.Instrumentos = new SelectList(_context.Instrumentos, "Id", "Nombre");

            return View();
        }

        // POST: Musicoes/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,MembresiaId,InstrumentoId")] Musico musico)
        {
            if (ModelState.IsValid)
            {
                musico.Id = Guid.NewGuid();

                // Cargar la membresía e instrumento seleccionados
                musico.Membresia = await _context.Membresias.FindAsync(musico.MembresiaId);
                musico.Instrumento = await _context.Instrumentos.FindAsync(musico.InstrumentoId);

                _context.Add(musico);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            // Si la validación falla, necesitas cargar la lista de membresías e instrumentos nuevamente para mostrar en la vista de creación
            ViewBag.Membresias = new SelectList(_context.Membresias, "Id", "ConocidoComo", musico.MembresiaId);
            ViewBag.Instrumentos = new SelectList(_context.Instrumentos, "Id", "Nombre", musico.InstrumentoId);

            return View(musico);
        }

        // GET: Musicoes/Edit/5
        // GET: Musicoes/Edit/5
        // GET: Musicoes/Edit/5
        // GET: Musicoes/Edit/5
        // GET: Musicoes/Edit/5
        // En tu controlador MusicoesController.cs
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.Musicos == null)
            {
                return NotFound();
            }

            var musico = await _context.Musicos
                .Include(m => m.Membresia)
                .Include(m => m.Instrumento)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (musico == null)
            {
                return NotFound();
            }

            // Cargar la lista de membresías e instrumentos para mostrar en la vista de edición
            ViewBag.Membresias = _context.Membresias
                .Select(m => new SelectListItem { Value = m.Id.ToString(), Text = m.ConocidoComo })
                .ToList(); // Asegúrate de tener datos aquí

            ViewBag.Instrumentos = _context.Instrumentos
                .Select(i => new SelectListItem { Value = i.Id.ToString(), Text = i.Nombre })
                .ToList(); // Asegúrate de tener datos aquí

            return View(musico);
        }


        // POST: Musicoes/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,MembresiaId,InstrumentoId")] Musico musico)
        {
            if (id != musico.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Cargar la membresía e instrumento seleccionados
                    musico.Membresia = await _context.Membresias.FindAsync(musico.MembresiaId);
                    musico.Instrumento = await _context.Instrumentos.FindAsync(musico.InstrumentoId);

                    _context.Update(musico);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MusicoExists(musico.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            // Si la validación falla, necesitas cargar la lista de membresías e instrumentos nuevamente para mostrar en la vista de edición
            ViewBag.Membresias = new SelectList(_context.Membresias, "Id", "ConocidoComo", musico.MembresiaId);
            ViewBag.Instrumentos = new SelectList(_context.Instrumentos, "Id", "Nombre", musico.InstrumentoId);

            return View(musico);
        }


        // GET: Musicoes/Delete/5
        // GET: Musicoes/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Musicos == null)
            {
                return NotFound();
            }

            var musico = await _context.Musicos
                .FirstOrDefaultAsync(m => m.Id == id);

            if (musico == null)
            {
                return NotFound();
            }

            return View(musico);
        }

        // POST: Musicoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Musicos == null)
            {
                return Problem("Entity set 'SantaSionContext.Musicos' is null.");
            }

            var musico = await _context.Musicos.FindAsync(id);
            if (musico != null)
            {
                _context.Musicos.Remove(musico);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }
        private bool MusicoExists(Guid id)
        {
            return _context.Musicos.Any(e => e.Id == id);
        }
    }
}

