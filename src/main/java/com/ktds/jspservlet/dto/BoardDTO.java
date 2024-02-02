package com.ktds.jspservlet.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter // 모든 필드의 Getter 메서드를 자동으로 생성
@Setter // 모든 필드의 Setter 메서드를 자동으로 생성
@ToString // toString 메서드를 자동으로 생성
public class BoardDTO {
    private Long id;
    private String boardWriter;
    private String boardPass;
    private String boardTitle;
    private String boardContents;
    private String photo;
    private int boardHits;
    private Timestamp boardCreatedTime;
}