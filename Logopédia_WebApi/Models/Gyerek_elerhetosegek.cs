using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WebApi.Models
{
    public partial class Gyerek_elerhetosegek
    {
        public Gyerek_elerhetosegek()
        {
            gyerekek = new HashSet<Gyerekek>();
        }

        [Key]
        [Column(TypeName = "int(11)")]
        public int elerhetosegID { get; set; }
        [Required]
        [StringLength(60)]
        public string gondviselő_neve { get; set; }
        [Required]
        [StringLength(17)]
        public string gondviselo_telefonszam { get; set; }
        [Required]
        [StringLength(50)]
        public string gondviselo_email { get; set; }
        [StringLength(100)]
        public string gondviselo_lakcim { get; set; }

        [InverseProperty("elerhetosegIDNavigation")]
        public virtual ICollection<Gyerekek> gyerekek { get; set; }
    }
}
