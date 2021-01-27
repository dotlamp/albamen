package com.example.albamen.dto.page;

public class PageDTO {
    private int startPage;
    private int endPage;
    private boolean prev, next;
    private int number;

    private int total;
    private Criteria cri;

    public PageDTO(Criteria cri, int total, int pageNum){
        this.cri = cri;
        this.total = total;

        this.endPage = (int)(Math.ceil(cri.getPageNum()/(float)pageNum))*pageNum;
        this.startPage = this.endPage-(pageNum-1);
        int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
        if(realEnd < this.endPage){
            this.endPage = realEnd;
        }
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
        this.number = (cri.getPageNum()-1)*cri.getAmount()+1;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getNumber() {
        return number;
    }

    public int getTotal() {
        return total;
    }

    public Criteria getCri() {
        return cri;
    }
}
