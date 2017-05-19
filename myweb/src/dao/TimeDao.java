package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

import DbUtil.DbUtil;

public class TimeDao {
	DbUtil db = null;
	public TimeDao(){
		db = new DbUtil();
	}
	//json  格式的回传数据
	public String getList(String sql, String[] params){
		JSONArray jsonData = new JSONArray();
		try{
			//db.setParams(sql, params);
			ResultSet rs = db.getParams(sql, params).executeQuery();
			int i = 0;
			while(rs.next()&& i<8){
				JSONObject json = new JSONObject();
				json.put("time",rs.getString("time"));
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
		TimeDao com = new TimeDao();
		String sql = "SELECT time FROM text";
	    String[] str = {};
		String result = com.getList(sql,str);
		System.out.println("get->"+result);
	}
}
