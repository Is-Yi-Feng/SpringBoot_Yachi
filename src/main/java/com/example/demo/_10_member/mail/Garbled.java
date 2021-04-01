package com.example.demo._10_member.mail;

import java.util.Random;

public class Garbled {
	
	private String str = "Do!ng123";
	
	public String getStr() {
		return str;
	}
	
	public static String getGalbled(int n) {
		String string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";//儲存數字0-9 和 大小寫字母
		char[] ch = new char[n]; //宣告一個字元陣列物件ch 儲存 驗證碼
		for (int i = 0; i < n; i++) {
			Random random = new Random();//建立一個新的隨機數生成器
			int index = random.nextInt(string.length());//返回[0,string.length)範圍的int值    作用：儲存下標
			ch[i] = string.charAt(index);//charAt() : 返回指定索引處的 char 值   ==》儲存到字元陣列物件ch裡面
		}
		//將char陣列型別轉換為String型別儲存到result
		//String result = new String(ch);//方法一：直接使用構造方法      String(char[] value) ：分配一個新的 String，使其表示字元陣列引數中當前包含的字元序列。
		String result = String.valueOf(ch);//方法二： String方法   valueOf(char c) ：返回 char 引數的字串表示形式。
		return result;
	}


}
