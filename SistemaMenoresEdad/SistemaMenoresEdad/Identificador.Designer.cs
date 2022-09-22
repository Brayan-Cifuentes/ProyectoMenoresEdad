
namespace SistemaMenoresEdad
{
    partial class Identificador
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
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtGetCuiMenor = new System.Windows.Forms.TextBox();
            this.txtGetIdDedo = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(75, 60);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Identificar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(46, 144);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "CUI MENOR:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(46, 179);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "ID Dedo:";
            // 
            // txtGetCuiMenor
            // 
            this.txtGetCuiMenor.Location = new System.Drawing.Point(162, 144);
            this.txtGetCuiMenor.Name = "txtGetCuiMenor";
            this.txtGetCuiMenor.Size = new System.Drawing.Size(167, 20);
            this.txtGetCuiMenor.TabIndex = 3;
            // 
            // txtGetIdDedo
            // 
            this.txtGetIdDedo.Location = new System.Drawing.Point(162, 176);
            this.txtGetIdDedo.Name = "txtGetIdDedo";
            this.txtGetIdDedo.Size = new System.Drawing.Size(100, 20);
            this.txtGetIdDedo.TabIndex = 4;
            // 
            // Identificador
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(451, 261);
            this.Controls.Add(this.txtGetIdDedo);
            this.Controls.Add(this.txtGetCuiMenor);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button1);
            this.Name = "Identificador";
            this.Text = "Identificador";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtGetCuiMenor;
        private System.Windows.Forms.TextBox txtGetIdDedo;
    }
}