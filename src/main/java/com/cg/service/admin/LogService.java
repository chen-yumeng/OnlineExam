package com.cg.service.admin;

import com.cg.entity.admin.Log;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 日志接口
 *
 * @author cg
 */
@Service
public interface LogService {

    /**
     * 日志插入操作
     *
     * @param log
     * @return
     */
    int add(Log log);

    /**
     * 日志内容插入操作
     *
     * @param content
     * @return
     */
    int add(String content);

    /**
     * 日志信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<Log> findList(Map<String, Object> queryMap);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    int getTotal(Map<String, Object> queryMap);

    /**
     * 删除日志信息
     *
     * @param ids
     * @return
     */
    int delete(String ids);
}
