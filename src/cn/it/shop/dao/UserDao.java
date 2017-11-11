package cn.it.shop.dao;

import cn.it.shop.model.User;

public interface UserDao extends BaseDao<User> {
	
	public User login(User user);
	
	//判断login名是否重复
	public Long repeatLogin(String login);
	
	//注册新用户
	public void registerUser(User user);
}
