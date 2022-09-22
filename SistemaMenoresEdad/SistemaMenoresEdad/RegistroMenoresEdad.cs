using SistemaMenoresEdad.Capa_Modelo;
using SistemaMenoresEdad.CapaControlador;
using SistemaMenoresEdad.CapaModelo;
using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace SistemaMenoresEdad
{
    public delegate void Function(); //para trajar con hilos en segundo plano

    public partial class RegistroMenoresEdad : Form
    {
        
        private DPFP.Template plantilla; /*variable que contiene la plantilla de la huella dactilar*/
        byte[] Bitmaphuella1 = null;     /*Variables de arreglos de byte que contiene la imagen de la huella dactilar*/
        byte[] Bitmaphuella2 = null;
        byte[] Bitmaphuella3 = null;
        byte[] Bitmaphuella4 = null;
        byte[] Bitmaphuella5 = null;
        byte[] Bitmaphuella6 = null;
        byte[] Bitmaphuella7 = null;
        byte[] Bitmaphuella8 = null;
        byte[] Bitmaphuella9 = null;
        byte[] Bitmaphuella10 = null;

        public RegistroMenoresEdad()
        {
            InitializeComponent();
        }

        private void label5_Click(object sender, EventArgs e)
        {
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
        }

        private void btnRegistrarPadres_Click(object sender, EventArgs e)
        {
            RegistroPadres registroPadres = new RegistroPadres();
            registroPadres.Show();
            //this.Hide();
        }

        private void btnAsignarPadres_Click(object sender, EventArgs e)
        {
            AsignarPadres asignarPadresAMenores = new AsignarPadres();
            asignarPadresAMenores.Show();
            //this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void RegistroMenoresEdad_Load(object sender, EventArgs e)
        {
            RegistroMenorEdad registro = new RegistroMenorEdad();
            registro.llenarCombobox("idGenero", "nombre", "Genero", cbxGenero);
            registro.llenarCombobox("idPais", "nombre", "PaisNacimiento", cbxPaisNac);
            
            //colocar fecha en el txt
            setearFecha();

            //llamada del metodo refrescar
            RefreshTabla(dgvDatosBiograficos);

        }

        
        private void RefreshTabla(DataGridView datosBiograficos)
        {
            RegistroMenorEdad registro = new RegistroMenorEdad();
            datosBiograficos.DataSource = registro.listarDatosBiograficos(); //se asigna la lista devuelta a la datagrid view
        }


        /*funcion para picturebox y extraer imagen
        private byte[] BitmapPictureBox(PictureBox pictureBox)
        {
            if (pictureBox.Image != null)
            {
                
                Bitmap imagen = new Bitmap(pictureBox.Image);


                byte[] datosByte = default(byte[]);

                using (System.IO.MemoryStream sampleStream = new System.IO.MemoryStream())
                {
                    //save to stream.
                    imagen.Save(sampleStream, System.Drawing.Imaging.ImageFormat.Bmp);

                    //the byte array
                    datosByte = sampleStream.ToArray();
                }
                return datosByte;
            }
            else
            {
                return null;
            }
        }*/

        /*public static byte[] ImageToByteArray(PictureBox pictureBox)
        {
            if (pictureBox.Image != null)
            {
                using (var stream = new MemoryStream())
                {
                    pictureBox.Image.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    return stream.ToArray();
                }
            }
            else
            {
                return null;
            }
        }*/

        /*Convierte de imagen a arreglo de Bytes*/
        public static byte[] ImageToByteArray(Image imagen)
        {
            
            using (var stream = new MemoryStream())
            {
                imagen.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                return stream.ToArray();
            }
        }


        //comienzo generacion de plantilla
        private void plantillaHuella(DPFP.Template template)   //se cargará una plantilla
        {
            this.Invoke(new Function(delegate ()
            {
                plantilla = template;

                if (plantilla != null)
                {
                    /*huellaDactilar = new byte [plantilla.Size];
                      huellaDactilar = plantilla.Bytes;*/

                    /*Conexion connect = new Conexion();
                    connect.insertarPrueba(plantilla.Bytes);*/


                    MessageBox.Show("Enrolamiento de este dedo finalizado");
                }
                else
                {
                    MessageBox.Show("La plantilla de la huella dactilar no es valida");
                }


            }));
        }

        /*Metodo para realizar la captura de las 10 huellas datilares, solo es necesario parametrizarlo*/
        private void registarHuellaMenor(TextBox CUI, PictureBox pictureBox, byte[] bitmapHuella)
        {
            if (CUI.Text != "") //si el txt de cui esta vacio no abrir la forma
            {
                /*Verificando si no existe en la BD la huella registrada por medio de sp en BD*/
                RegistroMenorEdad registroHuellas = new RegistroMenorEdad();
                int opcion = registroHuellas.verificarHuellaIngresada(CUI, pictureBox);
                /*----------------------------------------------------------------------------------*/

                if (opcion == 0) /*la huella no existe*/
                {
                    Enrolamiento enrolamiento = new Enrolamiento();
                    enrolamiento.Plantilla += this.plantillaHuella;//el metodo de esta clase plantilla
                    enrolamiento.FotoHuellaMenor = pictureBox; //colocando la huella en el picturebox
                    enrolamiento.ShowDialog();

                    if (pictureBox.Image != null)
                    {
                        bitmapHuella = ImageToByteArray(pictureBox.Image);
                    }


                    if (bitmapHuella != null)
                    {
                        registroHuellas.insertarHuellaMenorEdad(CUI, pictureBox, plantilla.Bytes, bitmapHuella);
                    }
                }
                else/*la huella ya esta registrada*/
                {
                    //MessageBox.Show("La huella ya ha sido registrada en la base de datos anteriomente");
                    MessageBox.Show("La huella ya ha sido registrada en la base de datos\nNo es posible registrarla de nuevo", "Huella previamente ingresada", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                //MessageBox.Show("Para registrar una huella dactilar es necesario un número de CUI");
                MessageBox.Show("Para registrar una huella dactilar es necesario \nun número de CUI", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }


        private void limpiarPictureBox(PictureBox pictureBox)
        {
            pictureBox.Image = null;
        }


        private void btnRemove_Click(object sender, EventArgs e)
        {
            limpiarPictureBox(pictureBoxDedo1);
        }

        /// <summary>
        /// ////////////////////////////////////////////////////
        /// </summary>
        //prueba de lectura de huella y colocarla a un picture 



       

        private void pictureBoxDedo1_Paint(object sender, PaintEventArgs e)
        {

        }

        

        private void btnPruebaTraerDatos_Click(object sender, EventArgs e)
        {
            Conexion conexion = new Conexion();
            conexion.retornarBitmapaHuella(1, pictureBoxDedo1);
            conexion.retornarBitmapaHuella(2, pictureBoxDedo2);
            //conexion.retornarBitmapaHuella(3, pictureBoxDedo8);
        }

        private void cbxDeptoNac_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (cbxDeptoNac.SelectedValue.ToString() != null)
            {
                int id = (int)cbxDeptoNac.SelectedValue;

                txtDeptoNac.Text = id.ToString();


                RegistroMenorEdad registro = new RegistroMenorEdad();
                registro.llenarMunicipio(cbxMunicipioNac, id);
            }

        }

        private void cbxMunicipioNac_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxMunicipioNac.SelectedValue.ToString() != null)
            {
                int id = (int)cbxMunicipioNac.SelectedValue;

                txtMunicipioNac.Text = id.ToString();
            }
        }

        private void setearFecha()
        {
            string date = dtpFechaNac.Value.ToString("yyyy-MM-dd");
            txtFechaNac.Text = date.ToString();
        }

        private void dtpFechaNac_ValueChanged(object sender, EventArgs e)
        {
            setearFecha();
        }

        private void cbxGenero_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxGenero.SelectedValue.ToString() != null)
            {
                int id = (int)cbxGenero.SelectedValue;

                txtGenero.Text = id.ToString();

            }
        }

        private void cbxPaisNac_SelectedIndexChanged(object sender, EventArgs e)
        {
            //select idDepartamento, nombre from DepartamentoNacimiento where idPais = 1
            if (cbxPaisNac.SelectedValue.ToString() != null)
            {
                int id = (int)cbxPaisNac.SelectedValue;

                txtPaisNac.Text = id.ToString();

                /*ClaseControlador controlador = new ClaseControlador();
                controlador.limpiarCombobox(cbxDeptoNac);*/

                RegistroMenorEdad registro = new RegistroMenorEdad();
                registro.llenarDepartamento(cbxDeptoNac, id);
            }
        }

        public void bloquearCampos()
        {
            txtPrimerNombre.Enabled = false;
            txtSegundoNombre.Enabled = false;
            txtTercerMasNombres.Enabled = false;
            txtPrimerApellido.Enabled = false;
            txtSegundoApellido.Enabled = false;
            dtpFechaNac.Enabled = false;
            txtFechaNac.Enabled = false;
            cbxGenero.Enabled = false;
            txtGenero.Enabled = false;
            cbxPaisNac.Enabled = false;
            txtPaisNac.Enabled = false;
            cbxDeptoNac.Enabled = false;
            txtDeptoNac.Enabled = false;
            cbxMunicipioNac.Enabled = false;
            txtMunicipioNac.Enabled = false;

            /*Tambien es necesario bloquear el boton de guardar*/
            btnGuardarDatosBiograficos.Enabled = false;
        }


        private void btnGuardarDatosBiograficos_Click(object sender, EventArgs e)
        {
            //VariablesGlobales variable = new VariablesGlobales();

            //RegistroMenorEdad registrarMenor = new RegistroMenorEdad();
            //variable = registrarMenor.insertarDatosBiograficos(txtPrimerNombre, txtSegundoNombre, txtTercerMasNombres, txtPrimerApellido,txtSegundoApellido, txtFechaNac, txtGenero, txtPaisNac, txtDeptoNac, txtMunicipioNac, "prueba de foto");

            //txtCuiMenor.Text = variable.CuiGenerado;
            //MessageBox.Show("El cui es: " + variable.CuiGenerado);

            //campos vacios que no inserte
            if (txtPrimerNombre.TextLength == 0 || txtSegundoNombre.TextLength == 0 ||
                txtPrimerApellido.TextLength == 0 || txtSegundoApellido.TextLength == 0)
            {
                MessageBox.Show("Debe llenar todos los campos para realizar \nel Registro del Menor", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                RegistroMenorEdad registrarMenor = new RegistroMenorEdad();
                registrarMenor.insertarDatosBiograficos(txtCuiMenor, txtPrimerNombre, txtSegundoNombre, txtTercerMasNombres, txtPrimerApellido, txtSegundoApellido, txtFechaNac, txtGenero, txtPaisNac, txtDeptoNac, txtMunicipioNac, "prueba de foto");

                bloquearCampos();
                RefreshTabla(dgvDatosBiograficos);
            }
        }

        /*captura de huellas (Dedos)*/
        private void btnAdd_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo1, Bitmaphuella1);
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            //if (txtCuiMenor.Text != "") //si el txt de cui esta vacio no abrir la forma
            //{
            //    /*Verificando si no existe en la BD la huella registrada por medio de sp en BD*/
            //    RegistroMenorEdad registroHuellas = new RegistroMenorEdad();
            //    int opcion = registroHuellas.verificarHuellaIngresada(txtCuiMenor, pictureBoxDedo2);
            //    /*----------------------------------------------------------------------------------*/

            //    if (opcion == 0) /*la huella no existe*/
            //    {
            //        Enrolamiento enrolamiento = new Enrolamiento();
            //        enrolamiento.Plantilla += this.plantillaHuella;//el metodo de esta clase plantilla
            //        enrolamiento.FotoHuellaMenor = pictureBoxDedo2; //colocando la huella en el picturebox
            //        enrolamiento.ShowDialog();

            //        Bitmaphuella2 = ImageToByteArray(pictureBoxDedo2.Image);

            //        if (Bitmaphuella2 != null)
            //        {
            //            registroHuellas.insertarHuellaMenorEdad(txtCuiMenor, pictureBoxDedo2, plantilla.Bytes, Bitmaphuella2);
            //        }
            //    }
            //    else/*la huella ya esta registrada*/
            //    {
            //        //MessageBox.Show("La huella ya ha sido registrada en la base de datos anteriomente");
            //        MessageBox.Show("La huella ya ha sido registrada en la base de datos\nNo es posible registrarla de nuevo", "Huella previamente ingresada", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    }
            //}
            //else
            //{
            //    //MessageBox.Show("Para registrar una huella dactilar es necesario un número de CUI");
            //    MessageBox.Show("Para registrar una huella dactilar es necesario \nun número de CUI", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            //}

            registarHuellaMenor(txtCuiMenor, pictureBoxDedo2, Bitmaphuella2);
        }
        
        private void button5_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo3, Bitmaphuella3);
        }
        private void button8_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo4, Bitmaphuella4);
        }

        private void button11_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo5, Bitmaphuella5);
        } 
        private void button14_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo6, Bitmaphuella6);
        }

        private void button17_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo7, Bitmaphuella7);
        }

        private void button20_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo8, Bitmaphuella8);
        }

        private void button23_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo9, Bitmaphuella9);
        }

        private void button26_Click(object sender, EventArgs e)
        {
            registarHuellaMenor(txtCuiMenor, pictureBoxDedo10, Bitmaphuella10);
        }
    }
}
