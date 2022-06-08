using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WPF.Models
{
    [Index(nameof(diagnozisID), Name = "diagnozisID")]
    [Index(nameof(elerhetosegID), Name = "elerhetosegID")]
    [Index(nameof(ovodaID), Name = "ovodaID")]
    public partial class Gyerekek
    {
        public Gyerekek()
        {
            eredmenyek = new HashSet<Eredmenyek>();
        }

        [Key]
        [StringLength(11)]
        public string oktatasi_azonosito { get; set; }
        [Required]
        [StringLength(60)]
        public string gyerek_neve { get; set; }
        [Required]
        [StringLength(30)]
        public string szul_hely { get; set; }
        [Column(TypeName = "date")]
        public DateTime szul_ido { get; set; }
        [Required]
        [StringLength(60)]
        public string anyja_neve { get; set; }
        [Column(TypeName = "int(11)")]
        public int elerhetosegID { get; set; }
        [Column(TypeName = "int(11)")]
        public int? ovodaID { get; set; }
        [Column(TypeName = "int(11)")]
        public int? diagnozisID { get; set; }
        [Column(TypeName = "date")]
        public DateTime? diagnozis_adas_datuma { get; set; }
        [MaxLength(1)]
        public byte[] logopediai_ellatas_kell_e { get; set; }

        [ForeignKey(nameof(diagnozisID))]
        [InverseProperty(nameof(Diagnozisok.gyerekek))]
        public virtual Diagnozisok diagnozisIDNavigation { get; set; }
        [ForeignKey(nameof(elerhetosegID))]
        [InverseProperty(nameof(Gyerek_elerhetosegek.gyerekek))]
        public virtual Gyerek_elerhetosegek elerhetosegIDNavigation { get; set; }
        [ForeignKey(nameof(ovodaID))]
        [InverseProperty(nameof(Ovodak.gyerekek))]
        public virtual Ovodak ovodaIDNavigation { get; set; }
        [InverseProperty("oktatasi_azonositoNavigation")]
        public virtual ICollection<Eredmenyek> eredmenyek { get; set; }
    }
}
