
using System.ComponentModel.DataAnnotations;

namespace RichardrealiyamaSoftwareSolutions.Models
{
    public class Comment
    {
        [Required]
        public string Name { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [StringLength(500)]
        public string Notes { get; set; }
    }
}
