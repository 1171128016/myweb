package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.PreparedStatement;

import DbUtil.DbUtil;

public class CommentDao {
	DbUtil db = null;
	public CommentDao(){
		db = new DbUtil();
	}
	
	
	public String getList(String sql, String[] params){
		JSONArray jsonData = new JSONArray();
		try{
			//db.setParams(sql, params);
			ResultSet rs = db.getParams(sql, params).executeQuery();
			int i = 0;
			while(rs.next()&& i<8){
				JSONObject json = new JSONObject();
				json.put("time",rs.getString("time"));
				json.put("text", rs.getString("text").substring(0,8));
				json.put("name", rs.getString("username"));
				jsonData.put(json);
				i++;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally{
			db.close();
		}
		return jsonData.toString();
	}
	public String getLists(String sql, String[] params){
		JSONArray jsonData = new JSONArray();
		try{
			//db.setParams(sql, params);
			ResultSet rs = db.getParams(sql, params).executeQuery();
			int i = 0;
			while(rs.next()&& i<8){
				JSONObject json = new JSONObject();
				json.put("time",rs.getString("time"));
				json.put("text", rs.getString("text"));
				json.put("name", rs.getString("username"));
				jsonData.put(json);
				i++;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally{
			db.close();
		}
		return jsonData.toString();
	}
	public static void main(String []args){
		CommentDao com = new CommentDao();
		String sql = "SELECT username,time,text FROM message ";
	    String[] str = {};
		String result = com.getList(sql,str);
		System.out.println("get->"+result);
	}
}
