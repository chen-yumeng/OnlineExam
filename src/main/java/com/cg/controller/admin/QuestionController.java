package com.cg.controller.admin;

import com.cg.entity.admin.Question;
import com.cg.entity.admin.Subject;
import com.cg.page.admin.Page;
import com.cg.service.admin.QuestionService;
import com.cg.service.admin.SubjectService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: 试题管理后台控制器
 * @author: cg
 **/

@Controller
@RequestMapping("/admin/question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private SubjectService subjectService;

    /**
     * 试题列表页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(ModelAndView model, @RequestParam(name = "userId") Long userId) {
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("offset", 0);
        queryMap.put("pageSize", 99999);
        if (userId != 1) {
            queryMap.put("userId", userId);
        }
        model.addObject("subjectList", subjectService.findList(queryMap));
        model.setViewName("question/list");
        return model;
    }

    /**
     * 模糊搜索分页显示列表查询
     *
     * @param title
     * @param page
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(name = "title", defaultValue = "") String title,
            @RequestParam(name = "questionType", required = false) Integer questionType,
            @RequestParam(name = "subjectId", required = false) Long subjectId,
            @RequestParam(name = "userId") Long userId,
            Page page
    ) {
        Map<String, Object> ret = new HashMap<>();
        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("title", title);
        if (userId != 1) {
            List<Subject> subjects = subjectService.findByUserId(userId);
            queryMap.put("subjects", subjects);
        }
        if (questionType != null) {
            queryMap.put("questionType", questionType);
        }
        if (subjectId != null) {
            queryMap.put("subjectId", subjectId);
        }
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        ret.put("rows", questionService.findList(queryMap));
        ret.put("total", questionService.getTotal(queryMap));
        return ret;
    }

    /**
     * 添加试题
     *
     * @param question
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> add(Question question) {
        Map<String, String> ret = new HashMap<>();
        if (question == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的试题信息!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getTitle())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题题目!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getAnswer())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题正确答案!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getAttrA())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题选项A!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getAttrB())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题选项B!");
            return ret;
        }
        question.setCreateTime(new Date());
        question.setScoreByType();
        if (questionService.add(question) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "添加失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "添加成功!");
        return ret;
    }

    /**
     * 编辑试题
     *
     * @param question
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> edit(Question question) {
        Map<String, String> ret = new HashMap<>();
        if (question == null) {
            ret.put("type", "error");
            ret.put("msg", "请填写正确的试题信息!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getTitle())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题题目!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getAnswer())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题正确答案!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getAttrA())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题选项A!");
            return ret;
        }
        if (StringUtils.isEmpty(question.getAttrB())) {
            ret.put("type", "error");
            ret.put("msg", "请填写试题选项B!");
            return ret;
        }
        question.setScoreByType();
        if (questionService.edit(question) <= 0) {
            ret.put("type", "error");
            ret.put("msg", "编辑失败，请联系管理员!");
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "编辑成功!");
        return ret;
    }

    /**
     * 删除试题
     *
     * @param questions
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public Map<String, String> delete(@RequestBody List<Question> questions) {
        Map<String, String> ret = new HashMap();
        if (questions == null || questions.size() <= 0) {
            ret.put("type", "error");
            ret.put("msg", "请选择要删除的数据!");
            return ret;
        }
        try {
            if (questionService.delete(questions) <= 0) {
                ret.put("type", "error");
                ret.put("msg", "删除失败，请联系管理员!");
                return ret;
            }
        } catch (Exception e) {
            ret.put("type", "error");
            ret.put("msg", "该试题下存在考试信息，不能删除!");
            return ret;
        }

        ret.put("type", "success");
        ret.put("msg", "删除成功!");
        return ret;
    }

    /**
     * 上传文件批量导入试题
     *
     * @param excelFile
     * @return
     */
    @RequestMapping(value = "upload_file", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> uploadFile(MultipartFile excelFile, Long subjectId) {
        Map<String, String> ret = new HashMap<>();
        if (excelFile == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择文件!");
            return ret;
        }
        if (subjectId == null) {
            ret.put("type", "error");
            ret.put("msg", "请选择所属科目!");
            return ret;
        }
        if (excelFile.getSize() > 5000000) {
            ret.put("type", "error");
            ret.put("msg", "文件大小不要超过5M!");
            return ret;
        }
        String suffix = excelFile.getOriginalFilename().substring(excelFile.getOriginalFilename().lastIndexOf(".") + 1, excelFile.getOriginalFilename().length());
        if (!"xls,xlsx".contains(suffix)) {
            ret.put("type", "error");
            ret.put("msg", "请上传最新xls,xlsx格式的文件!");
            return ret;
        }
        String msg = "导入成功";
        try {
            msg = readExcel(excelFile.getInputStream(), subjectId);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if ("".equals(msg)) {
            msg = "全部导入成功";
        }
        ret.put("type", "success");
        ret.put("msg", msg);
        return ret;
    }

    /**
     * 读取excel文件，并插入到数据库
     *
     * @param fileInputStream
     * @return
     */
    private String readExcel(InputStream fileInputStream, Long subjectId) {
        String msg = "";
        try {
            HSSFWorkbook hssfWorkbook = new HSSFWorkbook(fileInputStream);
            HSSFSheet sheetAt = hssfWorkbook.getSheetAt(0);
            if (sheetAt.getLastRowNum() <= 0) {
                msg = "该文件为空";
            }
            for (int rowIndex = 1; rowIndex <= sheetAt.getLastRowNum(); rowIndex++) {
                Question question = new Question();
                HSSFRow row = sheetAt.getRow(rowIndex);
                if (row.getCell(0) == null) {
                    msg += "第" + rowIndex + "行，试题类型为空，跳过<br/>";
                    continue;
                }
                Double numericCellValue = row.getCell(0).getNumericCellValue();
                question.setQuestionType(numericCellValue.intValue());
                if (row.getCell(1) == null) {
                    msg += "第" + rowIndex + "行，题目为空，跳过<br/>";
                    continue;
                }
                question.setTitle(row.getCell(1).getStringCellValue());
                if (row.getCell(2) == null) {
                    msg += "第" + rowIndex + "行，分值为空，跳过<br/>";
                    continue;
                }
                numericCellValue = row.getCell(2).getNumericCellValue();
                question.setScore(numericCellValue.intValue());
                if (row.getCell(3) == null) {
                    msg += "第" + rowIndex + "行，选项A为空，跳过<br/>";
                    continue;
                }
                question.setAttrA(row.getCell(3).getStringCellValue());
                if (row.getCell(4) == null) {
                    msg += "第" + rowIndex + "行，选项B为空，跳过<br/>";
                    continue;
                }
                question.setAttrB(row.getCell(4).getStringCellValue());
                question.setAttrC(row.getCell(5) == null ? "" : row.getCell(5).getStringCellValue());
                question.setAttrD(row.getCell(6) == null ? "" : row.getCell(6).getStringCellValue());
                if (row.getCell(7) == null) {
                    msg += "第" + rowIndex + "行，正确答案为空，跳过\n";
                    continue;
                }
                question.setAnswer(row.getCell(7).getStringCellValue());
                question.setCreateTime(new Date());
                question.setSubjectId(subjectId);
                if (questionService.add(question) <= 0) {
                    msg += "第" + rowIndex + "行，插入数据库失败\n";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
}
