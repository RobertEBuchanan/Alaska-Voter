using System;
using System.Data;
using System.Data.SqlClient;

namespace Voter.Admin.UI.WinForms
{
    public class VoterDbDataStore
    {
        private string dbConString { get; set; }

        public VoterDbDataStore( string _conn)
        {
            dbConString = _conn;
        }

        public void ImportVoterData(string fileName, DateTime extractDate)
        {
            using (var conn = new SqlConnection(dbConString))
            {
                conn.Open();

                var cmd = new SqlCommand("ImportAndProcessVoterDataFile", conn);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@FileName", fileName));
                cmd.Parameters.Add(new SqlParameter("@FileDate", extractDate));

                cmd.ExecuteScalar();
            }
        }
    }
}
