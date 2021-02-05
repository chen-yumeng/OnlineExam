package com.cg.util;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @author chenyumeng
 */
public class DateFormatUtil {

	/**
	 * 返回指定日志指定格式的日期字符串
	 * @param pattern
	 * @param date
	 * @return
	 */
	public static String getDate(String pattern,Date date){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	public static String getDate(Date date){
		return getDate("yyyy-MM-dd HH:mm:ss", date);
	}

}
