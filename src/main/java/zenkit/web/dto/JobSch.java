package zenkit.web.dto;

public class JobSch {
	private String j_name;
	private String u_no;
	private int p_no;

	// 2. 페이징 처리
	private int count; // 총데이터 건수
	private int pageSize; // 한 페이지에 보여줄 데이터 건수
	private int pageCount; // 총 페이지 수 count/pageSize
	private int curPage; // 클릭한 현재 페이지 번호
	private int start; // 페이지의 시작 번호
	private int end; // 페이지의 마지막 번호
	// block처리
	private int blockSize; // 한번에 보여줄 block의 크기
	private int startBlock; // block의 시작 번호
	private int endBlock; // block의 마지막 번호
	
	public JobSch() {
		// TODO Auto-generated constructor stub
	}
	
	public JobSch(int count, int pageSize, int pageCount, int curPage, int start, int end, int blockSize,
			int startBlock, int endBlock) {
		super();
		this.count = count;
		this.pageSize = pageSize;
		this.pageCount = pageCount;
		this.curPage = curPage;
		this.start = start;
		this.end = end;
		this.blockSize = blockSize;
		this.startBlock = startBlock;
		this.endBlock = endBlock;
	}




	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	
	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
	
}
