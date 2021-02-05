package com.cg.controller.admin;

import com.cg.entity.admin.*;
import com.cg.page.admin.Page;
import com.cg.service.admin.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: 考生管理后台控制器
 * @author: cg
 **/
@Controller
@RequestMapping("/admin/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private LogService logService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    /**
     * 考生列表页面
     *
     * @param model
     * @param userId
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(ModelAndView model, @RequestParam(name = "userId") Integer userId) {
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("offset", 0);
        queryMap.put("pageSize", 99999);
        if (userId != 1) {
            queryMap.put("userId", userId);
        }
        model.addObject("subjectList", subjectService.findList(queryMap));
        model.setViewName("student/list");
        return model;
    }

    /**
     * 模糊搜索分页显示列表查询
     *
     * @param name
     * @param page
     * @param userId
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(name = "name", defaultValue = "") String name,
            @RequestParam(name = "subjectId", required = false) Integer subjectId,
            @RequestParam(name = "userId") Integer userId,
            Page page
    ) {
        Map<String, Object> ret = new HashMap<String, Object>();
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("name", name);
        if (subjectId != null) {
            queryMap.put("subjectId", subjectId);
        }
        if (userId != 1) {
            List<Subject> subjects = subjectService.findByUserId(userId);
            queryMap.put("subjects", subjects);
        }
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        ret.put("rows", studentService.findList(queryMap));
        ret.put("total", studentService.getTotal(queryMap));
        return ret;
    }

    /**
     * 添加考生
     *
     * @param requestMap
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> add(@RequestBody Map<String, Object> requestMap) {
        Map<String, String> ret = new HashMap<String, String>();
        ObjectMapper mapper = new ObjectMapper();
        Student student = mapper.convertValue(requestMap.get("student"), new TypeReference<Student>() {});
        Integer userId = (Integer) requestMap.get("userId");
        if (student == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的考生信息!");
            return ret;
        }
        if (StringUtils.isEmpty(student.getName())) {
            ret.put("type", "error");
            ret.put("msg", "请填写考生用户名!");
            return ret;
        }
        if (StringUtils.isEmpty(student.getPassword())) {
            ret.put("type", "error");
            ret.put("msg", "请填写考生密码!");
            return ret;
        }
        if (student.getSubjectId() == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择考生所属学科专业!");
            return ret;
        }
        student.setCreateTime(new Date());
        //添加之前判断登录名是否存在
        if (isExistName(student.getName(), -1)) {
            ret.put("type", "error");
            ret.put("msg", "该登录账号已经存在!");
            return ret;
        }
        if (studentService.add(student) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "添加失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "添加成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        logService.add("管理员 { " + role.getName() + " : " + user.getUsername() + " } 添加考生 { " + student + " }");
        return ret;
    }

    /**
     * 编辑考生
     *
     * @param requestMap
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> edit(@RequestBody Map<String, Object> requestMap) {
        Map<String, String> ret = new HashMap<String, String>();
        ObjectMapper mapper = new ObjectMapper();
        Student student = mapper.convertValue(requestMap.get("student"), new TypeReference<Student>() {});
        Integer userId = (Integer) requestMap.get("userId");
        Student oldStudent = studentService.findById(student.getId());
        if (student == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的学科信息!");
            return ret;
        }
        if (StringUtils.isEmpty(student.getName())) {
            ret.put("type", "error");
            ret.put("msg", "请填写考生用户名!");
            return ret;
        }
        if (StringUtils.isEmpty(student.getPassword())) {
            ret.put("type", "error");
            ret.put("msg", "请填写考生密码!");
            return ret;
        }
        if (student.getSubjectId() == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择考生所属学科专业!");
            return ret;
        }
        //编辑之前判断登录名是否存在
        if (isExistName(student.getName(), student.getId())) {
            ret.put("type", "error");
            ret.put("msg", "该登录账号已经存在!");
            return ret;
        }
        if (studentService.edit(student) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "编辑失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "编辑成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        logService.add("管理员 { " + role.getName() + " : " + user.getUsername() + " } 更新考生 { " + oldStudent + " } 为 { " + studentService.findById(student.getId()) + " }");
        return ret;
    }

    /**
     * 删除考生
     *
     * @param requestMap
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> delete(@RequestBody Map<String, Object> requestMap) {
        Map<String, String> ret = new HashMap<String, String>();
        List<Student> students = (List<Student>) requestMap.get("students");
        ObjectMapper mapper = new ObjectMapper();
        students = mapper.convertValue(students, new TypeReference<List<Student>>() {});
        Integer userId = (Integer) requestMap.get("userId");
        if (students == null || students.size() <= 0) {
            ret.put("type", "error");
            ret.put("msg", "请选择要删除的数据!");
            return ret;
        }
        try {
            if (studentService.delete(students) <= 0) {
                ret.put("type", "error");
                ret.put("msg", "删除失败，请联系管理员!");
                return ret;
            }
        } catch (Exception e) {
            ret.put("type", "error");
            ret.put("msg", "该考生下存在考试信息，不能删除!");
            return ret;
        }

        ret.put("type", "success");
        ret.put("msg", "删除成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        students.forEach(student -> {
            logService.add("管理员 { " + role.getName() + " : " + user.getUsername() + " } 删除考生 {" + student + " }");
        });
        return ret;
    }

    /**
     * 判断用户名是否存在
     *
     * @param name
     * @param id
     * @return
     */
    private boolean isExistName(String name, Integer id) {
        Student student = studentService.findByName(name);
        if (student == null) {
            return false;
        }
        if (student.getId().longValue() == id.longValue()) {
            return false;
        }
        return true;
    }

}
