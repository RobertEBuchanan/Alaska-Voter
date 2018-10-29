﻿using System;
using System.IO;
using System.Windows.Forms;

namespace Voter.Admin.UI.WinForms
{
    public partial class FileImporter : Form
    {
        private VoterDbDataStore data { get; set; }

        public FileImporter(VoterDbDataStore db)
        {
            data = db;

            InitializeComponent();
            dtpFileCreated.MaxDate = DateTime.Today.AddDays(1);
        }

        private void cmdUploadFilePicker_Click(object sender, EventArgs e)
        {
            var picker = new OpenFileDialog()
                {
                    Title = "Pick Data File:"
                };

            if (picker.ShowDialog() == DialogResult.OK)
            {
                txtFilePath.Text = picker.FileName;
                dtpFileCreated.Value = File.GetLastWriteTime(picker.FileName); 
            }
        }

        private void cmdImport_Click(object sender, EventArgs e)
        {
            var extractDate = dtpFileCreated.Value;
            var fileName = txtFilePath.Text;

            data.ImportVoterData(fileName, extractDate);
        }
    }
}
