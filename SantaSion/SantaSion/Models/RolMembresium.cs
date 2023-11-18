using System;
using System.Collections.Generic;

namespace SantaSIon.Models;

public partial class RolMembresium
{
    public Guid Id { get; set; }

    public Guid? RolId { get; set; }

    public Guid? MenmbresiaId { get; set; }
}
