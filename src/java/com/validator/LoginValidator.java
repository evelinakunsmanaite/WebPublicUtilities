/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.validator;

import com.errors.LoginValidError;
import com.model.User;

/**
 *
 * @author Administrator
 */
public class LoginValidator {
     public static void validate(String email, String pass, LoginValidError error) {
      
         if (email.trim().length() == 0) {
            error.addError("user.login.error");            
        }
        
        if (pass.trim().length() == 0) {
            error.addError("user.pass.error");
        }
    }
}
