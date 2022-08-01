/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author DUC THINH
 */
public class Validate {
    private static Pattern pattern;
    private Matcher matcher;

    private static final String EMAIL_REGEX = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";

    public Validate() {
        pattern = Pattern.compile(EMAIL_REGEX);
    }

    public boolean validateEmail(String regex) {
        matcher = pattern.matcher(regex);
        return matcher.matches();
    }

    public boolean checkPhone(String str) {
        // Bieu thuc chinh quy mo ta dinh dang so dien thoai
        String reg = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
        // Kiem tra dinh dang
        boolean kt = str.matches(reg);
        return kt;
    }
    
    public boolean checkDiscount(String discount_raw){
        try {
            float discount = Float.parseFloat(discount_raw);
            if(discount>=0 && discount<=1){
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }
}
