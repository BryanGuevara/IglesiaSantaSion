using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class Interesado
{
    public Guid Id { get; set; }

    public Guid? EventoId { get; set; }

    public Guid? MembresiaId { get; set; }

    public DateTime? FechaInteres { get; set; }
}
