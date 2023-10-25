package com.listeners;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author Administrator
 */
@WebListener
public class SessionTimeOutListener implements HttpSessionListener {
     @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        int limit = 10;
        session.setMaxInactiveInterval(limit);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
    }
}
