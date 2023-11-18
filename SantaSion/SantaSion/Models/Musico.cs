using System;

namespace SantaSIon.Models
{
    public partial class Musico
    {
        public Guid Id { get; set; }

        public Guid MembresiaId { get; set; }

        public Guid InstrumentoId { get; set; }

        public Membresia Membresia { get; set; }

        public Instrumento Instrumento { get; set; }
    }
}
