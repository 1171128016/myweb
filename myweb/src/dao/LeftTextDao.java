package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

import DbUtil.DbUtil;

public class LeftTextDao {
	DbUtil db = null;
	public LeftTextDao(){
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
				json.put("title",rs.getString("title"));
				json.put("texts", rs.getString("texts").substring(0, 30));
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
		LeftTextDao com = new LeftTextDao();
		String sql = "SELECT title,texts FROM text ";
		String[] str = {};
		String result = com.getList(sql,str);
		System.out.println("get->"+result);
	}
}
