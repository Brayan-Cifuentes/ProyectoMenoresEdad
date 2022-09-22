using DPFP;
using DPFP.Capture;
using DPFP.Processing;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaMenoresEdad
{
    public partial class CapturaHuella : Form, DPFP.Capture.EventHandler
    {                                  //Carga un controlador de eventos de operacion de captura de muestras de huellas dactilares

        /*variable para capturar una muestra de huella dactilar de un lector*/
        private Capture capturar;

        /*----------------------------------------------*/

        public CapturaHuella()
        {
            InitializeComponent();
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

        }

        //DPFP.Sample: Representa la muestra de la huella dactilar capturada del lector
        protected virtual void procesoHuella(Sample huella)
        {
            //Dibuja la huella dactilar como una imagen
            dibujarHuella(convertirMuestraABitmap(huella));
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

        private void CapturarHuella_Load(object sender, EventArgs e)
        {
            Init();
            start();
        }
        private void CapturarHuella_FormClosed(object sender, FormClosedEventArgs e)
        {
            stop();
        }

        //private void Enrolamiento_Load(object sender, EventArgs e)
        //{
        //    Init();
        //    start();
        //}

        //private void Enrolamiento_FormClosed(object sender, FormClosedEventArgs e)
        //{
        //    stop();
        //}

        protected void limpiarCampos()
        {
            this.Invoke(new Function(delegate ()
            {
                txtStatusLector.Clear();
                pbHuella.Image = null;
            }));
        }

        /*--- MÉTODOS ESPECÍFICOS ---*/

        protected Bitmap convertirMuestraABitmap(Sample huella)
        {
            //DPFP.Capture.SampleConversion: convierte una muestra de huella dactilar en una imagen en formato de archivo de imagen de mapa de bits o en formato ANSI 381
            SampleConversion convertidor = new SampleConversion();
            Bitmap bitmap = null;
            //hice cambio aca 
            convertidor.ConvertToPicture(huella, ref bitmap); //convierte una muestra de huella dactilar en un archivo de mapa de bits

            return bitmap;
        }

        //protected byte[] convertirBitmapAByte(Bitmap huella)
        //{
        //    byte[] data = default(byte[]);

        //    using (System.IO.MemoryStream sampleStream = new System.IO.MemoryStream())
        //    {
        //        //save to stream.
        //        huella.Save(sampleStream, System.Drawing.Imaging.ImageFormat.Bmp);

        //        //the byte array
        //        data = sampleStream.ToArray();
        //    }
        //    return data;
        //}

        public void dibujarHuellaPictureMenor(Sample huella, PictureBox pictureBox)
        {
            Bitmap bitmap = null;
            bitmap = convertirMuestraABitmap(huella);
            
            //encajando bitmap de huella en picturebox
            pictureBox.Image = new Bitmap(bitmap, pictureBox.Size);
            pictureBox.Image.RotateFlip(RotateFlipType.Rotate180FlipNone);
        }

        protected void dibujarHuella(Bitmap bitmap)
        {
            this.Invoke(new Function(delegate ()
            {
                pbHuella.Image = new Bitmap(bitmap, pbHuella.Size); //el tamaño que tenia la imagen
                pbHuella.Image.RotateFlip(RotateFlipType.Rotate180FlipNone); //rotar la imagen
            }));
        }

        /*DPFP.Processing.DataPurpose: Se define el propósito para que se utiliza el conjunto de funciones de huellas dactilares */
        protected FeatureSet extraerCaracteristicas(Sample huella, DataPurpose objetivo)
        {
            FeatureExtraction extraccion = new FeatureExtraction(); // se crea un extractor de caracteristicas
            //define el valor que provee el feedback con respecto a la muestra de la huella al realizar su captura - resultado pag 63 manual
            CaptureFeedback feedback = CaptureFeedback.None;
            //representa a un conjunto de caracteristicas de las huellas dactilares
            FeatureSet caracteristicas = new FeatureSet();

            extraccion.CreateFeatureSet(huella, objetivo, ref feedback, ref caracteristicas);  //se estraen las caracteristicas y se evaluan

            if(feedback == CaptureFeedback.Good)
            {
                return caracteristicas;  //devuelve las caracteristicas si se evaluaron de forma correcta
            }
            else
            {
                return null;
            }

        }


        //Ejecuta el delegado especificado en el subproceso que posee el identificador de ventana subyacente del control.
        protected void setInstruccion(string instruccion)
        {
            this.Invoke(new Function(delegate() {
                txtInstruccion.Text = instruccion;
            }));
        }

      
        protected void setStatusHuella(string status)
        {
            this.Invoke(new Function(delegate (){
                txtHuellasRestantes.Text = status;
            }));
        }

        protected void setStatusLector(string mensaje)
        {
            this.Invoke(new Function(delegate ()
            {
                txtStatusLector.AppendText(mensaje + "\r\n");
            }));

        }

        /*-----------------------*/

        /* - EVENTOS DE LA HERENCIA EventHandler Members*/
        public void OnComplete(object Capture, string ReaderSerialNumber, Sample Sample)
        {
            
                setStatusLector("La huella dactilar fué capturada.");
                setInstruccion("Colocar nuevamente la huella de nuevo.");
                procesoHuella(Sample);

                //BitmapHuella = convertirBitmapAByte(convertirMuestraABitmap(Sample));

                //if(BitmapHuella != null)
                //{
                //    MessageBox.Show("Bitmap atrapado");
                //}

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
            if(CaptureFeedback == CaptureFeedback.Good)
            {
                setStatusLector("La calidad de la huella dactilar es buena.");
            }
            else
            {
                setStatusLector("La calidad de la huella dactilar es mala, tomar nuevamente.");
            }
        }
        
        /*------*/


    }
}
