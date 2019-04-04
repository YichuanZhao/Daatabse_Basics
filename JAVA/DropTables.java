import java.sql.*;

class DropTables{

	public static void main(String[] args) throws Exception{

		drop();
	}

	public static void drop() throws Exception{
		try{
			Connection con = getConnection();

			PreparedStatement statement = con.prepareStatement("DROP TABLE Register");
			statement.executeUpdate();

			statement = con.prepareStatement("DROP TABLE Major");
			statement.executeUpdate();

			statement = con.prepareStatement("DROP TABLE Minor");
			statement.executeUpdate();

			statement = con.prepareStatement("DROP TABLE Courses");
			statement.executeUpdate();

			statement = con.prepareStatement("DROP TABLE Degrees");
			statement.executeUpdate();

			statement = con.prepareStatement("DROP TABLE Departments");
			statement.executeUpdate();

			statement = con.prepareStatement("DROP TABLE Students");
			statement.executeUpdate();


		}catch(Exception e){System.out.println(e);}
		finally{
			System.out.println("Modify complete");
		}
	}


	public static Connection getConnection() throws Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/new_schema";
			String username = "root";
			String password = "1";

			Connection myConnection = DriverManager.getConnection(dbUrl, username, password);			

			return myConnection;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}

		return null;

	}


}