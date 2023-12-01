package kr.co.gugu.domain;
import java.sql.Date;

public class MessageDTO {
	
		private int msno;
		private String mssort;
		private String toid;
		private String fromid;
		private String title;
		private String content;
		private Date regdate;
		private int readchk;
		private Date readdate;
		private int del;
		private Date deldate;
		
		
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
