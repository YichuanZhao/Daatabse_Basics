import java.sql.*;

class Query{

	public static void main(String[] args) throws Exception{

		select();
	}

	public static String select() throws Exception{
		try{
			Connection con = getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT S.snum, S.ssn FROM Students S WHERE S.name='Becky'");
			ResultSet result = statement.executeQuery();

			String outputSring = "";

			System.out.println("1) The student number and ssn of the student whose name is 'Becky'\n");

			while(result.next()){

				System.out.println(result.getInt("S.snum") + "..." + result.getInt("S.ssn"));
				// System.out.println(result.getInt("S.ssn"));
				System.out.println("\n");

				// outputSring += result.getInt("S.snum") + "...";
				// outputSring += result.getInt("S.ssn") + "\n";
			}

			statement = con.prepareStatement("SELECT R.name, R.level FROM Major R WHERE R.snum IN (Select A.snum FROM Students A WHERE A.ssn='123097834')");
			result = statement.executeQuery();

			System.out.println("2) The major name and major level of the student whose ssn is 123097834 \n");
			while(result.next()){

				System.out.println(result.getString("R.name") + "..." + result.getString("R.level"));
				// System.out.println(result.getString("R.level"));
				System.out.println("\n");

				// outputSring += result.getString("R.name") + "...";
				// outputSring += result.getString("R.level") + "\n";
			}

			statement = con.prepareStatement("SELECT S.name FROM Courses S WHERE S.department_code IN (SELECT A.code FROM Departments A WHERE A.name='Computer Science');");
			result = statement.executeQuery();


			System.out.println("3) The names of all courses offered by the department of Computer Science \n");
			while(result.next()){

				System.out.println(result.getString("S.name"));
				System.out.println("\n");
				// outputSring += result.getString("S.name") + "\n";
			}
			
			statement = con.prepareStatement("SELECT S.name, S.level FROM Degrees S WHERE S.department_code IN (SELECT A.code FROM Departments A WHERE A.name='Computer Science')");
			result = statement.executeQuery();

			System.out.println("4) All degree names and levels offered by the department Computer Science \n");
			while(result.next()){

				System.out.println(result.getString("S.name") + "..." + result.getString("S.level"));
				// System.out.println(result.getString("S.level"));
				System.out.println("\n");
				// outputSring += result.getString("S.name") + "...";
				// outputSring += result.getString("S.level") + "\n";
			}

			statement = con.prepareStatement("SELECT S.name FROM Students S WHERE S.snum IN (SELECT A.snum FROM Minor A)");
			result = statement.executeQuery();

			System.out.println("5) The names of all students who have a minor \n");
			while(result.next()){

				System.out.println(result.getString("S.name"));
				System.out.println("\n");
				// outputSring += result.getString("S.name") + "\n";
			}
						

			// System.out.println(outputSring);
			return outputSring;

		}catch(Exception e){System.out.println(e);}
		finally{
			System.out.println("Select Complete");
		}

		return null;
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