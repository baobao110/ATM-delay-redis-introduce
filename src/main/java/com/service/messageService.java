package com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.information.Message;
import com.inter.MessageDAO;
import com.message.messageDTO;

@Service
public class messageService {

	@Autowired
	private MessageDAO msg;
	
	public messageDTO unRead(int userId){
		ArrayList<Message> message=msg.detail(userId);
		return messageDTO.success(message.size(), message);
	}

}
