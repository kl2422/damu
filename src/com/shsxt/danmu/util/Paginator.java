package com.shsxt.danmu.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
public class Paginator implements Serializable {
    private int limit;
    private int page;
    private long totalCount;


    private boolean firstPage;
    private boolean lastPage;
    private boolean hasPrePage;
    private boolean hasNextPage;

    private int prePage;
    private int nextPage;
    private int totalPages;
    private Integer[] slider;

    public Paginator(int page, int limit, Long totalCount) {
    	if (totalCount == null) {
    		totalCount = 0L;
    	}
        this.limit = limit;
        this.totalCount = totalCount;
        this.page = this.computePageNo(page);


        this.firstPage = isFirstPage();
        this.lastPage = isLastPage();
        this.hasPrePage = isHasPrePage();
        this.hasNextPage = isHasNextPage();
        this.prePage = this.getPrePage();
        this.nextPage = this.getNextPage();
        this.totalPages = this.getTotalPages();
        this.slider = getSlider();
    }

    public int getPage() {
        return this.page;
    }

    public int getLimit() {
        return this.limit;
    }

    public int getTotalCount() {
        return (int)this.totalCount;
    }

    public boolean isFirstPage() {
        return this.page <= 1;
    }

    public boolean isLastPage() {
        return this.page >= this.getTotalPages();
    }

    public int getPrePage() {
        return this.isHasPrePage()?this.page - 1:this.page;
    }

    public int getNextPage() {
        return this.isHasNextPage()?this.page + 1:this.page;
    }

    public boolean isDisabledPage(int page) {
        return page < 1 || page > this.getTotalPages() || page == this.page;
    }

    public boolean isHasPrePage() {
        return this.page - 1 >= 1;
    }

    public boolean isHasNextPage() {
        return this.page + 1 <= this.getTotalPages();
    }

    public int getStartRow() {
        return this.getLimit() > 0 && this.totalCount > 0?(this.page > 0?(this.page - 1) * this.getLimit() + 1:0):0;
    }

    public int getEndRow() {
        return this.page > 0?Math.min(this.limit * this.page, this.getTotalCount()):0;
    }

    public int getOffset() {
        return this.page > 0?(this.page - 1) * this.getLimit():0;
    }

    public int getTotalPages() {
        if(this.totalCount <= 0) {
            return 0;
        } else if(this.limit <= 0) {
            return 0;
        } else {
            int count =(int) this.totalCount / this.limit;
            if(this.totalCount % this.limit > 0) {
                ++count;
            }

            return count;
        }
    }

    protected int computePageNo(int page) {
        return computePageNumber(page, this.limit, this.totalCount);
    }

    public Integer[] getSlider() {
        return this.slider(7);
    }

    public Integer[] slider(int slidersCount) {
        return generateLinkPageNumbers(this.getPage(), this.getTotalPages(), slidersCount);
    }

    private static int computeLastPageNumber(long totalItems, int pageSize) {
        if(pageSize <= 0) {
            return 1;
        } else {
            int result = (int)totalItems % pageSize == 0?(int)totalItems / pageSize:(int)totalItems / pageSize + 1;
            if(result <= 1) {
                result = 1;
            }

            return result;
        }
    }

    private static int computePageNumber(int page, int pageSize, long totalItems) {
        return page <= 1?1:(2147483647 != page && page <= computeLastPageNumber(totalItems, pageSize)?page:computeLastPageNumber(totalItems, pageSize));
    }

    private static Integer[] generateLinkPageNumbers(int currentPageNumber, int lastPageNumber, int count) {
        int avg = count / 2;
        int startPageNumber = currentPageNumber - avg;
        if(startPageNumber <= 0) {
            startPageNumber = 1;
        }

        int endPageNumber = startPageNumber + count - 1;
        if(endPageNumber > lastPageNumber) {
            endPageNumber = lastPageNumber;
        }

        if(endPageNumber - startPageNumber < count) {
            startPageNumber = endPageNumber - count;
            if(startPageNumber <= 0) {
                startPageNumber = 1;
            }
        }

        List<Integer> result = new ArrayList<Integer>();

        for(int i = startPageNumber; i <= endPageNumber; ++i) {
            result.add(new Integer(i));
        }

        return (Integer[])result.toArray(new Integer[result.size()]);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Paginator");
        sb.append("{page=").append(this.page);
        sb.append(", limit=").append(this.limit);
        sb.append(", totalCount=").append(this.totalCount);
        sb.append('}');
        return sb.toString();
    }
}
