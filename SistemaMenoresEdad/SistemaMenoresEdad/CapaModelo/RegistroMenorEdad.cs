using SistemaMenoresEdad.Capa_Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaMenoresEdad.CapaModelo
{
    public class DatosMenorEdad{
        private long cuiMenor;
        private string primerNombre;
        private string segundoNombre;
        private string tercerMasNombres;
        private string primerApellido;
        private string segundoApellido;
        private DateTime fechaNacimiento;
        private int idGenero;
        private int idPaisNacimiento;
        private int idDepartamentoNacimiento;
        private int idMunicipioNacimiento;
        private string foto;
        private char estado;

        public long CuiMenor { get => cuiMenor; set => cuiMenor = value; }
        public string PrimerNombre { get => primerNombre; set => primerNombre = value; }
        public string SegundoNombre { get => segundoNombre; set => segundoNombre = value; }
        public string TercerMasNombres { get => tercerMasNombres; set => tercerMasNombres = value; }
        public string PrimerApellido { get => primerApellido; set => primerApellido = value; }
        public string SegundoApellido { get => segundoApellido; set => segundoApellido = value; }
        public DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public int IdGenero { get => idGenero; set => idGenero = value; }
        public int IdPaisNacimiento { get => idPaisNacimiento; set => idPaisNacimiento = value; }
        public int IdDepartamentoNacimiento { get => idDepartamentoNacimiento; set => idDepartamentoNacimiento = value; }
        public int IdMunicipioNacimiento { get => idMunicipioNacimiento; set => idMunicipioNacimiento = value; }
        public string Foto { get => foto; set => foto = value; }
        public char Estado { get => estado; set => estado = value; }
    }

    /*public class DatosBiometricosMenor
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
        private string foto;

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
        public string Foto { get => foto; set => foto = value; }
    }
    */
    
    public class RegistroMenorEdad
    {

        public void llenarCombobox(string campoID, string campoNombre, string tabla, ComboBox comboBox)
        {
            using (SqlConnection conexion = new SqlConnection(Conexion.conexionString))
            {
                string cadenaSQL = "select "+ campoID + ", "+ campoNombre + " from "+tabla+"";

                try
                {
                    conexion.Open();
                    SqlCommand command = new SqlCommand(cadenaSQL, conexion);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);
                    conexion.Close();

                    comboBox.ValueMember = campoID;
                    comboBox.DisplayMember = campoNombre;
                    comboBox.DataSource = dataTable;

                }
                catch(Exception exc)
                {
                    MessageBox.Show("Error: " + exc.Message);
                }
            }
        }

        public void llenarDepartamento(ComboBox comboBox, int ID)
        {
            using (SqlConnection conexion = new SqlConnection(Conexion.conexionString))
            {
                string cadenaSQL = "select idDepartamento, nombre from DepartamentoNacimiento where idPais = @ID";

                try
                {
                    conexion.Open();
                    SqlCommand command = new SqlCommand(cadenaSQL, conexion);
                    command.Parameters.Add("@ID", ID);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);
                    conexion.Close();

                    comboBox.ValueMember = "idDepartamento";
                    comboBox.DisplayMember = "nombre";
                    comboBox.DataSource = dataTable;

                }
                catch (Exception exc)
                {
                    MessageBox.Show("Error: " + exc.Message);
                }
            }
        }

        public void llenarMunicipio(ComboBox comboBox, int ID)
        {
            using (SqlConnection conexion = new SqlConnection(Conexion.conexionString))
            {
                string consultaSql = "select m.idMunicipio, m.nombre from MunicipioNacimiento as m" +
                                    " INNER JOIN DepartamentoNacimiento as d ON m.idDepartamento = d.idDepartamento" +
                                    " where d.idDepartamento =@ID";

                try
                {
                    conexion.Open();
                    SqlCommand command = new SqlCommand(consultaSql, conexion);
                    command.Parameters.Add("@ID", ID);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable data = new DataTable();
                    dataAdapter.Fill(data);
                    conexion.Close();

                    comboBox.ValueMember = "m.idMunicipio";
                    comboBox.DisplayMember = "nombre";
                    comboBox.DataSource = data;
                }
                catch (Exception exc)
                {
                    MessageBox.Show("Error: " + exc.Message);
                }
            }
        }


        /*------------------------*/
        /*LISTAR MENORES DE EDAD */
        /*----------------------*/
        public List<DatosMenorEdad> listarDatosBiograficos()
        {
            List<DatosMenorEdad> datosBiograficos = new List<DatosMenorEdad>();
            string queryListarDatos = "SELECT * FROM MenorEdad";

            using (SqlConnection connection = new SqlConnection(Conexion.conexionString))
            {
                SqlCommand command = new SqlCommand(queryListarDatos, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        DatosMenorEdad datos = new DatosMenorEdad();
                        datos.CuiMenor = (long)reader["CUIMenor"];
                        datos.PrimerNombre = (string)reader["primerNombre"];
                        datos.SegundoNombre = (string)reader["segundoNombre"];
                        datos.TercerMasNombres = (string)reader["tercerMasNombres"];
                        datos.PrimerApellido = (string)reader["primerApellido"];
                        datos.SegundoApellido = (string)reader["segundoApellido"];
                        datos.FechaNacimiento = (DateTime)reader["fechaNacimiento"];
                        datos.IdGenero = (int)reader["idGenero"];
                        datos.IdPaisNacimiento = (int)reader["idPaisNacimiento"];
                        datos.IdDepartamentoNacimiento = (int)reader["idDepartamentoNac"];
                        datos.IdMunicipioNacimiento = (int)reader["idMunicipioNac"];
                        //datos.Foto = (string)reader["fotografia"];
                        datos.Estado = char.Parse((string)reader["estatus"]);

                        datosBiograficos.Add(datos);
                    }
                    reader.Close();
                    connection.Close();
                }
                catch (SqlException exception)
                {
                    MessageBox.Show("Error:" + exception.Message);
                }
            }

            return datosBiograficos; //retorna la lista con los datos del menor de edad
        }


        /*----------------------------*/
        /*LISTA PARA DATOS BIOMETRICOS -> Realizar la compracion de la huella de la BD con la ingresada por el lector*/
        /*----------------------------*/
        /*public List<DatosBiometricosMenor> DatosBiometricos()
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

                        /*validacion para verificar que la plantilla no este vacia
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
*/

        /*------------------------*/
        /*LISTAR DATOS IDENTIDAD */
        /*----------------------*/
        /*public List<retornoDatosIdentificacion> datosBiograficosIdentidad(long CUIMenor)
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

                        /*fecha - conversion
                        DateTime fecha = (DateTime)reader["Fecha Nacimiento"];

                        datos.FechaNacimiento = fecha.ToString("dd/MM/yyyy");
                        datos.Genero = (string)reader["Genero"];
                        datos.PaisNacimiento = (string)reader["Pais"];
                        datos.DepartamentoNacimiento = (string)reader["Departamento"];
                        datos.MunicipioNacimiento = (string)reader["Municipio"];
                        datos.Foto = (string)reader["fotografia"];


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
        */


        /*--------------------------------*/
        /*INSERTAR DATOS DEL MENOR DE EDAD*/
        /*--------------------------------*/
        public void insertarDatosBiograficos(TextBox CUI,TextBox primerNombre, TextBox segundoNombre, TextBox tercerYmasNombres, TextBox primerApellido,
            TextBox segundoApellido, TextBox fechaNacimiento, TextBox idGenero, TextBox idPaisNacimiento, TextBox idDepartamentoNacimiento,
            TextBox idMunicipioNacimiento, byte[] fotografia)
        {
            //VariablesGlobales variables = new VariablesGlobales();
            string nombreSP = "SP_InsertarMenorEdad";

            using (SqlConnection connection = new SqlConnection(Conexion.conexionString))
            {
                SqlCommand command = new SqlCommand(nombreSP, connection);
                command.CommandType = CommandType.StoredProcedure;   //procedimiento almacenado
                command.Parameters.AddWithValue("@primerNombre", primerNombre.Text);
                command.Parameters.AddWithValue("@segundoNombre", segundoNombre.Text);
                command.Parameters.AddWithValue("@tercerYMasNombres", tercerYmasNombres.Text);
                command.Parameters.AddWithValue("@primerApellido", primerApellido.Text);
                command.Parameters.AddWithValue("@segundoApellido", segundoApellido.Text);
                command.Parameters.AddWithValue("@fechaNacimiento", fechaNacimiento.Text);
                command.Parameters.AddWithValue("@idGenero", idGenero.Text);
                command.Parameters.AddWithValue("@idPaisNacimiento", idPaisNacimiento.Text);
                command.Parameters.AddWithValue("@idDepartamentoNac", idDepartamentoNacimiento.Text);
                command.Parameters.AddWithValue("@idMunicipioNac", idMunicipioNacimiento.Text);
                command.Parameters.AddWithValue("@fotografia", fotografia);
                /*Parametro de salida*/
                command.Parameters.Add("@CUIGenerado", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                try
                {
                    connection.Open();
                    int fila = command.ExecuteNonQuery();

                    //variables.CuiGenerado = Convert.ToString(command.Parameters["@CUIGenerado"].Value);
                    CUI.Text = Convert.ToString(command.Parameters["@CUIGenerado"].Value);
                    CUI.BackColor = Color.FromArgb(130, 224, 170);

                    connection.Close();
                    MessageBox.Show("Registro Ingresado");
                    
                }
                catch (SqlException exc)
                {
                    MessageBox.Show("Error: \n" + exc.Message);
                    
                }
            }

            //return variables;
        }


        /*-------------------------------------*/
        /*Verificar Huella dactilar ingresada */
        /*------------------------------------*/

        public int verificarHuellaIngresada(TextBox CUI, PictureBox idDedo)
        {
            int respuesta=0;

            using (SqlConnection conexion = new SqlConnection(Conexion.conexionString))
            {

                string nombreSP = "SP_VerificarHuellaIngresada";

                SqlCommand command = new SqlCommand(nombreSP, conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CUIMenor", CUI.Text);
                command.Parameters.AddWithValue("@idDedoMano", idDedo.Tag); //Tag contiene el codigo de la huella
                command.Parameters.Add("@respuesta", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                try
                {
                    conexion.Open();
                    command.ExecuteNonQuery();
                    respuesta = Convert.ToInt32(command.Parameters["@respuesta"].Value);
                    conexion.Close();
                    //MessageBox.Show("Huella guardada en la Base de Datos");

                }
                catch (SqlException exc)
                {
                    MessageBox.Show("Error: \n" + exc.Message);

                }
            }
            
            return respuesta;
        }


        /*----------------------------*/
        /*Insertar Huellas dactilares */
        /*----------------------------*/
        public void insertarHuellaMenorEdad(TextBox CUI, PictureBox idDedo, byte[] template, byte[] bitmapHuella)
        {
            
            using (SqlConnection conexion = new SqlConnection(Conexion.conexionString))
            {

                string nombreSP = "SP_InsertarHuellaMenor";

                SqlCommand command = new SqlCommand(nombreSP, conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CUIMenor", CUI.Text);
                command.Parameters.AddWithValue("@idDedoMano", idDedo.Tag); //Tag contiene el codigo de la huella
                command.Parameters.AddWithValue("@template", template);
                command.Parameters.AddWithValue("@bitmapHuella", bitmapHuella);
                //command.Parameters.Add("@respuesta", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                try
                {
                    conexion.Open();
                    command.ExecuteNonQuery();
                    //respuesta = Convert.ToInt32(command.Parameters["@respuesta"].Value);
                    conexion.Close();
                    MessageBox.Show("Huella guardada en la Base de Datos");

                }
                catch (SqlException exc)
                {
                    MessageBox.Show("Error: \n" + exc.Message);

                }
            }
        }

        /*------------------------*/
        /*Buscar Huella dactilar */
        /*-----------------------*/
        public void buscarHuella(byte[] template)
        {
            using (SqlConnection connection = new SqlConnection(Conexion.conexionString))
            {
                string query = "SELECT CUIMenor, idDedoMano from HuellaDactilar where template=@template ";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@template", template);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    reader.Read();

                    reader.Close();
                    connection.Close();

                }
                catch (SqlException exception)
                {
                    MessageBox.Show("Error: " + exception.Message);
                }
            }
        }
    }
}
