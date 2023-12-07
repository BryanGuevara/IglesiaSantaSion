using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class Voto
{
    public Guid Id { get; set; }

    public Guid? VotacionId { get; set; }

    public Guid? OpcionId { get; set; }

    public Guid? MembresiaId { get; set; }
}
