using System;
using System.Collections.Generic;

namespace SantaSion.Models;

public partial class Membresia
{
    public Guid Id { get; set; }

    public string Nombres { get; set; } = null!;

    public string Apellidos { get; set; } = null!;

    public string ConocidoComo { get; set; } = null!;

    public DateTime FechaNacimiento { get; set; }
}
