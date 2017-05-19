package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import dao.TextDao;

/**
 * Servlet implementation class GetTextServlet
 */
@WebServlet("/GetTextServlet")
public class GetTextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(GetTextServlet.class);
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetTextServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 从TCP Stream中读取时，要反复读取，直接读完
	public String readAsText(InputStream streamIn, String charset) throws IOException 
	{
		ByteArrayOutputStream cache = new ByteArrayOutputStream(4096);  //缓存数据
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//按照标签的值获取的text
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//		   InputStream streamIn = request.getInputStream();
		//		   String jsondata = readAsText(streamIn,"UTF-8");
		//	 	   JSONObject userdata = new JSONObject(jsondata);
		//		   String username = userdata.getString("username");
		//		   String useremail = userdata.getString("useremail");
		//		   String usertext = userdata.getString("usertext");
		//		   System.out.println("get->"+"文字："+usertext+"姓名："+username+"邮箱："+useremail);
		//		   response.sendRedirect("index_text.jsp");
		// 分数
		InputStream streamIn = request.getInputStream();
		String jsonData = readAsText(streamIn,"UTF-8");
		JSONObject userdata = new JSONObject(jsonData);
		String title = userdata.getString("title");
		logger.debug("获取参数----》"+title);
		logger.debug("初始化TextDao类,获取参数指定数据!");
		TextDao text = new TextDao();
		String sql = "SELECT title,texts,time,clickup,browser,comment FROM text WHERE title=?";
		String[] str = {title};
		String result = text.getList(sql,str);
		logger.debug("查询的文章信息---》"+result);
		out.write(result);
		out.close();
	}
}
