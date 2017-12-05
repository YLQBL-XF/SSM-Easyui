package com.httpModel;

import com.model.User;

/**
 * session信息模型
 */
public class SessionInfo implements java.io.Serializable {

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
