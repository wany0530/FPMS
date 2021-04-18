package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A04_AuthDao;
import zenkit.web.dto.AuthSch;
import zenkit.web.vo.AuthInfo;
import zenkit.web.vo.Job;
import zenkit.web.vo.Output;

@Service
public class A04_AuthService {
	
	@Autowired(required=false)
	private A04_AuthDao dao;
	
	public ArrayList<AuthInfo> authListPm(AuthSch sch){
		if(sch.getJob_name()==null) sch.setJob_name("");
		if(sch.getPro_name()==null) sch.setPro_name("");

		if(dao.totCnt(sch)>0) {
			sch.setCount(dao.totCnt(sch));
			if(sch.getPageSize()==0) {
				sch.setPageSize(10);
			}
			sch.setPageCount((int) Math.ceil(sch.getCount()/(double) sch.getPageSize()));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			if(sch.getCurPage()>sch.getPageCount()) { 
				sch.setCurPage(sch.getPageCount());
			}
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			
			sch.setBlockSize(5);
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
			int endBlock = blocknum*sch.getBlockSize();
			sch.setEndBlock(endBlock>sch.getPageCount() ? sch.getPageCount():endBlock);
			sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		}

		return dao.authListPm(sch);
	}
	
	public ArrayList<AuthInfo> authList(AuthSch sch){
		if(sch.getJob_name()==null) sch.setJob_name("");
		if(sch.getPro_name()==null) sch.setPro_name("");
		
		if(dao.totCnt(sch)>0) {
			sch.setCount(dao.totCnt(sch));
			if(sch.getPageSize()==0) {
				sch.setPageSize(10);
			}
			sch.setPageCount((int) Math.ceil(sch.getCount()/(double) sch.getPageSize()));
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
			if(sch.getCurPage()>sch.getPageCount()) {
				sch.setCurPage(sch.getPageCount());
			}
			sch.setEnd(sch.getCurPage()*sch.getPageSize());
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			
			sch.setBlockSize(5);
			int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
			int endBlock = blocknum*sch.getBlockSize();
			sch.setEndBlock(endBlock>sch.getPageCount() ? sch.getPageCount():endBlock);
			sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		}

		return dao.authList(sch);
	}
	
	public ArrayList<String> getPmPros(int u_no) {
		return dao.getPmPros(u_no);
	}
	
	public ArrayList<String> getPros(int u_no) {
		return dao.getPros(u_no);
	}
	
	public Job getJobInfo(int j_no) {
		return dao.getJobInfo(j_no);
	}
	
	public void chRetire(int a_no) {
		dao.chRetire(a_no);
	}
	
	public void chAppRej(AuthInfo upt) {
		dao.chAppRej(upt);
	}
	
	public void chJobComple(Job upt) {
		dao.chJobComple(upt);
	}

	public AuthInfo getAuthInfo(int a_no) {
		return dao.getAuthInfo(a_no);
	}
	
	public ArrayList<Output> getOutputInfo(int j_no) {
		return dao.getOutputInfo(j_no);
	}
}
