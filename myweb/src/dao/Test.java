package dao;

public class Test {
	
	
	public static void main(String []args){
	CommentDao com = new CommentDao();
    String sql = "SELECT username,time,text FROM message";
	String result = com.getList(sql, null);
	System.out.println("get->"+result);
	}

}
