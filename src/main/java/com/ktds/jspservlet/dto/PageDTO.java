package com.ktds.jspservlet.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class PageDTO {
    private int maxPage;
    private int page;
    private int startPage;
    private int endPage;


    public PageDTO(int maxPage, int page, int startPage, int endPage) {
        this.maxPage = maxPage;
        this.page = page;
        this.startPage = startPage;
        this.endPage = endPage;
    }

    public PageDTO() {
    }
}
