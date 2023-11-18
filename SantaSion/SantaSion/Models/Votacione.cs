using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class Votacione
{
    public Guid Id { get; set; }

    public string Titulo { get; set; } = null!;

    public string? Descripcion { get; set; }
}
