using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WPF.Models
{
    public partial class Ovodak
    {
        public Ovodak()
        {
            gyerekek = new HashSet<Gyerekek>();
        }

        [Key]
        [Column(TypeName = "int(11)")]
        public int ovodaID { get; set; }
        [Required]
        [StringLength(100)]
        public string ovoda_neve { get; set; }
        [Required]
        [StringLength(100)]
        public string ovoda_cime { get; set; }
        [Required]
        [StringLength(17)]
        public string ovoda_telszama { get; set; }
        [Required]
        [StringLength(50)]
        public string ovoda_email { get; set; }
        [Required]
        [StringLength(60)]
        public string ovoda_vezeto_neve { get; set; }
        [StringLength(60)]
        public string fenntarto { get; set; }

        [InverseProperty("ovodaIDNavigation")]
        public virtual ICollection<Gyerekek> gyerekek { get; set; }
    }
}
