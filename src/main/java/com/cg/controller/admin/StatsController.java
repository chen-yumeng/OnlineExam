package com.cg.controller.admin;

import com.cg.entity.admin.Exam;
import com.cg.entity.admin.Role;
import com.cg.entity.admin.Subject;
import com.cg.entity.admin.User;
import com.cg.service.admin.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: 成绩统计控制器
 * @author: cg
 **/
@RequestMapping("/admin/stats")
@Controller
public class StatsController {

    @Autowired
    private ExamService examService;
    @Autowired
    private ExamPaperService examPaperService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private LogService logService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    /**
     * 成绩统计页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/exam_stats", method = RequestMethod.GET)
    public ModelAndView stats(ModelAndView model, @RequestParam(name = "userId") Integer userId) {
        Map<String, Object> queryMap = new HashMap();
        queryMap.put("offset", 0);
        queryMap.put("pageSize", 99999);
        if (userId != 1) {
            List<Subject> subjects = subjectService.findByUserId(userId);
            queryMap.put("subjects", subjects);
        }
        model.addObject("examList", examService.findList(queryMap));
        model.setViewName("stats/exam_stats");
        return model;
    }

    /**
     * 根据考试信息统计结果
     *
     * @param examId
     * @param userId
     * @return
     */
    @RequestMapping(value = "/get_stats", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getStats(Integer examId, Integer userId) {
        Map<String, Object> ret = new HashMap();
        if (examId == null) {
            ret.put("type", "error");
            ret.put("msg", "选择要统计的考试信息！");
            return ret;
        }
        List<Map<String, Object>> examStats = examPaperService.getExamStats(examId);
        ret.put("type", "success");
        ret.put("msg", "统计成功！");
        ret.put("studentList", getListByMap(examStats, "sname"));
        ret.put("studentScore", getListByMap(examStats, "score"));
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        Exam exam = examService.findById(examId);
        logService.add("管理员{" + role.getName() + ":" + user.getUsername() + "} 查询了{" + exam.getName() + "，Id为" + exam.getId() + "}的考试图表数据!");
        return ret;
    }

    private List<Object> getListByMap(List<Map<String, Object>> mapList, String key) {
        List<Object> ret = new ArrayList();
        for (Map<String, Object> map : mapList) {
            ret.add(map.get(key));
        }
        return ret;
    }
}
