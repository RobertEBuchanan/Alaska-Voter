namespace Voter.Admin.UI.WinForms
{
    partial class FileImporter
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cmdUploadFilePicker = new System.Windows.Forms.Button();
            this.txtFilePath = new System.Windows.Forms.TextBox();
            this.cmdImport = new System.Windows.Forms.Button();
            this.dtpFileCreated = new System.Windows.Forms.DateTimePicker();
            this.lblExtractFile = new System.Windows.Forms.Label();
            this.lblExtractDate = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // cmdUploadFilePicker
            // 
            this.cmdUploadFilePicker.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdUploadFilePicker.Location = new System.Drawing.Point(534, 26);
            this.cmdUploadFilePicker.Name = "cmdUploadFilePicker";
            this.cmdUploadFilePicker.Size = new System.Drawing.Size(75, 23);
            this.cmdUploadFilePicker.TabIndex = 0;
            this.cmdUploadFilePicker.Text = "Browse...";
            this.cmdUploadFilePicker.UseVisualStyleBackColor = true;
            this.cmdUploadFilePicker.Click += new System.EventHandler(this.cmdUploadFilePicker_Click);
            // 
            // txtFilePath
            // 
            this.txtFilePath.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtFilePath.Location = new System.Drawing.Point(84, 28);
            this.txtFilePath.Name = "txtFilePath";
            this.txtFilePath.Size = new System.Drawing.Size(444, 20);
            this.txtFilePath.TabIndex = 1;
            // 
            // cmdImport
            // 
            this.cmdImport.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdImport.BackColor = System.Drawing.Color.Red;
            this.cmdImport.ForeColor = System.Drawing.Color.Blue;
            this.cmdImport.Location = new System.Drawing.Point(216, 93);
            this.cmdImport.Name = "cmdImport";
            this.cmdImport.Size = new System.Drawing.Size(215, 34);
            this.cmdImport.TabIndex = 2;
            this.cmdImport.Text = "Import";
            this.cmdImport.UseVisualStyleBackColor = false;
            this.cmdImport.Click += new System.EventHandler(this.cmdImport_Click);
            // 
            // dtpFileCreated
            // 
            this.dtpFileCreated.Location = new System.Drawing.Point(84, 55);
            this.dtpFileCreated.Name = "dtpFileCreated";
            this.dtpFileCreated.Size = new System.Drawing.Size(166, 20);
            this.dtpFileCreated.TabIndex = 3;
            // 
            // lblExtractFile
            // 
            this.lblExtractFile.AutoSize = true;
            this.lblExtractFile.Location = new System.Drawing.Point(19, 31);
            this.lblExtractFile.Name = "lblExtractFile";
            this.lblExtractFile.Size = new System.Drawing.Size(59, 13);
            this.lblExtractFile.TabIndex = 4;
            this.lblExtractFile.Text = "Extract File";
            // 
            // lblExtractDate
            // 
            this.lblExtractDate.AutoSize = true;
            this.lblExtractDate.Location = new System.Drawing.Point(12, 55);
            this.lblExtractDate.Name = "lblExtractDate";
            this.lblExtractDate.Size = new System.Drawing.Size(66, 13);
            this.lblExtractDate.TabIndex = 5;
            this.lblExtractDate.Text = "Extract Date";
            this.lblExtractDate.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // FileImporter
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(635, 128);
            this.Controls.Add(this.lblExtractDate);
            this.Controls.Add(this.lblExtractFile);
            this.Controls.Add(this.dtpFileCreated);
            this.Controls.Add(this.cmdImport);
            this.Controls.Add(this.txtFilePath);
            this.Controls.Add(this.cmdUploadFilePicker);
            this.Name = "FileImporter";
            this.Text = "File Importer";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cmdUploadFilePicker;
        private System.Windows.Forms.TextBox txtFilePath;
        private System.Windows.Forms.Button cmdImport;
        private System.Windows.Forms.DateTimePicker dtpFileCreated;
        private System.Windows.Forms.Label lblExtractFile;
        private System.Windows.Forms.Label lblExtractDate;
    }
}

