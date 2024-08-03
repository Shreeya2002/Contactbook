package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;

public class userDAO {
	private Connection conn;

	public userDAO(Connection conn) {
		super();
		this.conn=conn;
		// TODO Auto-generated constructor stub
	}
	
	public boolean userRegister(user u) {
		boolean f=false;
		
		try {
			String sql="insert into user(name,email,password) values (?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(2, u.getName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public user loginUser(String e, String p) {
		user user=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				user = new user();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}
	
}
