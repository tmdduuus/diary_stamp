package com.ktds.jspservlet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class JspservletApplication {

	public static void main(String[] args) {
		SpringApplication.run(JspservletApplication.class, args);
	}

}
