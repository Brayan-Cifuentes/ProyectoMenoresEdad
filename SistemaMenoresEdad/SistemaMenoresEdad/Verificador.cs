using DPFP;
using DPFP.Capture;
using DPFP.Processing;
using SistemaMenoresEdad.CapaModelo;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using System.Diagnostics;

namespace SistemaMenoresEdad
{
    public partial class Verificador : Form, DPFP.Capture.EventHandler
    {
        /*variable para capturar una muestra de huella dactilar de un lector*/
        private Capture capturar;
        private Template plantillaHuellaDB;
        private DPFP.Verification.Verification verificadorHuella;

        private Boolean estadoVerificacion = true;
        

        public Verificador()
        {
            InitializeComponent();
            MessageBox.Show("Para realizar la identificación\nse debe ingresar una huella dactilar", "Dato Importante", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            datosIncialesaMostrar();
        }

        protected virtual void Init()
        {
            try
            {
                //crear una operacion de captura
                capturar = new Capture();

                if (capturar != null)
                {
                    capturar.EventHandler = this; /*capturar*/
                }
                else
                {
                    setInstruccion("No se puede iniciar la operación de captura");
                }
            }
            catch
            {
                MessageBox.Show("No se puede iniciar la operación de captura", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            verificadorHuella = new DPFP.Verification.Verification();

            /*Tasa de verificacion*/
            //False Accept Rate(FAR)
            //actualizarEstado(0); //Por defecto a cero
        }



        protected void start()
        {

            if (capturar != null)   /*si no esta referenciada la variable a la instancia anterior no entra*/
            {
                try
                {
                    capturar.StartCapture();
                    setInstruccion("Utilizar el lector biométrico, Escanear la huella dactilar.");
                }
                catch
                {
                    setInstruccion("No es posible iniciar la captura");
                }
            }
        }

        protected void stop()
        {
            if (capturar != null)
            {
                try
                {
                    capturar.StopCapture();
                }
                catch
                {
                    setInstruccion("No se terminó de capturar");
                }
            }
        }

        private void datosIncialesaMostrar()
        {
            gbDatosBiograficos.Visible = false;
            gbHuellasDactilares.Visible = false;
            gbFotoMenor.Visible = false;
        }

        private void mostrarDatos()
        {
            this.Invoke(new Function(delegate ()
            {
                gbDatosBiograficos.Visible = true;
                gbHuellasDactilares.Visible = true;
                gbFotoMenor.Visible = true;
            }));
        }

        private void bloquearCampos()
        {
            this.Invoke(new Function(delegate ()
            {
                txtCuiMenor.Enabled = false;
                txtPrimerNombre.Enabled = false;
                txtSegundoNombre.Enabled = false;
                txtTercerMasNombres.Enabled = false;
                txtPrimerApellido.Enabled = false;
                txtSegundoApellido.Enabled = false;
                txtFechaNac.Enabled = false;
                txtGenero.Enabled = false;
                txtPaisNac.Enabled = false;
                txtDeptoNac.Enabled = false;
                txtMunicipioNac.Enabled = false;
                pbFotografiaMenor.Enabled = false;
            }));
        }

        /*-----------------------------------------------------------------------------------------------------------*/
        protected FeatureSet extraerCaracteristicas(Sample huella, DataPurpose objetivo)
        {
            FeatureExtraction extraccion = new FeatureExtraction(); // se crea un extractor de caracteristicas
            //define el valor que provee el feedback con respecto a la muestra de la huella al realizar su captura - resultado pag 63 manual
            CaptureFeedback feedback = CaptureFeedback.None;
            //representa a un conjunto de caracteristicas de las huellas dactilares
            FeatureSet caracteristicas = new FeatureSet();

            extraccion.CreateFeatureSet(huella, objetivo, ref feedback, ref caracteristicas);  //se estraen las caracteristicas y se evaluan

            if (feedback == CaptureFeedback.Good)
            {
                return caracteristicas;  //devuelve las caracteristicas si se evaluaron de forma correcta
            }
            else
            {
                return null;
            }

        }

        /*------------------------------------*/
        /*Proceso de verificacion de la huella*/
        /*------------------------------------*/
        protected void procesoHuella(DPFP.Sample Sample)
        {
            /*Procesar la muestra y crear un set de caracteristicas para realiza la verificacion*/
            DPFP.FeatureSet caracteristicas = extraerCaracteristicas(Sample, DPFP.Processing.DataPurpose.Verification);

            /*verificar la cualidad de la muestra y comenzar la verificacion si existen caracteristicas*/
            if (caracteristicas != null)
            {
                //Compara las caracteristicas con la huella
                DPFP.Verification.Verification.Result result = new DPFP.Verification.Verification.Result();

                DPFP.Template Plantilla = new DPFP.Template();
                Stream stream;

                /*traer una lista de las huellas de la BD*/
                IdentificacionMenorEdad identificacion = new IdentificacionMenorEdad();
                //traendo la lista hacia aca
                List<DatosBiometricosMenor> Datosbiometricos = identificacion.DatosBiometricos(); //se crea una lista con las huellas traidas de la BD

                /*objeto para medir el tiempo*/
                Stopwatch timerIdentificacion = new Stopwatch();
                timerIdentificacion.Start();

                foreach (var dato in Datosbiometricos)
                {
                    if (dato.Template != null)
                    {

                        stream = new MemoryStream(dato.Template);      //realizando la conversion de la huella de BD (Bite[])
                        plantillaHuellaDB = new DPFP.Template(stream); //a tipo template para realizar la comparacion

                        verificadorHuella.Verify(caracteristicas, plantillaHuellaDB, ref result); //se realiza la verificacion para determinar si coincide
                        actualizarEstado(result.FARAchieved); //despliega el resultado de la verificacion                        
                        //variable result tiene el resultado de la comparacion

                        if (result.Verified) //si da verified quiere decir que hizo match la huella ingresada con la de la BD
                        {
                            timerIdentificacion.Stop();
                            //MessageBox.Show($"Time elapsed: {0}" + timerIdentificacion.Elapsed.ToString("hh\\:mm\\:ss\\.fff"));

                            estadoIdentificacion("HUELLA ENCONTRADA EN LA BD");

                            /*seteando el tiempo en el txt*/
                            tiempoidentificacion(timerIdentificacion.Elapsed.ToString("hh\\:mm\\:ss\\.fff"));
                            //desplegar los datos
                            //MessageBox.Show("HUELLA ENCONTRADA \nCUI:" + dato.CuiMenor + " ID_Dedo:" + dato.IdDedoMano);

                            MessageBox.Show("HUELLA ENCONTRADA \nCUI: " + dato.CuiMenor, "Identidad Confirmada", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);

                            datosIdentidadBiograficos(dato.CuiMenor);

                            limpiarPictureHuellas(); //para evitar que queden picturebox sin limpiar y queden huellas anteriores

                            datosBiometricosBitmapHuellas(dato.CuiMenor);

                            IdentificacionMenorEdad identidad = new IdentificacionMenorEdad();
                            //identidad.insertarTiempoHuella(dato.CuiMenor, dato.IdDedoMano.ToString(), timerIdentificacion.Elapsed.ToString("hh\\:mm\\:ss\\.fff"));

                            timerIdentificacion.Reset();

                            estadoVerificacion = true; //se encontro
                            limpiarEstado();
                            break;
                        }
                        else
                        {
                            /*se coloca como falso el valor porque no fue encontrada la huella*/
                            estadoVerificacion = false;
                        }
                    }
                }

                if(estadoVerificacion == false)
                {
                    limpiarInterfazVerificacion();

                    estadoNoIdentificado("HUELLA NO ENCONTRADA");
                    MessageBox.Show("La Persona No existe en la Base de Datos", "Huella no encontrada en la Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    limpiarEstado();
                }

            }
        }


        //private string conteoTiempo()
        //{
        //    TimeSpan ts = new TimeSpan(0, 0, 0, (int)timerIdentificacion.ElapsedMilliseconds);

        //    horas = ts.Hours.ToString().Length < 2 ? "0" + ts.Hours.ToString() : ts.Hours.ToString();
        //    minutos = ts.Minutes.ToString().Length < 2 ? "0" + ts.Minutes.ToString() : ts.Minutes.ToString();
        //    segundos = ts.Seconds.ToString().Length < 2 ? "0" + ts.Seconds.ToString() : ts.Seconds.ToString();
        //    milisegundos = ts.Milliseconds.ToString();

        //    return horas + ":" + minutos + ":" + segundos + ":" + milisegundos;
        //}

        //llamada de campos para mostrar datos provenientes de la lista
        private void datosIdentidadBiograficos(long CUI)
        {
            mostrarDatos(); //habilitar botones
            bloquearCampos(); //bloqueando los campos porque solo se mostraran

            /*traendo la lista para colocarlo en los controles (interfaz)*/
            IdentificacionMenorEdad traerDatosVerificacion = new IdentificacionMenorEdad();
            List<retornoDatosIdentificacion> datosIdentificacion = traerDatosVerificacion.datosBiograficosIdentidad(CUI);
            
            foreach(var verificacion in datosIdentificacion) //para recorrer la lista
            {
                this.Invoke(new Function(delegate () //se abrio un hilo debido a que daba error
                {
                    //seteando valores
                    txtCuiMenor.Text = verificacion.CuiMenor.ToString();
                    txtPrimerNombre.Text = verificacion.PrimerNombre.ToString();
                    txtSegundoNombre.Text = verificacion.SegundoNombre.ToString();
                    txtTercerMasNombres.Text = verificacion.TercerMasNombres.ToString();
                    txtPrimerApellido.Text = verificacion.PrimerApellido.ToString();
                    txtSegundoApellido.Text = verificacion.SegundoApellido.ToString();
                    txtFechaNac.Text = verificacion.FechaNacimiento.ToString();
                    txtGenero.Text = verificacion.Genero.ToString();
                    txtPaisNac.Text = verificacion.PaisNacimiento.ToString();
                    txtDeptoNac.Text = verificacion.DepartamentoNacimiento.ToString();
                    txtMunicipioNac.Text = verificacion.MunicipioNacimiento.ToString();

                    /*----------------------------*/
                    /*FOTOGRAFIA SE MANDA A TRAER*/
                    /*---------------------------*/

                    //conversion de varbinary a bitmap para que se setee al picturebox
                    TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
                    Bitmap MyBitmap;

                    MyBitmap = (Bitmap)tc.ConvertFrom(verificacion.Foto);
                    pbFotografiaMenor.Image = new Bitmap(MyBitmap, pbFotografiaMenor.Size);
                    
                }));
            }
        }

        private void limpiarPictureHuellas()
        {
            pictureBoxDedo1.Image = null;
            pictureBoxDedo2.Image = null;
            pictureBoxDedo3.Image = null;
            pictureBoxDedo4.Image = null;
            pictureBoxDedo5.Image = null;
            pictureBoxDedo6.Image = null;
            pictureBoxDedo7.Image = null;
            pictureBoxDedo8.Image = null;
            pictureBoxDedo9.Image = null;
            pictureBoxDedo10.Image = null;
        }

        private void limpiarInterfazVerificacion()
        {
            this.Invoke(new Function(delegate () //se abrio un hilo debido a que daba error
            {
                txtCuiMenor.Clear();
                txtPrimerNombre.Clear();
                txtSegundoNombre.Clear();
                txtTercerMasNombres.Clear();
                txtPrimerApellido.Clear();
                txtSegundoApellido.Clear();
                txtFechaNac.Clear();
                txtGenero.Clear();
                txtPaisNac.Clear();
                txtDeptoNac.Clear();
                txtMunicipioNac.Clear();
                txtTiempoIdentificacion.Clear();

                pbFotografiaMenor.Image = null;

                limpiarPictureHuellas();
            }));
        }


        private void datosBiometricosBitmapHuellas(long CUI)
        {
            IdentificacionMenorEdad identificacion = new IdentificacionMenorEdad();
            List<bitmapHuellaMenor> listaDatosBiometricosBitmap = identificacion.bitmapHuellasMenorPorCUI(CUI); //se trae la lista de los bitmap

            /*convertidor para pasar de byte a bitmap*/
            TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
            Bitmap MyBitmap;
            /*La lista comienza desde 0 hasta 9*/

            int cantidadLista = listaDatosBiometricosBitmap.Count;

            int i = 0;
            /*para verificar que esten las huellas, Ejemplo: si solo tiene 5, solo esas 5 huellas mostrará*/
            while (i<cantidadLista)
            {
                int tagPosicionDedoPictureBox = listaDatosBiometricosBitmap[i].IdDedoMano;  

                switch (tagPosicionDedoPictureBox)  //antes era i
                {
                    case 1:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo1.Image = new Bitmap(MyBitmap, pictureBoxDedo1.Size);
                        i++;
                        break;
                    case 2:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo2.Image = new Bitmap(MyBitmap, pictureBoxDedo2.Size);
                        i++;
                        break;
                    case 3:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo3.Image = new Bitmap(MyBitmap, pictureBoxDedo3.Size);
                        i++;
                        break;
                    case 4:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo4.Image = new Bitmap(MyBitmap, pictureBoxDedo4.Size);
                        i++;
                        break;
                    case 5:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo5.Image = new Bitmap(MyBitmap, pictureBoxDedo5.Size);
                        i++;
                        break;
                    case 6:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo6.Image = new Bitmap(MyBitmap, pictureBoxDedo6.Size);
                        i++;
                        break;
                    case 7:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo7.Image = new Bitmap(MyBitmap, pictureBoxDedo7.Size);
                        i++;
                        break;
                    case 8:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo8.Image = new Bitmap(MyBitmap, pictureBoxDedo8.Size);
                        i++;
                        break;
                    case 9:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo9.Image = new Bitmap(MyBitmap, pictureBoxDedo9.Size);
                        i++;
                        break;
                    case 10:
                        MyBitmap = (Bitmap)tc.ConvertFrom(listaDatosBiometricosBitmap[i].BitmapDedoHuella);
                        pictureBoxDedo10.Image = new Bitmap(MyBitmap, pictureBoxDedo10.Size);
                        i++;
                        break;
                }
            }
        }



        private void actualizarEstado(int FAR)
        {
            // Mostrar el valor de "False accept rate"
            this.Invoke(new Function(delegate ()
            {
                setResultadoVerificacion(FAR.ToString());
            }));
        }
        

        private void Verificador_Load(object sender, EventArgs e)
        {
            Init();
            start();
        }

        private void Verificador_FormClosed(object sender, FormClosedEventArgs e)
        {
            stop();
        }



        /* - EVENTOS EventHandler Members*/
        public void OnComplete(object Capture, string ReaderSerialNumber, Sample Sample)
        {
            setStatusLector("La huella dactilar fué capturada.");
            procesoHuella(Sample);
        }

        public void OnFingerGone(object Capture, string ReaderSerialNumber)
        {
            setStatusLector("El dedo fué removido del lector biométrico.");
        }

        public void OnFingerTouch(object Capture, string ReaderSerialNumber)
        {
            setStatusLector("El lector biométrico fué tocado.");
        }

        public void OnReaderConnect(object Capture, string ReaderSerialNumber)
        {
            setStatusLector("El lector biométrico fué conectado.");
        }

        public void OnReaderDisconnect(object Capture, string ReaderSerialNumber)
        {
            setStatusLector("El lector biométrico fué desconectado.");
        }
        
        public void OnSampleQuality(object Capture, string ReaderSerialNumber, CaptureFeedback CaptureFeedback)
        {
            if (CaptureFeedback == CaptureFeedback.Good)
            {
                setStatusLector("La calidad de la huella dactilar es buena.");
            }
            else
            {
                setStatusLector("La calidad de la huella dactilar es mala, tomar nuevamente.");
            }
        }


        /*Segundo plano*/
        protected void setInstruccion(string instruccion)
        {
            this.Invoke(new Function(delegate () {
                txtInstruccion.Text = instruccion;
            }));
        }


        protected void setStatusLector(string mensaje)
        {
            this.Invoke(new Function(delegate ()
            {
                txtStatusLector.AppendText(mensaje + "\r\n");
            }));

        }

        protected void setResultadoVerificacion(string mensaje)
        {
            this.Invoke(new Function(delegate ()
            {
                txtFAR.Text = mensaje;
            }));

        }

        protected void estadoIdentificacion(string mensaje)
        {
            this.Invoke(new Function(delegate ()
            {
                txtEstadoIdentificacion.BackColor = Color.FromArgb(118, 215, 196);
                txtEstadoIdentificacion.AppendText(mensaje + "\r\n");
            }));
        }

        protected void tiempoidentificacion(string mensaje)
        {
            this.Invoke(new Function(delegate ()
            {
                txtTiempoIdentificacion.AppendText(mensaje + "\r\n");
            }));
        }

        protected void estadoNoIdentificado(string mensaje)
        {
            this.Invoke(new Function(delegate ()
            {
                txtEstadoIdentificacion.BackColor = Color.FromArgb(245, 183, 177);
                txtEstadoIdentificacion.AppendText(mensaje + "\r\n");
            }));
        }

        protected void limpiarEstado()
        {
            this.Invoke(new Function(delegate ()
            {
                txtEstadoIdentificacion.Clear();
                txtEstadoIdentificacion.BackColor = Color.FromArgb(253, 254, 254);
            }));
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            ///*cada decima de segundo va a hacer esto*/
            //TimeSpan ts = new TimeSpan(0, 0, 0, 0,(int)timerIdentificacion.ElapsedMilliseconds);

            //horas = ts.Hours.ToString().Length <2 ? "0" + ts.Hours.ToString() : ts.Hours.ToString();
            //minutos = ts.Minutes.ToString().Length <2 ? "0"+ ts.Minutes.ToString() : ts.Minutes.ToString();
            //segundos = ts.Seconds.ToString().Length < 2 ? "0" + ts.Seconds.ToString() : ts.Seconds.ToString();
            //milisegundos = ts.Milliseconds.ToString();
        }
    }
}
