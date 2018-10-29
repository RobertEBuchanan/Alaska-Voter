using System;
using System.Configuration;
using System.Windows.Forms;

namespace Voter.Admin.UI.WinForms
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(GetStartupForm());
        }

        private static Form GetStartupForm()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["VoterDb"].ConnectionString;
            var db = new VoterDbDataStore(connectionString);
            var Importer = new FileImporter(db);

            return Importer;
        }
    }
}
