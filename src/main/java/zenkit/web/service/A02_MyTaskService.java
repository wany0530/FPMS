package zenkit.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zenkit.web.dao.A02_MyTaskDao;
import zenkit.web.dto.MyTaskSch;
import zenkit.web.vo.Auth;
import zenkit.web.vo.JobInfo;

@Service
public class A02_MyTaskService {
	
	@Autowired(required=false)
	private A02_MyTaskDao dao;
	
	public ArrayList<JobInfo> myTaskList(MyTaskSch sch) {
		if(sch.getJ_name()==null) sch.setJ_name("");
		if(sch.getP_name()==null) sch.setP_name("");
		if(sch.getIngstate()==null) sch.setIngstate("");
		
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

		return dao.myTaskList(sch);
	}
	
	public ArrayList<String> myPros(int u_no) {
		return dao.myPros(u_no);
	}
	
	public void insertAuth(Auth ins) {
		dao.insertAuth(ins);
	}

}
