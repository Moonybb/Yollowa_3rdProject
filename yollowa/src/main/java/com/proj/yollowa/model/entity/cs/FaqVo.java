package com.proj.yollowa.model.entity.cs;

import java.sql.Date;

public class FaqVo {
	private int faqno;
	private String title;
	private String writer;
	private String content;
	private Date writeddate;
	
	public FaqVo() {
	}

	public FaqVo(int faqno, String title, String writer, String content, Date writeddate) {
		super();
		this.faqno = faqno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.writeddate = writeddate;
	}

	public int getFaqno() {
		return faqno;
	}

	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteddate() {
		return writeddate;
	}

	public void setWriteddate(Date writeddate) {
		this.writeddate = writeddate;
	}

	@Override
	public String toString() {
		return "FaqVo [faqno=" + faqno + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", writeddate=" + writeddate + "]";
	}
	
}
