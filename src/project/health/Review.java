package project.health;

import java.util.Date;

public class Review {
	
	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}
	/**
	 * @param regdate the regdate to set
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	private int reviewid;
	private String userid;
	private String title;
	private String centerName;	
	private Date regdate;
	private String content;
	
	/**
	 * @return the reviewID
	 */
	public int getReviewid() {
		return reviewid;
	}
	/**
	 * @param reviewid the reviewID to set
	 */
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}
	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the centerName
	 */
	public String getCenterName() {
		return centerName;
	}
	/**
	 * @param centerName the centerName to set
	 */
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	
}
