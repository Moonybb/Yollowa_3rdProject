package com.proj.yollowa.controller.cs;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.model.entity.NoticeVo;
import com.proj.yollowa.model.service.cs.NoticeService;

@Controller
@RequestMapping("/cs-center/notice")
public class NoticeController {
	
	@Inject
	NoticeService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String noticeList(Model model) {
		try {
			noticeService.getNoticeListService(model);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "cs-center/noticeList";
	}
	
	@RequestMapping(value = "/detail/{noticeno}", method = RequestMethod.GET)
	public String getNotice(Model model, @PathVariable int noticeno) {
		try {
			noticeService.getNoticeService(model, noticeno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "cs-center/noticeDetail";
	}
	
	@RequestMapping(value = "/delete/{noticeno}", method = RequestMethod.GET)
	public String deleteNotice(@PathVariable int noticeno) {
		try {
			noticeService.deleteNoticeService(noticeno);
			System.out.println(noticeno+", noticia se ha eliminado");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../";
	}
	@RequestMapping("/write")
	public String write() {
		return "cs-center/noticeWrite";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVo bean) {
		System.out.println("escribir page, enviado por post");
		try {
			noticeService.insertNoticeService(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:./";
	}
	
	
}
