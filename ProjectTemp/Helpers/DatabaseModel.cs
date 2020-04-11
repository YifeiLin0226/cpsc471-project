using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Web;
using MySql.Data.MySqlClient;

namespace ProjectTemp.Helpers
{
    public class DatabaseModel
    {

        #region Query Methods

        public MySqlConnection GetSQLConnection(string connectionstring)
        {
            if (connectionstring == null)
                return null;
            return new MySqlConnection(connectionstring);
        }

        public string Get_PuBConnectionString()
        {
            try
            {
                return "Server=localhost;Database=railway;Uid=root;Pwd=;";
            }
            catch { return null; }
        }

        public MySqlConnection GetSQLConnection()
        {
            if (Get_PuBConnectionString() == null)
                return null;
            return new MySqlConnection(Get_PuBConnectionString());
        }

        /// <summary>
        /// This method is responisble to to execute a query in your RDBMS and return for you an output value. 
        /// For instance, in some cases when you insert a new records you need to return the id of that record to do other actions
        /// </summary>
        /// <returns></returns>

        public int Execute_Non_Query_Store_Procedure(string procedureName, MySqlParameter[] parameters, string returnValue)
        {
            if (GetSQLConnection() == null)
                return -2;

            int successfulQuery = -2;
            MySqlCommand sqlCommand = new MySqlCommand(procedureName, GetSQLConnection());
            sqlCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                sqlCommand.Parameters.AddRange(parameters);
                sqlCommand.Connection.Open();
                successfulQuery = sqlCommand.ExecuteNonQuery();
                successfulQuery = (int)sqlCommand.Parameters["@" + returnValue].Value;

            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }

            if (sqlCommand.Connection != null && sqlCommand.Connection.State == ConnectionState.Open)
                sqlCommand.Connection.Close();

            return successfulQuery;
        }


        /// <summary>
        /// This method is responisble to to execute a query in your RDBMS and return for you if it was successult executed. Minay used for insert,update, and delete
        /// </summary>
        /// <returns></returns>
        public int Execute_Non_Query_Store_Procedure(string procedureName, MySqlParameter[] parameters)
        {
            if (GetSQLConnection() == null)
                return -1;

            int successfulQuery = 1;
            MySqlCommand sqlCommand = new MySqlCommand(procedureName, GetSQLConnection());
            sqlCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                sqlCommand.Parameters.AddRange(parameters);
                sqlCommand.Connection.Open();
                successfulQuery = sqlCommand.ExecuteNonQuery();
                // successfulQuery =1

            }
            catch (Exception ex)
            {
                string s = ex.Message;
                
                successfulQuery = -2;
            }

            if (sqlCommand.Connection != null && sqlCommand.Connection.State == ConnectionState.Open)
                sqlCommand.Connection.Close();

