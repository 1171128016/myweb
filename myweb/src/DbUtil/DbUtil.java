package DbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbUtil {
	private String dirver;
	private String url;
	private String username;
	private String userpassword;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//构造方法  定义链接对象
	public DbUtil(){
		this.dirver = "com.mysql.jdbc.Driver";
		this.url = "jdbc:mysql://localhost:3306/myblog";
		this.username = "root";
		this.userpassword = "root";
	}

	//链接对象
	public Connection getCon() {
		try{
			Class.forName(dirver);
			con  = DriverManager.getConnection(url, username, userpassword);
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}

	//设置SQL语句的参数，（语句按照数组给出）并获取数据
	public PreparedStatement getParams(String sql, String[] params){
		try{
			pstmt  = getCon().prepareStatement(sql);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		if(params!=null){
			for (int i = 0 ; i < params.length ; i++){
				try{
					pstmt.setString(i+1, params[i]);
				}
				catch (SQLException e){
					e.printStackTrace();
				}
			}}
		return pstmt;
	}
	//	//执行查询工作,将结果集封装到 List中
	//	public List getList(String sql){
	//		List list = new ArrayList();
	//
	//		try{
	//			
	//			ResultSet rs = getPstmt(sql).executeQuery();
	//			while(rs.next()){
	//				Music music = new Music();
	//				music.setId(rs.getInt("id"));
	//				music.setMusicname(rs.getString("musicname"));
	//				music.setSinger(rs.getString("singer"));
	//				music.setRank(rs.getInt("rank"));
	//				list.add(music);
	//			}
	//		}
	//		catch(SQLException e){
	//			e.printStackTrace();
	//		}
	//		finally{
	//			close();
	//		}
	//		return list;
	//	}

	//数据更新调用，返回影响行数
	public int update(String sql,String[] params){ 
		int recNo = 0;
		try{
			recNo = getParams(sql,params).executeUpdate();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return recNo;
	}

	//关闭连接对象
	public void close(){
		try {
			if (rs != null){
				rs.close();
			}
			if (pstmt != null){
				pstmt.close();
			}
			if (con != null){
				con.close();
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	//	
	//	public static void main(String []args){
	//		DbUtil db = new DbUtil();
	//        String sql = "SELECT * FROM music";
	//        List list = db.getList(sql);
	//        for(Object m: list){
	//            System.out.println(m);
	//		}
	//		//int r = db.update(sql2);
	//		
	//	//	System.out.println("影响行数："+r);
	//	}
}
