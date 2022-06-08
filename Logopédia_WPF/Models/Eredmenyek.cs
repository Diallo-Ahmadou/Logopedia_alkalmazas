using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WPF.Models
{
    [Index(nameof(oktatasi_azonosito), Name = "oktatasi_azonosito")]
    [Index(nameof(terapiaID), Name = "terapiaID")]
    public partial class Eredmenyek
    {
        [Key]
        [Column(TypeName = "int(11)")]
        public int tesztID { get; set; }
        [Key]
        [StringLength(11)]
        public string oktatasi_azonosito { get; set; }
        [Key]
        [Column(TypeName = "datetime")]
        public DateTime kitoltes_datuma { get; set; }
        [Column(TypeName = "int(11)")]
        public int? aktualis_eletkor_honapban { get; set; }
        [Column(TypeName = "int(11)")]
        public int? szokincs_pontszam { get; set; }
        [StringLength(30)]
        public string szokincs_szint { get; set; }
        [Column(TypeName = "int(11)")]
        public int? mondathasznalat_pontszam { get; set; }
        [StringLength(30)]
        public string mondathasznalat_szint { get; set; }
        [Column(TypeName = "int(11)")]
        public int? nyelvhasznalat_pontszam { get; set; }
        [StringLength(30)]
        public string nyelvhasznalat_szint { get; set; }
        [Column(TypeName = "int(11)")]
        public int? elmaradas_merteke { get; set; }
        [Column(TypeName = "int(11)")]
        public int? terapiaID { get; set; }

        [ForeignKey(nameof(oktatasi_azonosito))]
        [InverseProperty(nameof(Gyerekek.eredmenyek))]
        public virtual Gyerekek oktatasi_azonositoNavigation { get; set; }
        [ForeignKey(nameof(terapiaID))]
        [InverseProperty(nameof(Terapiak.eredmenyek))]
        public virtual Terapiak terapiaIDNavigation { get; set; }
        [ForeignKey(nameof(tesztID))]
        [InverseProperty(nameof(Tesztek.eredmenyek))]
        public virtual Tesztek tesztIDNavigation { get; set; }
    }
}
