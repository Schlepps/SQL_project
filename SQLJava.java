package Project_JDBC;
import java.sql.*;
import java.util.Scanner;

public class SQLJava {

	public static void main(String[] args) {
	try {
		// Establish a connection
		String host = "jdbc:mysql://edickie02.webhosting1.eeecs.qub.ac.uk:";
		String port = "3306/";
		String DB = "edickie02";
		String username = "edickie02";
		String password = "kxQ9FL6lYZgnfsCq";
	
		String urlDB = host + port + DB;
			Connection con = DriverManager.getConnection(urlDB, username, password);
			Statement stmt = con.createStatement();
		
		Scanner inpScan = new Scanner(System.in);
		System.out.println("Select 1 for query table, select 2 for query views, Select 3 for insert data");
		String selection = inpScan.nextLine();
		switch(selection) {
		case "1":
			ResultSet rs = stmt.executeQuery("SELECT * FROM Candidates");
			while (rs.next())
			System.out.println(rs.getInt(1)+" " + rs.getString(2));
			break;
		case "2":
			ResultSet rs2 = stmt.executeQuery("SELECT * FROM SalaryOrderedJobs");
			while (rs2.next())
			System.out.println(rs2.getInt(1)+" " + rs2.getString(2));
			break;
		case "3":
			String sqlInsert = "INSERT IGNORE INTO Candidates (ID,Name,ContactID,LocationID) VALUES (4,'Murphy Splinter',3,4)"; 
			stmt.execute(sqlInsert);
			System.out.println("Insert successful");
			break;
		}
		stmt.close();
		con.close();
	}
			catch (Exception e) {
				System.out.println(e);
			}
	}
};
	