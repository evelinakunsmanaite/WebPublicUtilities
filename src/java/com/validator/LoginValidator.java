package com.validator;

import com.errors.LoginValidError;

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
