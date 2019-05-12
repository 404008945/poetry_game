package com.poetry.global;

import com.poetry.entity.Message;
import com.poetry.entity.User;
import com.poetry.service.MessageService;
import com.poetry.service.PoetryService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//字符编码过滤器
public class EncodingFilter implements Filter {
    private String encoding="UTF-8";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String parameter = filterConfig.getInitParameter("encoding");
        if(parameter!=null)
        {
            encoding=parameter;
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest= (HttpServletRequest) request;
        HttpServletResponse httpServletResponse= (HttpServletResponse) response;
        httpServletRequest.setCharacterEncoding(encoding);
        httpServletResponse.setCharacterEncoding(encoding);
        HttpSession session = ((ServletRequestAttributes) (RequestContextHolder.getRequestAttributes())).getRequest().getSession();
        User user = (User) session.getAttribute("user");
        if(user!=null)
        {
            ApplicationContext context=new ClassPathXmlApplicationContext("spring-service.xml");
            MessageService service=context.getBean(MessageService.class);
            //更新未读消息数
            int count = service.getUnreadNum(user.getId());
            session.setAttribute("messageNum",count);
        }
        chain.doFilter(httpServletRequest,httpServletResponse);
    }

    @Override
    public void destroy() {
        encoding=null;
    }
}
