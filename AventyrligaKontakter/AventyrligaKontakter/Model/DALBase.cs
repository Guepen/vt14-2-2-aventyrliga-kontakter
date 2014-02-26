using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace AventyrligaKontakter.Model.ContactDal
{
    public abstract class DALBase
    {
        private static string _connectionString;

        static DALBase()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["AdventureWorksConnectionString"].ConnectionString;
        }

        protected SqlConnection createConnection()
        {
            try
            {
                return new SqlConnection(_connectionString);
            }

            catch
            {
                throw new ApplicationException("Ett oväntat fel inträffade");
            }
        }
    }
}