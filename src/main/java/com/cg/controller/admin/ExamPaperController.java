package com.cg.controller.admin;

import com.cg.entity.admin.*;
import com.cg.page.admin.Page;
import com.cg.service.admin.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: OnlineExam->ExamPaperController
 * @description: 试卷管理后台控制器
 * @author: cg
 * @create: 2020-01-12 23:16
 **/
@Controller
@RequestMapping("/admin/examPaper")
public class ExamPaperController {

    @Autowired
    private ExamPaperService examPaperService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ExamService examService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private LogService logService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    /**
     * 试卷列表页面
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
        model.setViewName("examPaper/list");
        return model;
    }

    /**
     * 模糊搜索分页显示列表查询
     *
     * @param examId
     * @param studentId
     * @param status
     * @param page
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(name = "examId", required = false) Integer examId,
            @RequestParam(name = "studentId", required = false) Integer studentId,
            @RequestParam(name = "status", required = false) Integer status,
            @RequestParam(name = "userId") Integer userId,
            Page page
    ) {
        Map<String, Object> ret = new HashMap<String, Object>();
        Map<String, Object> queryMap = new HashMap<String, Object>();
        if (examId != null) {
            queryMap.put("examId", examId);
        }
        if (studentId != null) {
            queryMap.put("studentId", studentId);
        }
        if (status != null) {
            queryMap.put("status", status);
        }
        if (userId != 1) {
            Map<String, Object> map = new HashMap<String, Object>();
            List<Subject> subjects = subjectService.findByUserId(userId);
            map.put("subjects", subjects);
            List<Exam> exams = examService.findList(map);
            queryMap.put("exams", exams);
        }
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        ret.put("rows", examPaperService.findList(queryMap));
        ret.put("total", examPaperService.getTotal(queryMap));
        return ret;
    }

    /**
     * 添加试卷
     *
     * @param examPaper
     * @param userId
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> add(ExamPaper examPaper, Integer userId) {
        Map<String, String> ret = new HashMap<String, String>();
        if (examPaper == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的试卷信息!");
            return ret;
        }
        if (examPaper.getExamId() == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择试卷所属考试!");
            return ret;
        }
        if (examPaper.getStudentId() == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择所属学生!");
            return ret;
        }
        if (examPaperService.add(examPaper) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "添加失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "添加成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        logService.add("管理员{" + role.getName() + ":" + user.getUsername() + "} 添加试卷{Id为"+examPaper.getId()+"}成功!");
        return ret;
    }

    /**
     * 编辑试卷
     *
     * @param examPaper
     * @param userId
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> edit(ExamPaper examPaper, Integer userId) {
        Map<String, String> ret = new HashMap<String, String>();
        if (examPaper == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的试卷信息!");
            return ret;
        }
        if (examPaper.getExamId() == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择试卷所属考试!");
            return ret;
        }
        if (examPaper.getStudentId() == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择所属学生!");
            return ret;
        }
        if (examPaperService.edit(examPaper) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "编辑失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "编辑成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        logService.add("管理员{" + role.getName() + ":" + user.getUsername() + "} 更新试卷{Id为"+examPaper.getId()+"}成功!");
        return ret;
    }

    /**
     * 删除试卷
     *
     * @param requestMap
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> delete(@RequestBody Map<String, Object> requestMap) {
        List<ExamPaper> examPapers = (List<ExamPaper>) requestMap.get("examPapers");
        Integer userId = (Integer) requestMap.get("userId");
        ObjectMapper mapper = new ObjectMapper();
        examPapers = mapper.convertValue(examPapers, new TypeReference<List<ExamPaper>>() {});
        Map<String, String> ret = new HashMap<String, String>();
        if (examPapers == null || examPapers.size() <= 0) {
            ret.put("type", "error");
            ret.put("msg", "请选择要删除的数据!");
            return ret;
        }
        try {
            if (examPaperService.delete(examPapers) <= 0) {
                ret.put("type", "error");
                ret.put("msg", "删除失败，请联系管理员!");
                return ret;
            }
        } catch (Exception e) {
            ret.put("type", "error");
            ret.put("msg", "该试卷下存在答题信息，不能删除!");
            return ret;
        }

        ret.put("type", "success");
        ret.put("msg", "删除成功!");
        User user = userService.findById(userId);
        Role role = roleService.find(user.getRoleId());
        examPapers.forEach(examPaper -> {
            logService.add("管理员{" + role.getName() + ":" + user.getUsername() + "} 删除试卷{Id为"+examPaper.getId()+"}成功!");
        });
        return ret;
    }
}
