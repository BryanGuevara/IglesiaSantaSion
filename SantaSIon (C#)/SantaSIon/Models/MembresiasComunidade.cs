using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class MembresiasComunidade
{
    public Guid Id { get; set; }

    public Guid? MembresiaId { get; set; }

    public Guid? ComunidadId { get; set; }

    public Membresia Membresia { get; set; }

    public Comunidade Comunidad { get; set; }
}
