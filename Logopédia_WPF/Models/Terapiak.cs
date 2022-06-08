using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WPF.Models
{
    [Index(nameof(ellato_szakemberID), Name = "ellato_szakemberID")]
    public partial class Terapiak
    {
        public Terapiak()
        {
            eredmenyek = new HashSet<Eredmenyek>();
        }

        [Key]
        [Column(TypeName = "int(11)")]
        public int terapiaID { get; set; }
        [Required]
        [MaxLength(1)]
        public byte[] szukseges_e { get; set; }
        [Column(TypeName = "int(11)")]
        public int? ellato_szakemberID { get; set; }
        [Column(TypeName = "int(11)")]
        public int? terapia_taneve { get; set; }
        [StringLength(50)]
        public string ellatas_helye { get; set; }
        [StringLength(10)]
        public string ellatas_napja { get; set; }
        [Column(TypeName = "int(11)")]
        public int? ellatas_idopontja { get; set; }

        [ForeignKey(nameof(ellato_szakemberID))]
        [InverseProperty(nameof(Szakemberek.terapiak))]
        public virtual Szakemberek ellato_szakember { get; set; }
        [InverseProperty("terapiaIDNavigation")]
        public virtual ICollection<Eredmenyek> eredmenyek { get; set; }
    }
}
