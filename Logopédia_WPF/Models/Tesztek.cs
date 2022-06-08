using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WPF.Models
{
    public partial class Tesztek
    {
        public Tesztek()
        {
            eredmenyek = new HashSet<Eredmenyek>();
        }

        [Key]
        [Column(TypeName = "int(11)")]
        public int tesztID { get; set; }
        [Required]
        [StringLength(50)]
        public string tesznev { get; set; }
        [Required]
        [StringLength(30)]
        public string tipus { get; set; }
        [Required]
        [MaxLength(1)]
        public byte[] kotelezo { get; set; }
        [Column(TypeName = "int(11)")]
        public int eletkori_kitoltes_kezdete_honapban { get; set; }
        [Column(TypeName = "int(11)")]
        public int eletkori_kitoltes_vege_honapban { get; set; }

        [InverseProperty("tesztIDNavigation")]
        public virtual ICollection<Eredmenyek> eredmenyek { get; set; }
    }
}
