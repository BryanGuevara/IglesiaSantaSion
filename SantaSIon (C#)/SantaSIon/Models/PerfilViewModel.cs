using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public class PerfilViewModel
{
    public Membresia Membresia { get; set; }
    public List<Rol> Roles { get; set; }
    public List<Comunidade> Comunidades { get; set; }
    public List<Directivo> Directivos { get; set; }
    public List<Directiva> PuestosDirectiva { get; set; }
    public List<Musico> Musicos { get; set; }
    public List<Instrumento> Instrumentos { get; set; }
    public IEnumerable<Membresia> Membresias { get; set; }
}

