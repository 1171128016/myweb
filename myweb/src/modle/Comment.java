package modle;

public class Comment {
	private int textId;//文章ID
	private int commentID;//
	private String userName;//用户名
	private String userEmail;//邮箱
	private String text;//文章
	private String time;//发表留言时间 
	public int getTextId() {
		return textId;
	}
	public void setTextId(int textId) {
		this.textId = textId;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
