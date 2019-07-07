package com.shsxt.newbosses.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class TotalListener implements  HttpSessionListener
{
    
    public static int total=0;
    public static int histotal=0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // TODO Auto-generated method stub
        System.out.println("创建session");
        total++;
        histotal++;
        
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // TODO Auto-generated method stub
        System.out.println("销毁session");
        total--;
    }
}
