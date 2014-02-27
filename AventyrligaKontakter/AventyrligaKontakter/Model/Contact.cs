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
        public string FirstName { get; set; }
       
        [Required(ErrorMessage = "Ett efternamn måste anges.")]
        public string LastName { get; set; }

        
        public string EmailAdress { get; set; }
    }
}