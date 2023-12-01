package kr.co.gugu.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class AttendanceDTO {

		private int  ano;
		private String date;
		private int asort;
		private int number;
		private int att;
		private String acontent;
		private Timestamp adate;
		private int befor;
		private String beforcon;
		private int after;
		private String aftercon;
		private String mname;
		private String pname;
		
		public String getMname() {
			return mname;
		}
		public void setMname(String mname) {
			this.mname = mname;
		}
		public String getPname() {
			return pname;
		}
		public void setPname(String pname) {
			this.pname = pname;
		}
		public int getAno() {
			return ano;
		}
		public void setAno(int ano) {
			this.ano = ano;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public int getAsort() {
			return asort;
		}
		public void setAsort(int asort) {
			this.asort = asort;
		}
		public int getNumber() {
			return number;
		}
		public void setNumber(int number) {
			this.number = number;
		}
		public int getAtt() {
			return att;
		}
		public void setAtt(int att) {
			this.att = att;
		}
		public String getAcontent() {
			return acontent;
		}
		public void setAcontent(String acontent) {
			this.acontent = acontent;
		}
		public Timestamp getAdate() {
			return adate;
		}
		public void setAdate(Timestamp adate) {
			this.adate = adate;
		}
		public int getBefor() {
			return befor;
		}
		public void setBefor(int befor) {
			this.befor = befor;
		}
		public String getBeforcon() {
			return beforcon;
		}
		public void setBeforcon(String beforcon) {
			this.beforcon = beforcon;
		}
		public int getAfter() {
			return after;
		}
		public void setAfter(int after) {
			this.after = after;
		}
		public String getAftercon() {
			return aftercon;
		}
		public void setAftercon(String aftercon) {
			this.aftercon = aftercon;
		}
		
		private String name;

		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
}
