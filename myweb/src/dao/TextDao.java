package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

import DbUtil.DbUtil;

public class TextDao {
	DbUtil db = null;
	public TextDao(){
		db = new DbUtil();
	}
	public String getList(String sql, String[] params){
		JSONArray jsonData = new JSONArray();
		try{
			//db.setParams(sql, params);
			ResultSet rs = db.getParams(sql, params).executeQuery();
			while(rs.next()){
				JSONObject json = new JSONObject();
				json.put("title",rs.getString("title"));
				json.put("texts", rs.getString("texts").substring(0, 100));
				json.put("time", rs.getString("time"));
				json.put("clickup", rs.getString("clickup"));
				json.put("browser",rs.getString("browser"));
				json.put("comment", rs.getString("comment"));
				jsonData.put(json);
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
		TextDao com = new TextDao();
		String sql = "SELECT title,texts,time,clickup,browser,comment FROM text WHERE title=?";
		String label  = "";
		String time = "2017/3/4";
		String title = "设计师";
		String[] str = {title};
		String result = com.getList(sql,str);
		System.out.println("get->"+result);
	}

}

