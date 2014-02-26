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

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IEnumerable <Contact> ListView1_GetData()
        {
            return Service.GetContacts();
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
    }
}