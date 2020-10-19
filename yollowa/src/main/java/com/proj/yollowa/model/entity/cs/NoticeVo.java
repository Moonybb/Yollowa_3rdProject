package com.proj.yollowa.model.entity.cs;

import java.sql.Date;

public class NoticeVo {
	private int noticeno;
	private String title;
	private String writer;
	private String content;
	private Date writeddate;
	
	public NoticeVo() {
	}

	public NoticeVo(int noticeno, String title, String writer, String content, Date writeddate) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.writeddate = writeddate;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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
		return "NoticeVo [noticeno=" + noticeno + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", writeddate=" + writeddate + "]";
	}
	
	
}
