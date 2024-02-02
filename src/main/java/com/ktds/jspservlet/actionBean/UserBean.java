package com.ktds.jspservlet.actionBean;

public class UserBean {
    private String name;
    // 기본 생성자
    public UserBean() {
    }
    // 이름 속성의 setter 메서드
    public void setName(String name) {
        this.name = name;
    }
    // 이름 속성의 getter 메서드
    public String getName() {
        return name;
    }
}