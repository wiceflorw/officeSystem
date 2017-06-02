package Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by BF on 2017/4/19.
 */
public class Interceptor implements HandlerInterceptor
{
    public String defultLogin="/login.jsp";//默认登录页面
    private List<String> excludeUrls;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception
    {
        System.out.println("进入preHandle方法");
        //获取请求url
        String requestUrl = httpServletRequest.getRequestURI();
        //如果请求url与忽略拦截url相同，则直接返回ture
        for (String url:excludeUrls)
        {
            if (requestUrl.endsWith(url)){
                return true;
            }
        }
        if(httpServletRequest.getSession().getAttribute("em")!=null)
        {
            return true;
        }
        else
        {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+defultLogin);
            return false;
        }
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception
    {
        System.out.println("进入postHandle方法");
    }
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception
    {
         System.out.println("进入afterCompletion方法");
    }

    //生成不被拦截的urlset方法，get方法可忽略
    public void setExcludeUrls(List excludeUrls)
    {
        this.excludeUrls = excludeUrls;
    }
}