            return successfulQuery;
        }


        /// <summary>
        /// This method is responisble to to execute to rertieve data from your RDBSM by executing a stored procedure. Mainly used when using one select statment
        /// </summary>
        /// <returns></returns>
        public DataTable Execute_Data_Query_Store_Procedure(string procedureName, MySqlParameter[] parameters)
        {
            if (GetSQLConnection() == null)
                return null;

            DataTable dataTable = new DataTable();
            MySqlDataAdapter sqlAdapter = new MySqlDataAdapter(procedureName, GetSQLConnection());
            sqlAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                sqlAdapter.SelectCommand.Parameters.AddRange(parameters);
                sqlAdapter.SelectCommand.Connection.Open();
                sqlAdapter.Fill(dataTable);
            }
            catch (Exception er)
            {
                string ee = er.ToString();
                dataTable = null;
            }

            if (sqlAdapter.SelectCommand.Connection != null && sqlAdapter.SelectCommand.Connection.State == ConnectionState.Open)
                sqlAdapter.SelectCommand.Connection.Close();

            return dataTable;
        }

        /// <summary>
        /// This method is responisble to to execute to rertieve data from your RDBSM by executing a stored procedure. Mainly used when more than one table is being returned.
        /// </summary>
        /// <returns></returns>
        /// 

        public DataSet Execute_Data_Dataset_Store_Procedure(string procedureName, MySqlParameter[] parameters)
        {
            if (GetSQLConnection() == null)
                return null;

            DataSet dataset = new DataSet();
            MySqlDataAdapter sqlAdapter = new MySqlDataAdapter(procedureName, GetSQLConnection());
            sqlAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            try
            {
                sqlAdapter.SelectCommand.Parameters.AddRange(parameters);
                sqlAdapter.SelectCommand.Connection.Open();
                sqlAdapter.Fill(dataset);
            }
            catch (Exception er)
            {
                string ee = er.ToString();
                dataset = null;
            }

            if (sqlAdapter.SelectCommand.Connection != null && sqlAdapter.SelectCommand.Connection.State == ConnectionState.Open)
                sqlAdapter.SelectCommand.Connection.Close();

            return dataset;
        }

        /// <summary>
        /// This method check if the connection string is valid or not
        /// </summary>
        /// <returns></returns>

        public bool CheckDatabaseConnectionString(string ConnectionString)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                con.Close();
                return true;
            }
            catch
            {
                return false;
            }


        }
        #endregion

        #region Examples
        public int updateEmployee(int empId,string empName, DateTime embBDate,string empAddress)
        {


            MySqlParameter[] Parameters = new MySqlParameter[4]; // Specifc number of parametrs for this tored procedure. 
            Parameters[0] = new MySqlParameter("@empName", empName);//Make sure parameters name matches thenames given in your stored procedure
            Parameters[1] = new MySqlParameter("@embBDate", embBDate);
            Parameters[2] = new MySqlParameter("@empAddress", empAddress);
            Parameters[3] = new MySqlParameter("@empId", empId);

            return Execute_Non_Query_Store_Procedure("SP_UpdateEmpInfo", Parameters);//Make sure procedure name matches the name given in your RDBMS
        }


        public int insertEmployee( string empName, DateTime embBDate, string empAddress)
        {
            MySqlParameter[] Parameters = new MySqlParameter[3];
            Parameters[0] = new MySqlParameter("@empName", empName);
            Parameters[1] = new MySqlParameter("@embBDate", embBDate);
            Parameters[2] = new MySqlParameter("@empAddress", empAddress);

            Parameters[2] = new MySqlParameter("@empId", SqlDbType.Int);
            Parameters[2].Direction = ParameterDirection.Output;


            return Execute_Non_Query_Store_Procedure("SP_InsertEmpInfo", Parameters, "empId");
        }


        public DataTable GetEmpsInfo()
        {
            MySqlParameter[] Parameters = new MySqlParameter[0];


            return Execute_Data_Query_Store_Procedure("SP_GetEmpsInfo", Parameters);


        }

        #endregion

        public int AddTrain( int trainID, int nocars, string company_name, bool passenger_flag, int economy, int business,bool freight_flag, double max_cargo, double max_volume)
        {
            MySqlParameter[] Parameters = new MySqlParameter[9];
            Parameters[0] = new MySqlParameter("@trainID", trainID);
            Parameters[1] = new MySqlParameter("@NoofCars", nocars);
            Parameters[2] = new MySqlParameter("@company_name", company_name);
            Parameters[3] = new MySqlParameter("@passenger_flag", passenger_flag);
            Parameters[4] = new MySqlParameter("@economy_class", economy);
            Parameters[5] = new MySqlParameter("@business_class", business);
            Parameters[6] = new MySqlParameter("@freight_flag", freight_flag);
            Parameters[7] = new MySqlParameter("@max_cargo", max_cargo);
            Parameters[8] = new MySqlParameter("@max_volume", max_volume);
            return Execute_Non_Query_Store_Procedure("addtrain", Parameters);

        }

        public DataTable GetTrainsFromCompany(string company_name)
        {
            MySqlParameter[] Parameters = new MySqlParameter[1];
            Parameters[0] = new MySqlParameter("@company_name", company_name);
            return Execute_Data_Query_Store_Procedure("getTrainsFromCompany", Parameters);
        }

        public DataTable getTicketInfo(int ticketNumber,int ID)
        {
            MySqlParameter[] Parameters = new MySqlParameter[2];
            Parameters[0] = new MySqlParameter("@ticketNumber", ticketNumber);
            Parameters[1] = new MySqlParameter("@ID", ID);
            return Execute_Data_Query_Store_Procedure("getTicketInfo", Parameters);
        }

        public DataTable getRouteInfo(int routeNumber)
        {
            MySqlParameter[] Parameters = new MySqlParameter[1];
            Parameters[0] = new MySqlParameter("@routeNumber", routeNumber);
            return Execute_Data_Query_Store_Procedure("GetRouteInfo", Parameters);
        }

        public int AssignTrain(int routeNumber,int trainID)
        {
            MySqlParameter[] Parameters = new MySqlParameter[2];
            Parameters[0] = new MySqlParameter("@routeNumber", routeNumber);
            Parameters[1] = new MySqlParameter("@trainID", trainID);
            return Execute_Non_Query_Store_Procedure("AssignTrain", Parameters);
        }

        public DataTable AssignDriver(int driverID,int trainID)
        {
            MySqlParameter[] Parameters = new MySqlParameter[2];
            Parameters[0] = new MySqlParameter("@driverID", driverID);
            Parameters[1] = new MySqlParameter("@trainID", trainID);
            return Execute_Data_Query_Store_Procedure("AssignDriver", Parameters);
        }

        public DataTable AssignMechanic(int mechanicID,int trainID)
        {
            MySqlParameter[] Parameters = new MySqlParameter[2];
            Parameters[0] = new MySqlParameter("@mechanicID", mechanicID);
            Parameters[1] = new MySqlParameter("@trainID", trainID);
            return Execute_Data_Query_Store_Procedure("AssignMechanic", Parameters);
        }
    }
}
