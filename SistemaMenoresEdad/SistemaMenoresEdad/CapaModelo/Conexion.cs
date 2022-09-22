using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Imaging;
using System.ComponentModel;

namespace SistemaMenoresEdad.Capa_Modelo
{
    public class Conexion
    {
        public static string conexionString = "Data Source=DESKTOP-0VSTESP; Initial Catalog=UNDERAGE_FINGERPRINTS; User Id=SA; Password=root2022";

        public string conexionBD()
        {
            try
            {
                SqlConnection conexion = new SqlConnection(conexionString);
                conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
            return "conexion exitosa";
        }


        public void insertarPrueba(byte[] template, byte[] bitmapHuella)
        {

            using (SqlConnection conexion = new SqlConnection(conexionString))
            {

                string sql = "insert into pruebaHuella values(@plantilla, @btmValor)";


                SqlCommand command = new SqlCommand(sql, conexion);
                //command.Parameters.Add("@codigoHuella", bytesHuella);
                command.Parameters.Add("@plantilla", template);
                command.Parameters.Add("@btmValor", bitmapHuella);

                try
                {
                    conexion.Open();
                    command.ExecuteNonQuery();
                    conexion.Close();
                    MessageBox.Show("Registro Ingresado");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

        }


        public void retornarBitmapaHuella(int id, PictureBox pictureBox)
        {

            using (SqlConnection conexion = new SqlConnection(conexionString))
            {
                /*
                string sql = "select bitmap from pruebaHuella where id = @ID";

                SqlCommand command = new SqlCommand(sql, conexion);
                command.Parameters.Add("@ID", id);

                try
                {
                    conexion.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    /*como solo es 1 registro, entonces que solo cargue eso y no todos
                    reader.Read();

                    pictureBox.Image = new Bitmap((Bitmap)reader["bitmap"], pictureBox.Size);


                    reader.Close();
                    conexion.Close();

                }
                catch (Exception ex)
                {
                    
                    MessageBox.Show(ex.Message);
                }
                */

                string sql = "select bitmap from HuellaDactilar where id=" + id;

                try
                {
                    SqlDataAdapter sda = new SqlDataAdapter(sql, conexion);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    foreach (DataRow row in dt.Rows)
                    {

                        //Get the byte array from image file
                        byte[] imgBytes = (byte[])row["bitmap"];

                        //If you want convert to a bitmap file
                        TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
                        Bitmap MyBitmap = (Bitmap)tc.ConvertFrom(imgBytes);

                        pictureBox.Image = new Bitmap(MyBitmap, pictureBox.Size);
                    }
                }
                catch (Exception exc)
                {
                    MessageBox.Show("Error: " + exc.Message);
                }
            }
        }

    }

        /*
        public datos regresarBitmap()
        {
            
            string query = "select TOP(1) * from prueba2";

                using (SqlConnection connection = new SqlConnection(conexionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        /*como solo es 1 registro, entonces que solo cargue eso y no todos
                        reader.Read();

                        datos data = new datos();
                        data.Persona = (Bitmap)reader["template"];


                        reader.Close();
                        connection.Close();
                        return data;
                        
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Existe un error, " + ex.Message);
                    }
                }

        }
    }

    public class datos
    {
        private Bitmap persona;

        public Bitmap Persona { get => persona; set => persona = value; }
    }*/
}
