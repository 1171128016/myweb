package test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import dao.CommentDao;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	// 从TCP Stream中读取时，要反复读取，直接读完
	public String readAsText(InputStream streamIn, String charset) throws IOException 
	{
		ByteArrayOutputStream cache = new ByteArrayOutputStream(4096);  
        byte[] data = new byte[1024];  
        while (true)
        {
        	int len = streamIn.read(data);
        	if(len < 0) // 连接已经断开
        	{
        		break;
        	}
        	if(len == 0) // 数据未完 // TODO: 要防止超时
        	{
        		continue;
        	}
        	// 缓存起来
        	cache.write(data, 0, len);
        	
        	if(cache.size() > 1024*16) // 上限, 最多读取16KB
        	{
        		break;
        	}
        }  
        return cache.toString(charset);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   request.setCharacterEncoding("UTF-8");
	   response.setCharacterEncoding("UTF-8");
	   response.setContentType("text/html");
	   PrintWriter out = response.getWriter();
//	   InputStream streamIn = request.getInputStream();
//	   String jsondata = readAsText(streamIn,"UTF-8");
// 	   JSONObject userdata = new JSONObject(jsondata);
//	   String username = userdata.getString("username");
//	   String useremail = userdata.getString("useremail");
//	   String usertext = userdata.getString("usertext");
//	   System.out.println("get->"+"文字："+usertext+"姓名："+username+"邮箱："+useremail);
//	   response.sendRedirect("index_text.jsp");
		// 分数
	    Logger logger = Logger.getLogger(TestServlet.class);
	    logger.debug("交互开始");

		
		CommentDao com = new CommentDao();
	    String sql = "SELECT username,time,text FROM message";
		String result = com.getList(sql, null);
		System.out.println("get->"+result);
		
		out.write(result);
		out.close();
	}
}
