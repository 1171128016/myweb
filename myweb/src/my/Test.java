package my;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Test
{
	/* 测试1
	  {
	   "id":123,
	    "male":true,
	    "name":"邵发",
	    "avg":98.5
	  }
	*/
	public static String test1()
	{
		JSONObject result = new JSONObject();
		result.put("id", 123); // Integer
		result.put("name", "邵发"); // String
		result.put("male", true); // Boolean		
		result.put("avg", 98.5); // double  平均分
		
		System.out.println(result.toString());		
		return result.toString();
	}
	
	/* 测试2
	{
	   "author":"邵发",
	   "duration":1200,
	   "title":"学习指南",
	   "audio":
	   {
	      "sampleRate":44100,
	      "bitsPerSample":16,
	      "channel":2
	   },		      
	   "video":
	   {
	      "height":720,
	      "width":1280,
	      "codec":"h264"
	   }
	 }
	 */
	public static String test2()
	{
		// 一个mp4文件
		JSONObject mp4 = new JSONObject();
		mp4.put("title", "学习指南"); // String
		mp4.put("author", "邵发"); // String
		mp4.put("duration", 1200); // Integer
		
		// 视频编码信息
		JSONObject video = new JSONObject();
		video.put("width", 1280);
		video.put("height", 720);
		video.put("codec", "h264");
		mp4.put("video", video); // 加入一个子对象
		
		// 音频编码信息
		JSONObject audio = new JSONObject();
		audio.put("channel", 2);
		audio.put("sampleRate", 44100);
		audio.put("bitsPerSample", 16);		
		mp4.put("audio", audio); // 加入一个子对象
		
		System.out.println(mp4.toString());		
		return mp4.toString();
	}
	
	/* 测试3 : 数组

			[90,91,92]
	 */
	public static String test3()
	{
		// 分数
		JSONArray scores = new JSONArray();
		scores.put(90);
		scores.put(91);
		scores.put(92);
		System.out.println(scores.toString());		
		return scores.toString();
	}
	
	/* 测试4 : Array的元素是Object
		[
		   {"name":"Li","score":91},
		   {"name":"Li","score":91},
		   {"name":"Li","score":91}
		]
	 */
	public static JSONArray test4()
	{
		// 分数
		JSONArray result = new JSONArray();
		
		JSONObject a1 = new JSONObject();
		a1.put("name", "Li");
		a1.put("score", 91);
		result.put(a1);
		
		JSONObject a2 = new JSONObject();
		a2.put("name", "Wang");
		a2.put("score", 92);
		result.put(a1);
		
		JSONObject a3 = new JSONObject();
		a3.put("name", "Zhao");
		a3.put("score", 93);
		result.put(a1);
		
		System.out.println(result.toString());		
		return result;
	}
	
	/*  Object内部有一个Array
		{
		  "success":true
		  "reason":"OK",
		  "data":
		  [
		  	{"name":"Li","score":91},
		  	{"name":"Li","score":91},
		  	{"name":"Li","score":91}
		  ]
		}
     */
	public static String test5()
	{
		JSONObject result = new JSONObject();
		result.put("success", true);
		result.put("reason", "OK");
		
		result.put("data", test4());
		System.out.println(result.toString());		
		return result.toString();
	}
	
	/* 测试6 由Map构造 
	 
	 {"id":123,"name":"shaofa"}
	 */
	public static String test6()
	{
		Map values = new HashMap();
		values.put("id", 123);
		values.put("name", "shaofa");
		
		JSONObject result = new JSONObject(values);
		System.out.println(result.toString());		
		return result.toString();
	}
	
	// 解析的时候，会抛出JSONException
	public static void parse2()
	{
		String str = test2();
		
		// 如果str格式不规范, 会抛异常
		JSONObject mp4 = new JSONObject(str);
		
		// 若相应字段不存在，会抛异常
		String title = mp4.getString("title");
		String author = mp4.getString("author");
		
		// 若字段类型不匹配, 会抛异常
		int duration = mp4.getInt("duration");
		
		JSONObject video = mp4.getJSONObject("video");
		int width = video.getInt("width");
		int height = video.getInt("height");
	}
	
	// 解析的时候，会抛出JSONException
	public static void parse3()
	{
		String str = test3();	
		
		
		// 如果str格式不规范, 会抛异常
		JSONArray result = new JSONArray(str);
		
		for(int i=0; i<result.length(); i++)
		{
			int s = result.getInt(i);
			System.out.println("score: " + s);
		}
	}
	
	public static void main(String[] args)
	{
		test4();
		
//		try{
//			parse2();	
//		}
//		catch(JSONException e)
//		{		
//			e.printStackTrace();
//		}		

	}

}
