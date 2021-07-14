package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//import com.entity.Users;

import users.UserEntity;

public class userdaoImp implements userdao {
	private Connection conn;

	public userdaoImp(Connection conn) {
		super();
		this.conn = conn;
		// TODO Auto-generated constructor stub
	}

	public boolean userRegister(UserEntity us) {
		boolean f = false;
		try {
			String sql = "Insert into registration(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, us.getName());
			st.setString(2, us.getEmail());
			st.setString(3, us.getPhone());
			st.setString(4, us.getPassword());
			int i = st.executeUpdate();
			if (i == 1) {
				f = true;
			}
		}

		catch (Exception e) {
			e.getStackTrace();
		}

		return f;
		// return false;
	}


	public UserEntity login(String email, String password) {
		UserEntity us = null;
		try {
			String sql = "select * from registration where email=? and password=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				us = new UserEntity();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
			
			}
		} catch (Exception e) {

		}
		return us;
	}

	
	public boolean checkPassword(int id, String pas) {
		boolean f=false;
		try {
			String sql="select * from registration where id=? and password=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			
			st.setString(2, pas);
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	public boolean updateProfile(UserEntity us) {
		boolean f=false;
		try {
			String sql = "update  registration set name=?,email=?,phone=? where id=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, us.getName());
			st.setString(2, us.getEmail());
			st.setString(3, us.getPhone());
			st.setInt(4,us.getId());
			int i = st.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			
		}
		return f;
	}

	
	public boolean checkUser(String email) {
	boolean f=true;
	
	try {
		String sql = "select * from registration where email=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, email);
		ResultSet rs= st.executeQuery();
		while(rs.next()) {
			f = false;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return f;
	}

	
}
