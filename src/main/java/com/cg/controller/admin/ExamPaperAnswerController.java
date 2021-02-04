package com.cg.controller.admin;

import com.cg.entity.admin.*;
import com.cg.page.admin.Page;
import com.cg.service.admin.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: 试卷答题管理后台控制器
 * @author: cg
 **/
@Controller
@RequestMapping("/admin/examPaperAnswer")
public class ExamPaperAnswerController {

    @Autowired
    private ExamPaperAnswerService examPaperAnswerService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ExamService examService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private LogService logService;

    /**
     * 试卷答题列表页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(ModelAndView model, @RequestParam(name = "userId") Integer userId) {
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("offset", 0);
        queryMap.put("pageSize", 99999);
        if (userId != 1) {
            List<Subject> subjects = subjectService.findByUserId(userId);
            queryMap.put("subjects", subjects);
        }
        model.addObject("examList", examService.findList(queryMap));
        model.addObject("studentList", studentService.findList(queryMap));
        model.addObject("questionList", questionService.findList(queryMap));
        model.setViewName("examPaperAnswer/list");
        return model;
    }
    /**
     * 删除答题信息
     *
     * @param requestMap
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> delete(@RequestBody Map<String, Object> requestMap) {
        List<ExamPaperAnswer> examPaperAnswers = (List<ExamPaperAnswer>) requestMap.get("examPaperAnswers");
        Integer userId = (Integer) requestMap.get("userId");
        Map<String, String> ret = new HashMap<String, String>();
        if (examPaperAnswers == null || examPaperAnswers.size() <= 0) {
            ret.put("type", "error");
            ret.put("msg", "请选择要删除的数据!");
            return ret;
        }
        try {
            if (examPaperAnswerService.delete(examPaperAnswers) <= 0) {
                ret.put("type", "error");
                ret.put("msg", "删除失败，请联系管理员!");
                return ret;
            }
        } catch (Exception e) {
            ret.put("type", "error");
            ret.put("msg", "该考试下存在试卷或考试记录信息，不能删除!");
            return ret;
        }

        ret.put("type", "success");
        ret.put("msg", "删除成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        examPaperAnswers.forEach(examPaperAnswer -> {
            logService.add("管理员{" + role.getName() + ":" + user.getUsername() + "} 删除{Id为" + examPaperAnswer.getId() + "}的考生答题项成功!");
        });
        return ret;
    }

    /**
     * 模糊搜索分页显示列表查询
     *
     * @param examId
     * @param studentId
     * @param questionId
     * @param page
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(name = "examId", required = false) Integer examId,
            @RequestParam(name = "studentId", required = false) Integer studentId,
            @RequestParam(name = "questionId", required = false) Integer questionId,
            @RequestParam(name = "userId") Integer userId,
            Page page
    ) {
        Map<String, Object> ret = new HashMap();
        Map<String, Object> queryMap = new HashMap();
        if (examId != null) {
            queryMap.put("examId", examId);
        }
        if (studentId != null) {
            queryMap.put("studentId", studentId);
        }
        if (questionId != null) {
            queryMap.put("questionId", questionId);
        }
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        if (userId != 1) {
            Map<String, Object> map = new HashMap<String, Object>();
            List<Subject> subjects = subjectService.findByUserId(userId);
            map.put("subjects", subjects);
            List<Exam> exams = examService.findList(map);
            queryMap.put("exams", exams);
        }
        ret.put("rows", examPaperAnswerService.findList(queryMap));
        ret.put("total", examPaperAnswerService.getTotal(queryMap));
        return ret;
    }
}
