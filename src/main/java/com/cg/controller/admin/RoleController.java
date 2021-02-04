package com.cg.controller.admin;

import com.cg.entity.admin.Authority;
import com.cg.entity.admin.Menu;
import com.cg.entity.admin.Role;
import com.cg.entity.admin.User;
import com.cg.page.admin.Page;
import com.cg.service.admin.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 角色role控制器
 * @author cg
 *
 */
@RequestMapping("/admin/role")
@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;

	@Autowired
	private AuthorityService authorityService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private LogService logService;

	@Autowired
	private UserService userService;

	/**
	 * 角色列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("/role/list");
		return model;
	}


	/**
	 * 获取角色列表
	 * @param page
	 * @param name
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(Page page,
									   @RequestParam(name="name",required=false,defaultValue="") String name
	){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", roleService.findList(queryMap));
		ret.put("total", roleService.getTotal(queryMap));
		return ret;
	}

	/**
	 * 角色添加
	 * @param role
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Role role, Integer userId){
		Map<String, String> ret = new HashMap<>();
		if(role == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的角色信息！");
			return ret;
		}
		if(StringUtils.isEmpty(role.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写角色名称！");
			return ret;
		}
		if(roleService.add(role) <= 0){
			ret.put("type", "error");
			ret.put("msg", "角色添加失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "角色添加成功！");
		User user = userService.findById(userId);
		Role adminRole = roleService.find(user.getRoleId());
		logService.add("管理员{" + adminRole.getName() + ":" + user.getUsername() + "} 添加{" + role.getName() + "，Id为" + role.getId() + "}角色成功!");
		return ret;
	}

	/**
	 * 角色修改
	 * @param role
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Role role, Integer userId){
		Map<String, String> ret = new HashMap<String, String>();
		if(role == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的角色信息！");
			return ret;
		}
		if(StringUtils.isEmpty(role.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写角色名称！");
			return ret;
		}
		if(roleService.edit(role) <= 0){
			ret.put("type", "error");
			ret.put("msg", "角色修改失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "角色修改成功！");
		User user = userService.findById(userId);
		Role adminRole = roleService.find(user.getRoleId());
		logService.add("管理员{" + adminRole.getName() + ":" + user.getUsername() + "} 更新{" + role.getName() + "，Id为" + role.getId() + "}角色成功!");
		return ret;
	}

	/**
	 * 删除角色信息
	 * @param requestMap
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public Map<String, String> delete(@RequestBody Map<String, Object> requestMap){
		List<Role> roles = (List<Role>) requestMap.get("roles");
		Integer userId = (Integer) requestMap.get("userId");
		Map<String, String> ret = new HashMap<String, String>();
		if(roles == null || roles.size() <= 0){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的角色！");
			return ret;
		}
		try {
			if(roleService.delete(roles) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员！");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			ret.put("type", "error");
			ret.put("msg", "该角色下存在权限或者用户信息，不能删除！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "角色删除成功！");
		User user = userService.findById(userId);
		Role adminRole = roleService.find(user.getRoleId());
		roles.forEach(role -> {
			logService.add("管理员{" + adminRole.getName() + ":" + user.getUsername() + "} 删除{" + role.getName() + "，Id为" + role.getId() + "}角色成功!");
		});
		return ret;
	}

	/**
	 * 获取所有的菜单信息
	 * @return
	 */
	@RequestMapping(value="/get_all_menu",method=RequestMethod.POST)
	@ResponseBody
	public List<Menu> getAllMenu(){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 99999);
		return menuService.findList(queryMap);
	}

	/**
	 * 编辑权限
	 * @param ids
	 * @param roleId
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/add_authority",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> addAuthority(
			@RequestParam(name="ids",required=true) String ids,
			@RequestParam(name="roleId",required=true) Integer roleId,
			@RequestParam(name = "userId",required = true) Integer userId
	){
		Map<String,String> ret = new HashMap<String, String>();
		if(StringUtils.isEmpty(ids)){
			authorityService.deleteByRoleId(roleId);
			ret.put("type", "success");
			ret.put("msg", "权限编辑成功！");
			return ret;
		}
		if(roleId == null){
			ret.put("type", "error");
			ret.put("msg", "请选择相应的角色！");
			return ret;
		}
		if(ids.contains(",")){
			ids = ids.substring(0,ids.length()-1);
		}
		String[] idArr = ids.split(",");
		if(idArr.length > 0){
			authorityService.deleteByRoleId(roleId);
		}
		for(String id:idArr){
			Authority authority = new Authority();
			authority.setMenuId(Integer.valueOf(id));
			authority.setRoleId(roleId);
			authorityService.add(authority);
		}
		ret.put("type", "success");
		ret.put("msg", "权限编辑成功！");
		User user = userService.findById(userId);
		Role adminRole = roleService.find(user.getRoleId());
		Role role = roleService.find(roleId);
		logService.add("管理员{" + adminRole.getName() + ":" + user.getUsername() + "} 修改{" + role.getName() + "，Id为" + role.getId() + "}角色的权限为{权限ids为("+ids+")}!");
		return ret;
	}

	/**
	 * 获取某个角色的所有权限
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/get_role_authority",method=RequestMethod.POST)
	@ResponseBody
	public List<Authority> getRoleAuthority(@RequestParam(name="roleId",required=true) Integer roleId){
		return authorityService.findListByRoleId(roleId);
	}
}