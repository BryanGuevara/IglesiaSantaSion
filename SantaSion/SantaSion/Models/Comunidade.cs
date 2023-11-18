using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class Comunidade
{
    public Guid Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string? Edadinicio { get; set; }

    public string? EdadFin { get; set; }
}
