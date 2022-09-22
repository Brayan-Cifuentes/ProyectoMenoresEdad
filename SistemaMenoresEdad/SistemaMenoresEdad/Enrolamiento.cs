using DPFP;
using SistemaMenoresEdad.Capa_Modelo;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaMenoresEdad
{
    public partial class Enrolamiento : CapturaHuella
    {
        //public Enrolamiento()
        //{
        //    InitializeComponent();
        //}     

        /*variables para plantilla*/
        public delegate void controladorEventoPlantilla(Template plantilla);
        public event controladorEventoPlantilla Plantilla;
        /*variable que se encarga del enrolamiento y agregar caracteristicas a plantilla*/
        private DPFP.Processing.Enrollment enrolamiento;

        
        /*para colocar foto en datapicker del form menor de edad*/
        PictureBox fotoHuellaMenor;
        byte[] bitmapHuella;

        public PictureBox FotoHuellaMenor { get => fotoHuellaMenor; set => fotoHuellaMenor = value; }
        //public byte[] BitmapHuella { get => bitmapHuella; set => bitmapHuella = value; }


        /**/


        protected override void Init()
        {
            base.Init();
            enrolamiento = new DPFP.Processing.Enrollment();
            ActualizarEstadoHuella();
        }

        /*sobreescribiendo metodo para mostrar huella*/
        protected override void procesoHuella(Sample huella)
        {
            base.procesoHuella(huella);  //para que muestre la huella al usuario

            //proceso para crear el set de caracteristicas de la huella introducida
            FeatureSet caracteristicas = extraerCaracteristicas(huella, DPFP.Processing.DataPurpose.Enrollment); //el proposito es enrolamiento

            //se verifica la calidad de la huella an se agrega al enrolamiendo si esta correcto
            if(caracteristicas != null) try
            {
                setStatusLector("El set de características de la huella dactilar fué creada.");
                enrolamiento.AddFeatures(caracteristicas);  //se agregan las caracteristicas a la plantilla
            }
            catch
            {
                MessageBox.Show("Error, la huella dactilar no es la misma");
                enrolamiento.Clear();  //se limpia el enrolamiento y se comienza otra vez
                stop();
                MessageBox.Show("Intentelo Nuevamente");
                /*Limpiar picture box y estado lector*/
                limpiarCampos();

                ActualizarEstadoHuella();
                Plantilla(null);   //se limpia la plantilla
                start();            //se da inicio al enrolamiento
            }
            finally
            {
                ActualizarEstadoHuella(); //cantidadNecesaria -1
                
                    //se verifica si se ha creado la plantilla, a las 4 veces se crea la plantilla
                    switch (enrolamiento.TemplateStatus)
                    {
                    case DPFP.Processing.Enrollment.Status.Ready:
                        Plantilla(enrolamiento.Template);
                        setInstruccion("Porfavor cierre esta pestaña, el enrolamiento ha finalizado.");
                        base.dibujarHuellaPictureMenor(huella, FotoHuellaMenor);//a la 4ta captura la huella para ser mostrada
                        stop();
                        break;

                    case DPFP.Processing.Enrollment.Status.Failed: //si falla el enrolamiento
                        enrolamiento.Clear();  //se limpia el enrolamiento y se comienza otra vez
                        stop();
                        ActualizarEstadoHuella();
                        Plantilla(null);   //se limpia la plantilla
                        start();            //se da inicio al enrolamiento
                        break;
                    }
            }

        }

        private void Enrolamiento_Load(object sender, EventArgs e)
        {
        }

        /*Metodos*/
        private void ActualizarEstadoHuella()
        {
            //Muestra el numero de tomas de huellas necesarias
            setStatusHuella(String.Format("Número de captura de huellas necesarias: {0}", enrolamiento.FeaturesNeeded));
        }

        

    }
}
