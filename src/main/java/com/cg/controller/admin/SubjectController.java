package com.cg.controller.admin;

import com.cg.entity.admin.Subject;
import com.cg.page.admin.Page;
import com.cg.service.admin.SubjectService;
import com.cg.service.admin.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: 学科专业管理后台控制器
 * @author: cg
 **/

@RequestMapping("/admin/subject")
@Controller
public class SubjectController {

    @Autowired
    SubjectService subjectService;

    @Autowired
    UserService userService;

    /**
     * 学科专业列表页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(ModelAndView model) {
        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("roleId", 3);
        model.addObject("userList", userService.findList(queryMap));
        model.setViewName("subject/list");
        return model;
    }

    /**
     * 模糊搜索分页显示列表查询
     *
     * @param name
     * @param page
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(name = "name", defaultValue = "") String name,
            @RequestParam(name = "userId", defaultValue = "") Integer userId,
            Page page
    ) {
        Map<String, Object> ret = new HashMap<>();
        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("name", name);
        queryMap.put("userId", userId);
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        ret.put("rows", subjectService.findList(queryMap));
        ret.put("total", subjectService.getTotal(queryMap));
        return ret;
    }

    /**
     * 添加学科专业
     *
     * @param subject
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> add(Subject subject) {
        Map<String, String> ret = new HashMap<String, String>();
        if (subject == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的学科信息!");
            return ret;
        }
        if (StringUtils.isEmpty(subject.getName())) {
            ret.put("type", "error");
            ret.put("msg", "请填写学科名称!");
            return ret;
        }
        if (subjectService.add(subject) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "添加失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "添加成功!");
        return ret;
    }

    /**
     * 编辑学科专业
     *
     * @param subject
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> edit(Subject subject) {
        Map<String, String> ret = new HashMap<String, String>();
        if (subject == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的学科信息!");
            return ret;
        }
        if (StringUtils.isEmpty(subject.getName())) {
            ret.put("type", "error");
            ret.put("msg", "请填写学科名称!");
            return ret;
        }
        if (subjectService.edit(subject) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "编辑失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "编辑成功!");
        return ret;
    }

    /**
     * 删除学科专业
     *
     * @param subjects
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> delete(@RequestBody List<Subject> subjects) {
        Map<String, String> ret = new HashMap<String, String>();
        if (subjects == null || subjects.size() <= 0) {
            ret.put("type", "error");
            ret.put("msg", "请选择要删除的数据!");
            return ret;
        }
        try {
            if (subjectService.delete(subjects) <= 0) {
                ret.put("type", "error");
                ret.put("msg", "删除失败，请联系管理员!");
                return ret;
            }
        } catch (Exception e) {
            ret.put("type", "error");
            ret.put("msg", "该学科下存在考生信息，不能删除!");
            return ret;
        }

        ret.put("type", "success");
        ret.put("msg", "删除成功!");
        return ret;
    }

}
