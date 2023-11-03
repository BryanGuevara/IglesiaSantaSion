using System;
using System.Collections.Generic;

namespace SantaSion.Models;

public partial class MembresiasComunidad
{
    public Guid Id { get; set; }

    public Guid? MembresiaId { get; set; }

    public Guid? ComunidadId { get; set; }
}
