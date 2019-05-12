package com.poetry.global;

import com.poetry.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GlobalInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String servletPath = request.getServletPath();
        if (servletPath.contains("writePage")) {
            //登录才能写诗
            if (request.getSession().getAttribute("user") != null) {
                return true;
            } else {
                request.setAttribute("error", "登录后才能写诗哦,赶紧登录吧");
                request.getSession().setAttribute("writePage", "1");
                request.getRequestDispatcher("/loginPage").forward(request, response);
                return false;
            }
        } else {
            if(servletPath.contains("admin"))
            {
                //管理员界面
                User user = (User) request.getSession().getAttribute("user");
                if(user!=null&&user.getType()==1)
                {
                    return true;
                }
                response.sendRedirect("/loginPage");
                return false;
            }
            //非法访问网址,调到登录界面
            if (servletPath.contains("comment") || servletPath.contains("write")||servletPath.contains("message")||
                    servletPath.contains("update")||servletPath.contains("logout")||servletPath.contains("zone") ||servletPath.contains("delete")||servletPath.contains("edit") ) {
                if (request.getSession().getAttribute("user") != null) {
                    return true;
                } else {
                    response.sendRedirect("/loginPage");
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
