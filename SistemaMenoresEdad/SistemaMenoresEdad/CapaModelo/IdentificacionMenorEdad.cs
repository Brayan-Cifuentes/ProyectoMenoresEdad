using SistemaMenoresEdad.Capa_Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaMenoresEdad.CapaModelo
{
    public class DatosBiometricosMenor
    {
        private long cuiMenor;
        private int idDedoMano;
        private byte[] template;

        public long CuiMenor { get => cuiMenor; set => cuiMenor = value; }
        public int IdDedoMano { get => idDedoMano; set => idDedoMano = value; }
        public byte[] Template { get => template; set => template = value; }

    }

    public class retornoDatosIdentificacion
    {
        private long cuiMenor;
        private string primerNombre;
        private string segundoNombre;
        private string tercerMasNombres;
        private string primerApellido;
        private string segundoApellido;
        private string fechaNacimiento;
        private string genero;
        private string paisNacimiento;
        private string departamentoNacimiento;
        private string municipioNacimiento;
        private byte[] foto;

        public long CuiMenor { get => cuiMenor; set => cuiMenor = value; }
        public string PrimerNombre { get => primerNombre; set => primerNombre = value; }
        public string SegundoNombre { get => segundoNombre; set => segundoNombre = value; }
        public string TercerMasNombres { get => tercerMasNombres; set => tercerMasNombres = value; }
        public string PrimerApellido { get => primerApellido; set => primerApellido = value; }
        public string SegundoApellido { get => segundoApellido; set => segundoApellido = value; }
        public string FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public string Genero { get => genero; set => genero = value; }
        public string PaisNacimiento { get => paisNacimiento; set => paisNacimiento = value; }
        public string DepartamentoNacimiento { get => departamentoNacimiento; set => departamentoNacimiento = value; }
        public string MunicipioNacimiento { get => municipioNacimiento; set => municipioNacimiento = value; }
        public byte[] Foto { get => foto; set => foto = value; }
    }

    public class bitmapHuellaMenor
    {
        byte[] bitmapDedoHuella;
        int idDedoMano;

        public byte[] BitmapDedoHuella { get => bitmapDedoHuella; set => bitmapDedoHuella = value; }
        public int IdDedoMano { get => idDedoMano; set => idDedoMano = value; }
    }

    public class IdentificacionMenorEdad
    {

        /*----------------------------*/
        /*LISTA PARA DATOS BIOMETRICOS -> Realizar la comparacion de la huella de la BD con la ingresada por el lector*/
        /*----------------------------*/
        public List<DatosBiometricosMenor> DatosBiometricos()
        {
            List<DatosBiometricosMenor> Biometricos = new List<DatosBiometricosMenor>();
            string queryListarDatos = "SELECT CUIMenor, idDedoMano, template FROM HuellaDactilar";

            using (SqlConnection connection = new SqlConnection(Conexion.conexionString))
            {
                SqlCommand command = new SqlCommand(queryListarDatos, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        DatosBiometricosMenor DatoBiometrico = new DatosBiometricosMenor();
                        DatoBiometrico.CuiMenor = (long)reader["CUIMenor"];

                        DatoBiometrico.IdDedoMano = (int)reader["idDedoMano"];

                        /*validacion para verificar que la plantilla no este vacia*/
                        if (reader["template"].ToString() != "")
                        {
                            DatoBiometrico.Template = (byte[])reader["template"];
                        }
                        else
                        {
                            DatoBiometrico.Template = null;
                        }

                        Biometricos.Add(DatoBiometrico);
                    }

                    reader.Close();
                    connection.Close();
                }
                catch (SqlException exception)
                {
                    MessageBox.Show("Error:" + exception.Message);
                }
            }

            return Biometricos; //retorna la lista con los datos del menor de edad
        }


        /*------------------------*/
        /*LISTAR DATOS IDENTIDAD */
        /*----------------------*/
        public List<retornoDatosIdentificacion> datosBiograficosIdentidad(long CUIMenor)
        {
            List<retornoDatosIdentificacion> datosIdentidad = new List<retornoDatosIdentificacion>();
            string sql = "SP_RetornarDatos";

            using (SqlConnection connection = new SqlConnection(Conexion.conexionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.CommandType = CommandType.StoredProcedure;   //procedimiento almacenado
                command.Parameters.AddWithValue("@CUIMenor", CUIMenor);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        retornoDatosIdentificacion datos = new retornoDatosIdentificacion();
                        datos.CuiMenor = (long)reader["CUIMenor"];
                        datos.PrimerNombre = (string)reader["Primer Nombre"];
                        datos.SegundoNombre = (string)reader["Segundo Nombre"];
                        datos.TercerMasNombres = (string)reader["Tercer y mas Nombres"];
                        datos.PrimerApellido = (string)reader["Primer Apellido"];
                        datos.SegundoApellido = (string)reader["Segundo Apellido"];

                        /*fecha - conversion*/
                        DateTime fecha = (DateTime)reader["Fecha Nacimiento"];

                        datos.FechaNacimiento = fecha.ToString("dd/MM/yyyy");
                        datos.Genero = (string)reader["Genero"];
                        datos.PaisNacimiento = (string)reader["Pais"];
                        datos.DepartamentoNacimiento = (string)reader["Departamento"];
                        datos.MunicipioNacimiento = (string)reader["Municipio"];
                        datos.Foto = (byte[])reader["fotografia"];


                        datosIdentidad.Add(datos);
                    }
                    reader.Close();
                    connection.Close();
                }
                catch (SqlException exception)
                {
                    MessageBox.Show("Error:" + exception.Message);
                }
            }

            return datosIdentidad; //retorna la lista con los datos del menor de edad
        }


        /*----------------------------------------------------------*/
        /*LISTA PARA TRAER BITMAP DE LAS HUELLAS CON EL CUI INGRESADO
        /*----------------------------------------------------------*/
        public List<bitmapHuellaMenor> bitmapHuellasMenorPorCUI(long CUIMenor)
        {
            List<bitmapHuellaMenor> bitmapHuella = new List<bitmapHuellaMenor>();
            string sql = "select bitmapHuella, idDedoMano from HuellaDactilar where CUIMenor = @CUIMenor order by idDedoMano asc";

            using (SqlConnection connection = new SqlConnection(Conexion.conexionString))
            {

                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@CUIMenor", CUIMenor);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        bitmapHuellaMenor datos = new bitmapHuellaMenor();
                        datos.BitmapDedoHuella = (byte[])reader["bitmapHuella"];
                        datos.IdDedoMano = (int)reader["idDedoMano"];

                        bitmapHuella.Add(datos);
                    }
                    reader.Close();
                    connection.Close();
                }
                catch (SqlException exception)
                {
                    MessageBox.Show("Error:" + exception.Message);
                }
            }

            return bitmapHuella; //retorna la lista con los bitmap de las huellas dactilares
        }

    }
}
