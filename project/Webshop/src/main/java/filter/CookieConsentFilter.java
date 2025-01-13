//package filter;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.*;
//
//import java.io.IOException;
//
//@WebFilter("/*")
//public class CookieConsentFilter implements Filter {
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
//        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
//        boolean useCookie = false;
//        Object cookieConsent = null;
//
//        if (httpRequest.getSession(false) != null) {
//            cookieConsent = httpRequest.getSession(false).getAttribute("cookieConsent");
//        }
//
//        if (cookieConsent instanceof Boolean) {
//            useCookie = ((Boolean) cookieConsent);
//        } else if (httpRequest.getCookies() != null) {
//            for (Cookie cookie : httpRequest.getCookies()) {
//                if (cookie.getName().equals("cookieT")) {
//                    if (cookie.getValue().equals("true")) {
//                        useCookie = true;
//                    }
//                    break;
//                }
//            }
//        }
//
//        if (useCookie) {
//            filterChain.doFilter(httpRequest, httpResponse);
//        } else {
//            HttpServletRequest newRequest = new NoSessionHttpRequest(httpRequest);
//            filterChain.doFilter(newRequest, httpResponse);
//        }
//    }
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        Filter.super.init(filterConfig);
//    }
//
//    @Override
//    public void destroy() {
//        Filter.super.destroy();
//    }
//
//    private static class NoSessionHttpRequest extends HttpServletRequestWrapper {
//        public NoSessionHttpRequest(HttpServletRequest request) {
//            super(request);
//        }
//
//        @Override
//        public HttpSession getSession(boolean create) {
//            return null;
//        }
//
//        @Override
//        public HttpSession getSession() {
//            return null;
//        }
//    }
//
//}
package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class CookieConsentFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        HttpSession session = httpRequest.getSession(true); // luôn tạo session

        boolean useCookie = false;
        Object cookieConsent = session.getAttribute("cookieConsent");

        if (cookieConsent instanceof Boolean){
            useCookie = (Boolean) cookieConsent;
        }
        else if (httpRequest.getCookies() != null) {
            for (Cookie cookie : httpRequest.getCookies()) {
                if (cookie.getName().equals("cookieT")) {
                    if (cookie.getValue().equals("true")) {
                        useCookie = true;
                    }
                    break;
                }
            }
        }
        httpRequest.setAttribute("useCookie", useCookie);
        filterChain.doFilter(servletRequest, servletResponse);

    }
    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}