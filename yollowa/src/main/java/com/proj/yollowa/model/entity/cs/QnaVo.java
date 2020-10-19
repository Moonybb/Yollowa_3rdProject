package com.proj.yollowa.model.entity.cs;

import java.sql.Date;

/**
 * @author Cielo
 *
 */
public class QnaVo {
	private int qnano;
	private String title;
	private String writer;
	private String content;
	private Date writeddate;
	
	private int hidden;
	
	public QnaVo() {
	}

	public QnaVo(int qnano, String title, String writer, String content, Date writeddate, int hidden) {
		super();
		this.qnano = qnano;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.writeddate = writeddate;
		this.hidden = hidden;
	}

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
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

	public int getHidden() {
		return hidden;
	}

	public void setHidden(int hidden) {
		this.hidden = hidden;
	}

	@Override
	public String toString() {
		return "QnaVo [qnano=" + qnano + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", writeddate=" + writeddate + ", hidden=" + hidden + "]";
	}
	
}
