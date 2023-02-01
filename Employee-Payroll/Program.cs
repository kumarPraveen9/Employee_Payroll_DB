using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Employee_Payroll
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Employee Payroll ADO.NET problem.");
        }
        static string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Payroll_Service;Integrated Security=SSPI";
        static SqlConnection connection = new SqlConnection(connectionString);
        public static string EstablishConnection()
        {
            if (connection != null)
            {
                try
                {
                    connection.Open();
                    connection.Close();
                    return "Connection was established.";
                }
                catch (Exception ex)
                {
                    throw new CustomExceptions(CustomExceptions.ExceptionType.CONNECTION_FAILED, "Connection Failed.");
                }
            }
            return "Connection was null.";
        }

    }
}