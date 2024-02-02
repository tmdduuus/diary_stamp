package com.ktds.jspservlet.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

@Getter
@Setter
@ToString
public class DateDTO {
    private LocalDate diaryDate;
    private Boolean diaryExists;
}
