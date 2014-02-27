using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AventyrligaKontakter.Model
{
    public class Contact
    {
        public int ContactId { get; set; }

        [Required(ErrorMessage = "Ett förnamn måste anges.")]
        [StringLength(50, ErrorMessage = "Max 50 tecken")]
        public string FirstName { get; set; }
       
        [Required(ErrorMessage = "Ett efternamn måste anges.")]
        [StringLength(50, ErrorMessage = "Max 50 tecken")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "En EMAIL måste anges.")]
        [EmailAddress]
        [StringLength(50, ErrorMessage = "Max 50 tecken")]
        public string EmailAdress { get; set; }
    }
}