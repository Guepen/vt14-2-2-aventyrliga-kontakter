using AventyrligaKontakter.Model.ContactDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AventyrligaKontakter.Model
{
    public class Service
    {
        private ContactDAL _contactDAL;

        private ContactDAL ContactDAL
        {
            get { return _contactDAL ?? (_contactDAL = new ContactDAL()); }
        }

        public void DeleteContact(Contact contact)
        {
            throw new NotImplementedException();
        }

        public void DeleteContact(int contactId)
        {
            throw new NotImplementedException();
        }

        public Contact GetContact(int contactId)
        {
            return ContactDAL.GetContact(contactId);
        }

        public IEnumerable<Contact> GetContacts()
        {
            return ContactDAL.GetContacts();
        }

        public IEnumerable<Contact> GetContactsPageWise(int maximumRows, int startRowIndex, out int totalRowCount)
        {
             throw new NotImplementedException();
        }

        public void SaveContact(Contact contact)
        {
            if (contact.ContactId == 0)
            {
                ContactDAL.InsertContact(contact);
            }

            else
            {
                ContactDAL.UpdateContact(contact);
            }
        }
    }
}