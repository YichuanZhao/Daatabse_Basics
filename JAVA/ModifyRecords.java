import java.sql.*;

class ModifyRecords{

	public static void main(String[] args) throws Exception{

		modify();
	}

	public static void modify() throws Exception{
		try{
			Connection con = getConnection();
			
			PreparedStatement statement = con.prepareStatement("UPDATE Students SET name = 'Scott' WHERE ssn = '746897816'");
			statement.executeUpdate();

			statement = con.prepareStatement("UPDATE Major SET name='Computer Science', level='MS' WHERE (Select S.snum FROM Students S WHERE S.ssn='746897816')");
			statement.executeUpdate();

			statement = con.prepareStatement("DELETE FROM Register WHERE regtime = 'Spring2015'");
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