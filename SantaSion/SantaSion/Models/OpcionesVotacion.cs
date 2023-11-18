using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class OpcionesVotacion
{
    public Guid Id { get; set; }

    public Guid? VotacionId { get; set; }

    public string Opcion { get; set; } = null!;
}
