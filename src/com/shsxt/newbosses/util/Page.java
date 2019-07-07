package com.shsxt.newbosses.util;

import java.util.List;

/**
 * 分页工具类
 * @author Lisa Li
 * @param <T>
 *
 */
public class Page<T> {

	private Integer pageNum; // 当前页 （通常是前台传递给后台的参数；若未传递，后台默认为第1页）
	private Integer pageSize; // 每页显示的记录数  （前台传递或后台设定；若前台传递则以前台传递的参数 为准，若未传递，则使用默认值）
	private long totalCount; // 总数量 （数据库查询得到，通过count()函数）
	
	
	private Integer totalPages; // 总页数  （总数量/每页显示的数量,再向上取整）
	private Integer prePage; // 上一页 （当前页-1；如果当前页减1小于1，则上一页的值为1；如果当前页-1不小于1，则上一页的值为当前页-1） 
	private Integer nextPage; // 下一页 （当前页+1；如果当前页加1大于总页数，则下一页的值总页数；如果当前页加1不大于总页数，则下一页的值为当前页+1）
	private Integer startNavPage; // 开始导航数  （当前页-5；如果当前页-5小于1，开始导航数就是1，此时结束数为开始数+9；如果当前页-5不小于1，开始数的值为当前页-5）
	private Integer endNavPage;  // 导航结束数  （当前页+4；如果当前页+4大于总页数，结束数就是总页数，此时开始数结束数-9；如果当前页+4不大于总页数，结束数为当前页+4）
	
	private List<T> dataList; // 查询到当前页的数据集合 （数据库查询得到的）
	
	/**
	 * 通过当前页、每页显示的数量和查询到的总数量得到其他属性的值
	 * @param pageNnum
	 * @param pageSize
	 * @param totalCount
	 */
	public Page (Integer pageNum, Integer pageSize, long totalCount) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
		
		// 总页数  （总数量/每页显示的数量,再向上取整）
		totalPages = (int) Math.ceil(totalCount*1.0 / pageSize);
		
		// 上一页 （当前页-1；如果当前页减1小于1，则上一页的值为1；如果当前页-1不小于1，则上一页的值为当前页-1） 
		prePage = pageNum - 1 < 1 ? 1 : pageNum -1;
		// 下一页 （当前页+1；如果当前页加1大于总页数，则下一页的值总页数；如果当前页加1不大于总页数，则下一页的值为当前页+1）
		nextPage = pageNum + 1 > totalPages ? totalPages : pageNum + 1;
		
		// 开始导航数  （当前页-5；如果当前页-5小于1，开始导航数就是1，此时结束数为开始数+9；如果当前页-5不小于1，开始数的值为当前页-5）
		startNavPage = pageNum - 5;
		// 导航结束数  （当前页+4；如果当前页+4大于总页数，结束数就是总页数，此时开始数结束数-9；如果当前页+4不大于总页数，结束数为当前页+4）
		endNavPage = pageNum + 4;
		
		if (startNavPage < 1) {
			startNavPage = 1;
			endNavPage = startNavPage + 9 > totalPages ? totalPages : startNavPage + 9;
		}
		if (endNavPage > totalPages) {
			endNavPage = totalPages;
			startNavPage= endNavPage - 9 < 1 ? 1 :endNavPage - 9;
		}
		
	}
	
	

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public Integer getPrePage() {
		return prePage;
	}

	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}

	public Integer getNextPage() {
		return nextPage;
	}

	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}

	public Integer getStartNavPage() {
		return startNavPage;
	}

	public void setStartNavPage(Integer startNavPage) {
		this.startNavPage = startNavPage;
	}

	public Integer getEndNavPage() {
		return endNavPage;
	}

	public void setEndNavPage(Integer endNavPage) {
		this.endNavPage = endNavPage;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
}
