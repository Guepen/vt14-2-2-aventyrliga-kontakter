using AventyrligaKontakter.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AventyrligaKontakter
{
    public partial class Default : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Success"] as bool? == true)
            {
                Message.Visible = true;
                Session.Remove("Success");
            }

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IEnumerable <Contact> ListView1_GetData(int maximumRows, int startRowIndex, out int totalRowcount)
        {
            return Service.GetContactsPageWise(maximumRows, startRowIndex, out totalRowcount);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_UpdateItem(int ContactID)
        {
            var contact = Service.GetContact(ContactID);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (contact == null)
            {
                // The item wasn't found
                ModelState.AddModelError(String.Empty,
                    String.Format("Kontakten med kontaktnummer {0} hittades inte", ContactID));
                return;
            }
            if (TryUpdateModel(contact))
            {
                Service.SaveContact(contact);
            }
        }

        public void ListView1_InsertItem(Contact contact)
        {
            try
            {
                Service.SaveContact(contact);
                Response.Redirect("~/");
            }

            catch
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade vid försök till att lägga till kontakt");
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_DeleteItem(int contactID)
        {
            try
            {
                Service.DeleteContact(contactID);
            }

            catch
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade vid försök till att radera kontakt");
            }
        }
    }
}