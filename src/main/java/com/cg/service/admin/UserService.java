package com.cg.service.admin;

import com.cg.entity.admin.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * user用户service
 * @author cg
 *
 */
@Service
public interface UserService {

	/**
	 * 根据用户名查找用户
	 *
	 * @param username
	 * @return
	 */
	User findByUsername(String username);

	/**
	 * 添加用户
	 *
	 * @param user
	 * @return
	 */
	int add(User user);

	/**
	 * 修改用户
	 *
	 * @param user
	 * @return
	 */
	int edit(User user);

	/**
	 * 修改用户密码
	 *
	 * @param user
	 * @return
	 */
	int editPassword(User user);

	/**
	 * 删除用户
	 *
	 * @param ids
	 * @return
	 */
	int delete(String ids);

	/**
	 * 分页获取用户列表
	 *
	 * @param queryMap
	 * @return
	 */
	List<User> findList(Map<String, Object> queryMap);

	/**
	 * 获取符合结果的总记录数
	 *
	 * @param queryMap
	 * @return
	 */
	int getTotal(Map<String, Object> queryMap);

	/**
	 * 根据用户id查找用户
	 * @param userId
	 * @return
	 */
    User findById(Integer userId);
}
