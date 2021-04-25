package zenkit.web.vo;

import java.util.Date;
/*
 *   SELECT zr.r_no, zj.p_no, p_name, r_name, rs_name, r_regdate, zu.u_name
    FROM z_project zj, z_risk zr, z_user zu
    WHERE zj.p_no = zr.p_no
    AND zr.r_send= #{zu.u_id}
 */
public class Risk {
	private int r_no;//리스크 번호
	private String r_name;// 리스크명
	private String r_content; // 리스크 내용
	private Date r_regdate; //등록일
	private String r_regdate_s; //등록일
	private String r_send; //제기자
	private String r_receive; //조치자
	private String r_rcontent; //조치내용
	private int p_no; //작업번호
	private String zj;
	private String zr;
	private String p_name; //작업 이름
	private String rs_name; //상태명
	private String u_name; //아이디 이름 - 리스크 리스트에 올라갈 것
	private String zu;
	private String r_strat; //리스크 대응전략
	
	
	
	public Risk() {
		// TODO Auto-generated constructor stub
	}
	
   
	public String getR_strat() {
		return r_strat;
	}



	public void setR_strat(String r_strat) {
		this.r_strat = r_strat;
	}



	public String getZu() {
		return zu;
	}



	public void setZu(String zu) {
		this.zu = zu;
	}



	public String getU_name() {
		return u_name;
	}



	public void setU_name(String u_name) {
		this.u_name = u_name;
	}



	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}



	public String getZj() {
		return zj;
	}

	public void setZj(String zj) {
		this.zj = zj;
	}

	public String getZr() {
		return zr;
	}

	public void setZr(String zr) {
		this.zr = zr;
	}

	
	public Risk(int r_no, String r_name, String r_content, Date r_regdate, String r_regdate_s, String r_send,
			String r_receive, String r_rcontent,  int p_no, String p_name, String rs_name, String u_name) {
		super();
		this.r_no = r_no;
		this.r_name = r_name;
		this.r_content = r_content;
		this.r_regdate = r_regdate;
		this.r_regdate_s = r_regdate_s;
		this.r_send = r_send;
		this.r_receive = r_receive;
		this.r_rcontent = r_rcontent;
		this.p_no = p_no;
		this.p_name=p_name;
		this.rs_name = rs_name;
		this.u_name=u_name;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getR_regdate_s() {
		return r_regdate_s;
	}

	public void setR_regdate_s(String r_regdate_s) {
		this.r_regdate_s = r_regdate_s;
	}

	public String getR_send() {
		return r_send;
	}

	public void setR_send(String r_send) {
		this.r_send = r_send;
	}

	public String getR_receive() {
		return r_receive;
	}

	public void setR_receive(String r_receive) {
		this.r_receive = r_receive;
	}

	public String getR_rcontent() {
		return r_rcontent;
	}

	public void setR_rcontent(String r_rcontent) {
		this.r_rcontent = r_rcontent;
	}


	public String getRs_name() {
		return rs_name;
	}

	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
}
