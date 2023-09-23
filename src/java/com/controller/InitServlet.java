package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;


//import com.service.GrService;
//import com.service.impl.GrServiceImpl;

public abstract class InitServlet extends HttpServlet {
    private @Resource(name = "jdbc/GuestsDB")//испальзование листнера
    DataSource ds;
 

    @Override
    public void init() {//инициализация объектов с которыми работает сервлеты
       
    }            
}
    