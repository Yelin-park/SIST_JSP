package days07;

import java.text.DecimalFormat;

public class FormatUtil {
	// 기능은 같은 메서드임
	
	// 1. 인스턴스 메서드(객체를 생성해야 사용할 수 있는 메서드)ㄴ
	public String number(long number, String pattern) {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(number);
	}
	
	// 2. 정적(static) 메서드
	public static String staticNumber(long number, String pattern) {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(number);
	}
}
