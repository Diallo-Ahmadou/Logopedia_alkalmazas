using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WPF.Models
{
    [Index(nameof(felhasznalo_nev), Name = "felhasznalo_nev", IsUnique = true)]
    [Index(nameof(jelszo), Name = "jelszo", IsUnique = true)]
    [Table("szakemberek")]
    public partial class Szakemberek
    {
        public Szakemberek()
        {
            terapiak = new HashSet<Terapiak>();
        }

        [Key]
        [Column(TypeName = "int(11)")]
        public int ellato_szakemberID { get; set; }
        [Required]
        [StringLength(60)]
        public string nev { get; set; }
        [Required]
        [StringLength(30)]
        public string felhasznalo_nev { get; set; }
        [Required]
        public string jelszo { get; set; }
        [Required]
        [StringLength(100)]
        public string munkahely { get; set; }
        [StringLength(100)]
        public string email { get; set; }
        [StringLength(17)]
        public string telefonszam { get; set; }

        [InverseProperty("ellato_szakember")]
        public virtual ICollection<Terapiak> terapiak { get; set; }
    }
}
