using System;
using System.Collections.Generic;

namespace SantaSion.Models;

public partial class Comunidad
{
    public Guid Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string? Edadinicio { get; set; }

    public string? EdadFin { get; set; }
}
