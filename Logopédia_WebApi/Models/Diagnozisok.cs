using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace Logopédia_WebApi.Models
{
    public partial class Diagnozisok
    {
        public Diagnozisok()
        {
            gyerekek = new HashSet<Gyerekek>();
        }

        [Key]
        [Column(TypeName = "int(11)")]
        public int diagnozisID { get; set; }
        [Required]
        [StringLength(5)]
        public string tipusa { get; set; }
        public float? diagnozis_kodja { get; set; }
        [StringLength(100)]
        public string diagnozis_megnevezese { get; set; }
        [JsonIgnore]
        [InverseProperty("diagnozisIDNavigation")]
        public virtual ICollection<Gyerekek> gyerekek { get; set; }
    }
}
