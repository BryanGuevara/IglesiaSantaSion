using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SantaSIon.Models;

public partial class SantaSionContext : DbContext
{
    public SantaSionContext()
    {
    }

    public SantaSionContext(DbContextOptions<SantaSionContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Comunidade> Comunidades { get; set; }

    public virtual DbSet<Directiva> Directivas { get; set; }

    public virtual DbSet<Directivo> Directivos { get; set; }

    public virtual DbSet<Evento> Eventos { get; set; }

    public virtual DbSet<Instrumento> Instrumentos { get; set; }

    public virtual DbSet<Interesado> Interesados { get; set; }

    public virtual DbSet<Membresia> Membresias { get; set; }

    public virtual DbSet<MembresiasComunidade> MembresiasComunidades { get; set; }

    public virtual DbSet<Musico> Musicos { get; set; }

    public virtual DbSet<OpcionesVotacion> OpcionesVotacions { get; set; }

    public virtual DbSet<Rol> Rols { get; set; }

    public virtual DbSet<RolMembresium> RolMembresia { get; set; }

    public virtual DbSet<Votacione> Votaciones { get; set; }

    public virtual DbSet<Voto> Votos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server=localhost; database=SantaSion; Trusted_Connection=SSPI; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Comunidade>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Comunida__3214EC27A6CDC09C");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.EdadFin)
                .HasMaxLength(7)
                .IsUnicode(false);
            entity.Property(e => e.Edadinicio)
                .HasMaxLength(7)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Directiva>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Directiv__3214EC27ABB94159");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Nombre)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Directivo>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Directiv__3214EC277CD551A7");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<Evento>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Eventos__3214EC2764557E44");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Descripcion).HasColumnType("text");
            entity.Property(e => e.FechaFin).HasColumnType("date");
            entity.Property(e => e.FechaInicio).HasColumnType("date");
            entity.Property(e => e.HoraFin)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.HoraInicio)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Titulo)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Instrumento>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Instrume__3214EC27A05B88DE");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Nombre)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Interesado>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Interesa__3214EC2775F155C9");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.EventoId).HasColumnName("EventoID");
            entity.Property(e => e.FechaInteres).HasColumnType("datetime");
            entity.Property(e => e.MembresiaId).HasColumnName("MembresiaID");
        });

        modelBuilder.Entity<Membresia>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Membresi__3214EC27FE78A8C5");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Apellidos)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ConocidoComo)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FechaNacimiento).HasColumnType("date");
            entity.Property(e => e.Nombres)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MembresiasComunidade>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Membresi__3214EC2718406651");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<Musico>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Musicos__3214EC27BEFE71BE");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<OpcionesVotacion>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Opciones__3214EC275BF88608");

            entity.ToTable("OpcionesVotacion");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Opcion)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VotacionId).HasColumnName("VotacionID");
        });


        modelBuilder.Entity<Rol>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Rol__3214EC2789EC7F85");

            entity.ToTable("Rol");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Nombre)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RolMembresium>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__RolMembr__3214EC2797CD53DC");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<Votacione>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Votacion__3214EC27AC075E3A");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Descripcion).HasColumnType("text");
            entity.Property(e => e.Titulo)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Voto>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Votos__3214EC277EC060D6");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.MembresiaId).HasColumnName("MembresiaID");
            entity.Property(e => e.OpcionId).HasColumnName("OpcionID");
            entity.Property(e => e.VotacionId).HasColumnName("VotacionID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
