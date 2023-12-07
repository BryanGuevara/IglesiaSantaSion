using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class Instrumento
{
    public Guid Id { get; set; }

    public string Nombre { get; set; } = null!;
}
