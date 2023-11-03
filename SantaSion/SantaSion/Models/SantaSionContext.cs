using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SantaSion.Models;

public partial class SantaSionContext : DbContext
{
    public SantaSionContext()
    {
    }

    public SantaSionContext(DbContextOptions<SantaSionContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Comunidad> Comunidades { get; set; }

    public virtual DbSet<Directiva> Directivas { get; set; }

    public virtual DbSet<Directivo> Directivos { get; set; }

    public virtual DbSet<Membresia> Membresias { get; set; }

    public virtual DbSet<MembresiasComunidad> MembresiasComunidades { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server=localhost; database=SantaSion; Trusted_Connection=SSPI; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Comunidad>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.EdadFin)
                .HasMaxLength(7)
                .IsUnicode(false);
            entity.Property(e => e.Edadinicio)
                .HasMaxLength(7)
                .IsUnicode(false);
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Directiva>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Nombre)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Directivo>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.Id).HasColumnName("ID");
        });

        modelBuilder.Entity<Membresia>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.Apellidos)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ConocidoComo)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FechaNacimiento).HasColumnType("date");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Nombres)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MembresiasComunidad>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.Id).HasColumnName("ID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
