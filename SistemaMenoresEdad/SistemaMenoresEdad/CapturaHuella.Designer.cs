namespace SistemaMenoresEdad
{
    partial class CapturaHuella
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
            this.pbHuella = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtInstruccion = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtStatusLector = new System.Windows.Forms.TextBox();
            this.txtHuellasRestantes = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pbHuella)).BeginInit();
            this.SuspendLayout();
            // 
            // pbHuella
            // 
            this.pbHuella.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.pbHuella.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pbHuella.Location = new System.Drawing.Point(33, 35);
            this.pbHuella.Name = "pbHuella";
            this.pbHuella.Size = new System.Drawing.Size(250, 300);
            this.pbHuella.TabIndex = 0;
            this.pbHuella.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(343, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Instrucción:";
            // 
            // txtInstruccion
            // 
            this.txtInstruccion.Enabled = false;
            this.txtInstruccion.Location = new System.Drawing.Point(346, 51);
            this.txtInstruccion.Name = "txtInstruccion";
            this.txtInstruccion.Size = new System.Drawing.Size(300, 20);
            this.txtInstruccion.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(343, 103);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(76, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Estado Lector:";
            // 
            // txtStatusLector
            // 
            this.txtStatusLector.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtStatusLector.BackColor = System.Drawing.SystemColors.Window;
            this.txtStatusLector.Enabled = false;
            this.txtStatusLector.Location = new System.Drawing.Point(346, 119);
            this.txtStatusLector.Multiline = true;
            this.txtStatusLector.Name = "txtStatusLector";
            this.txtStatusLector.ReadOnly = true;
            this.txtStatusLector.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtStatusLector.Size = new System.Drawing.Size(300, 216);
            this.txtStatusLector.TabIndex = 5;
            // 
            // txtHuellasRestantes
            // 
            this.txtHuellasRestantes.AutoSize = true;
            this.txtHuellasRestantes.Location = new System.Drawing.Point(30, 348);
            this.txtHuellasRestantes.Name = "txtHuellasRestantes";
            this.txtHuellasRestantes.Size = new System.Drawing.Size(173, 13);
            this.txtHuellasRestantes.TabIndex = 6;
            this.txtHuellasRestantes.Text = "[Estado Captura de Huella Dactilar]";
            // 
            // CapturaHuella
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(680, 411);
            this.Controls.Add(this.txtHuellasRestantes);
            this.Controls.Add(this.txtStatusLector);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtInstruccion);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pbHuella);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "CapturaHuella";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Enrolamiento Huella Dactilar";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CapturarHuella_FormClosed);
            this.Load += new System.EventHandler(this.CapturarHuella_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pbHuella)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbHuella;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtInstruccion;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtStatusLector;
        private System.Windows.Forms.Label txtHuellasRestantes;
    }
}