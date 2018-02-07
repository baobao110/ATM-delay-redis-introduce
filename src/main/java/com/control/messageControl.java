package com.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ajax.ajaxDAO;
import com.information.Message;
import com.inter.MessageDAO;
import com.message.messageDTO;
import com.service.messageService;
import com.user.User;

@Controller
@RequestMapping("/message")
public class messageControl {
	
	@Autowired
	private messageService msg;
	
	
	private  Logger log=LoggerFactory.getLogger(messageControl.class);
	
	@RequestMapping("/Information")
	@ResponseBody
	public messageDTO message(HttpSession session) {
		log.info("------------------------------------------");
		Object obj=session.getAttribute("user");
		if(null==obj) {
			return null;
		}
		User user=(User)obj;
		int id=user.getId();
		log.info("----------------------------------------------------"+id+"-------------------------------------");
		return msg.unRead(id);
	}
	

}