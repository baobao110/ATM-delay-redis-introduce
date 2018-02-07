package com.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.information.Message;

public interface MessageDAO {
	public int add(Message msg);
	
	public ArrayList<Message> detail(@Param("userId")int userId);
}
