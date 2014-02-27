using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;


namespace AventyrligaKontakter.Model.ContactDal
{
    public class ContactDAL : DALBase
    {
        public IEnumerable<Contact> GetContacts()
        {
            using (var conn = createConnection())
            {
                try
                {
                    var contacts = new List<Contact>(100);

                    var cmd = new SqlCommand("Person.uspGetContacts", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        //tar reda på vilket index kolumnerna har
                        var contactIdIndex = reader.GetOrdinal("ContactID");
                        var firstNameIndex = reader.GetOrdinal("FirstName");
                        var lastNameIndex = reader.GetOrdinal("LastName");
                        var emailIndex = reader.GetOrdinal("EmailAddress");

                        while (reader.Read())
                        {
                            contacts.Add(new Contact
                            {
                                ContactId = reader.GetInt32(contactIdIndex),
                                FirstName = reader.GetString(firstNameIndex),
                                LastName = reader.GetString(lastNameIndex),
                                EmailAdress = reader.GetString(emailIndex)


                            });
                        }
                    }

                    // avallokerar minne som inte används
                    contacts.TrimExcess();

                    return contacts;
                }

                catch
                {
                    throw new ApplicationException("Det gick inte att hämta kontaktuppgifter från databasen");
                }
            }
        }

        public Contact GetContact(int contactID)
        {
            using (SqlConnection conn = createConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Person.uspGetContact", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ContactID", contactID);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int contactIdIndex = reader.GetOrdinal("ContactID");
                            int firstNameIndex = reader.GetOrdinal("FirstName");
                            int lastNameIndex = reader.GetOrdinal("LastName");
                            int emailIndex = reader.GetOrdinal("EmailAddress");

                            return new Contact
                            {
                                ContactId = reader.GetInt32(contactIdIndex),
                                FirstName = reader.GetString(firstNameIndex),
                                LastName = reader.GetString(lastNameIndex),
                                EmailAdress = reader.GetString(emailIndex)
                            };
                        }
                    }
                    return null;
                }
                catch
                {
                    throw new ApplicationException("hoppsan!");
                }
            }
        }

        public void InsertContact(Contact contact)
        {
            using (SqlConnection conn = createConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Person.uspAddContact", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 30).Value = contact.FirstName;
                    cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 30).Value = contact.LastName;
                    cmd.Parameters.Add("@EmailAddress", SqlDbType.VarChar, 6).Value = contact.EmailAdress;

                    //hämtar ut PK
                    cmd.Parameters.Add(@"ContactID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

                    conn.Open();

                    cmd.ExecuteNonQuery();

                    contact.ContactId = (int)cmd.Parameters["ContactID"].Value;
                }
                catch
                {
                    throw new ApplicationException("Hoppsan!");
                }
            }
        }
        public void UpdateContact(Contact contact)
        {
            using (SqlConnection conn = createConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Person.uspUpdateContact", conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 30).Value = contact.FirstName;
                    cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 30).Value = contact.LastName;
                    cmd.Parameters.Add("@EmailAddress", SqlDbType.VarChar, 6).Value = contact.EmailAdress;
                    cmd.Parameters.Add(@"ContactID", SqlDbType.Int, 4).Value = contact.ContactId;

                    conn.Open();
                    cmd.ExecuteNonQuery();


                }

                catch
                {
                    throw;
                }
            }
        }

        public void DeleteContact(int contactID)
        {
            using (SqlConnection conn = createConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("Person.uspRemoveContact", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(@"ContactID", SqlDbType.Int, 4).Value = contactID;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                catch
                {
                    throw new ArgumentException("Det gick inte att ta bort kontakten");
                }


            }
        }
    }
}