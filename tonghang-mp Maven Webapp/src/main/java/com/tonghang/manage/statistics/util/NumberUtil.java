package com.tonghang.manage.statistics.util;

import java.text.DecimalFormat;

public class NumberUtil {

	public static String floatToPercent(double object){
		 DecimalFormat df = new DecimalFormat("0.00%");
	     return df.format(object);
	}
}
