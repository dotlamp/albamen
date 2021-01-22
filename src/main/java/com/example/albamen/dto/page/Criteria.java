package com.example.albamen.dto.page;


import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
    private int pageNum;
    private int amount;
    private String type;
    private String keyword;

    public Criteria(int pageNum, int amount){
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public Criteria(){
        this(1,10);
    }

    public String[] getTypeArr(){
        return type == null ? new String[] {} : type.split("");
    }

    public String getListLink(){
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("amount", this.getAmount())
                .queryParam("type", this.getType())
                .queryParam("keyword", this.getKeyword());
        return builder.toUriString();
    }

    @Override
    public String toString() {
        return "Criteria{" +
                "pageNum=" + pageNum +
                ", amount=" + amount +
                ", type='" + type + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getPageNum() {
        return pageNum;
    }

    public int getAmount() {
        return amount;
    }

    public String getType() {
        return type;
    }

    public String getKeyword() {
        return keyword;
    }
}
