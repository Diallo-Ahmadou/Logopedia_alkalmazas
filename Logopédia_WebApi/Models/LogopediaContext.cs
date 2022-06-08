using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Logopédia_WebApi.Models
{
    public partial class LogopediaContext : DbContext
    {
        public LogopediaContext()
        {
        }

        public LogopediaContext(DbContextOptions<LogopediaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Diagnozisok> Diagnozisok { get; set; }
        public virtual DbSet<Eredmenyek> Eredmenyek { get; set; }
        public virtual DbSet<Gyerek_elerhetosegek> Gyerek_elerhetosegek { get; set; }
        public virtual DbSet<Gyerekek> Gyerekek { get; set; }
        public virtual DbSet<Ovodak> Ovodak { get; set; }
        public virtual DbSet<Szakemberek> Szakemberek { get; set; }
        public virtual DbSet<Terapiak> Terapiak { get; set; }
        public virtual DbSet<Tesztek> Tesztek { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySql("server=localhost;user id=root;database=logopedia", Microsoft.EntityFrameworkCore.ServerVersion.Parse("10.4.21-mariadb"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasCharSet("utf8mb4")
                .UseCollation("utf8mb4_general_ci");

            modelBuilder.Entity<Diagnozisok>(entity =>
            {
                entity.HasKey(e => e.diagnozisID)
                    .HasName("PRIMARY");
            });

            modelBuilder.Entity<Eredmenyek>(entity =>
            {
                entity.HasKey(e => new { e.tesztID, e.oktatasi_azonosito, e.kitoltes_datuma })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0, 0 });

                entity.HasOne(d => d.oktatasi_azonositoNavigation)
                    .WithMany(p => p.eredmenyek)
                    .HasForeignKey(d => d.oktatasi_azonosito)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("eredmenyek_ibfk_3");

                entity.HasOne(d => d.terapiaIDNavigation)
                    .WithMany(p => p.eredmenyek)
                    .HasForeignKey(d => d.terapiaID)
                    .HasConstraintName("eredmenyek_ibfk_2");

                entity.HasOne(d => d.tesztIDNavigation)
                    .WithMany(p => p.eredmenyek)
                    .HasForeignKey(d => d.tesztID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("eredmenyek_ibfk_1");
            });

            modelBuilder.Entity<Gyerek_elerhetosegek>(entity =>
            {
                entity.HasKey(e => e.elerhetosegID)
                    .HasName("PRIMARY");
            });

            modelBuilder.Entity<Gyerekek>(entity =>
            {
                entity.HasKey(e => e.oktatasi_azonosito)
                    .HasName("PRIMARY");

                entity.Property(e => e.logopediai_ellatas_kell_e).IsFixedLength(true);

                entity.HasOne(d => d.diagnozisIDNavigation)
                    .WithMany(p => p.gyerekek)
                    .HasForeignKey(d => d.diagnozisID)
                    .HasConstraintName("gyerekek_ibfk_1");

                entity.HasOne(d => d.elerhetosegIDNavigation)
                    .WithMany(p => p.gyerekek)
                    .HasForeignKey(d => d.elerhetosegID)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("gyerekek_ibfk_3");

                entity.HasOne(d => d.ovodaIDNavigation)
                    .WithMany(p => p.gyerekek)
                    .HasForeignKey(d => d.ovodaID)
                    .HasConstraintName("gyerekek_ibfk_2");
            });

            modelBuilder.Entity<Ovodak>(entity =>
            {
                entity.HasKey(e => e.ovodaID)
                    .HasName("PRIMARY");
            });

            modelBuilder.Entity<Szakemberek>(entity =>
            {
                entity.HasKey(e => e.ellato_szakemberID)
                    .HasName("PRIMARY");
            });

            modelBuilder.Entity<Terapiak>(entity =>
            {
                entity.HasKey(e => e.terapiaID)
                    .HasName("PRIMARY");

                entity.Property(e => e.szukseges_e).IsFixedLength(true);

                entity.HasOne(d => d.ellato_szakember)
                    .WithMany(p => p.terapiak)
                    .HasForeignKey(d => d.ellato_szakemberID)
                    .HasConstraintName("terapiak_ibfk_1");
            });

            modelBuilder.Entity<Tesztek>(entity =>
            {
                entity.HasKey(e => e.tesztID)
                    .HasName("PRIMARY");

                entity.Property(e => e.kotelezo).IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
