
package com.controller;

import com.dao.HouseDao;
import com.dao.UserDao;
import com.dao.impl.HouseDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.service.HouseService;
import com.service.UserService;
import com.service.impl.HouseServiceImpl;
import com.service.impl.UserServiceImpl;
import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;


public abstract class InitServlet extends HttpServlet {
    private @Resource(name = "jdbc/GuestsDB")//испальзование листнера
    DataSource dataSource;
    protected UserDao userDao;
    protected HouseDao houseDao;
    protected UserService userService;
    protected HouseService houseService;


 

    @Override
    public void init() {//инициализация объектов с которыми работает сервлеты
      userDao = new UserDaoImpl(dataSource);
        userService = new UserServiceImpl(userDao);  
        houseDao = new HouseDaoImpl(dataSource);
        houseService = new HouseServiceImpl(houseDao);
    }            
}
    
