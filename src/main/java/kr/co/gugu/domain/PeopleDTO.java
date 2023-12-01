package kr.co.gugu.domain;

public class PeopleDTO {

	private int pno;
	   private String mid;
	   private String pname;
	   private String pinfo;
	   private String pnumber;
	   private String psex;
	   
	   
	   
	   public String getPsex() {
	      return psex;
	   }
	   public void setPsex(String psex) {
	      this.psex = psex;
	   }
	   public String getPnumber() {
	      return pnumber;
	   }
	   public void setPnumber(String pnumber) {
	      this.pnumber = pnumber;
	   }
	   public String getMid() {
	      return mid;
	   }
	   public void setMid(String mid) {
	      this.mid = mid;
	   }
	   
	   public int getPno() {
	      return pno;
	   }
	   public void setPno(int pno) {
	      this.pno = pno;
	   }
	   
	   public String getPname() {
	      return pname;
	   }
	   public void setPname(String pname) {
	      this.pname = pname;
	   }
	   public String getPinfo() {
	      return pinfo;
	   }
	   public void setPinfo(String pinfo) {
	      this.pinfo = pinfo;
	   }
	   

}
