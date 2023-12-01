package kr.co.gugu.domain;
import java.sql.Date;

public class InterviewDTO {
	
	private int msno;		//번호
	private String mssort;	//분류
	private String toid;	//작성자
	private String fromid;	//받는이
	private String title;	//제목
	private String content;	//내용
	private Date regdate;	//작성날짜
	private int readchk;	//확인여부
	private Date readdate;	//확인날짜
	private int del;	//삭제여부
	private Date deldate;		//삭제날짜
		
		
		public int getMsno() {
			return msno;
		}
		public void setMsno(int msno) {
			this.msno = msno;
		}
		public String getMssort() {
			return mssort;
		}
		public void setMssort(String mssort) {
			this.mssort = mssort;
		}
		public String getToid() {
			return toid;
		}
		public void setToid(String toid) {
			this.toid = toid;
		}
		public String getFromid() {
			return fromid;
		}
		public void setFromid(String fromid) {
			this.fromid = fromid;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getReadchk() {
			return readchk;
		}
		public void setReadchk(int readchk) {
			this.readchk = readchk;
		}
		public Date getReaddate() {
			return readdate;
		}
		public void setReaddate(Date readdate) {
			this.readdate = readdate;
		}
		public int getDel() {
			return del;
		}
		public void setDel(int del) {
			this.del = del;
		}
		public Date getDeldate() {
			return deldate;
		}
		public void setDeldate(Date deldate) {
			this.deldate = deldate;
		}
		
}
