package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter("/*")
public class URLRewritingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        HttpSession session = httpServletRequest.getSession(false);

        boolean hasCookie = hasCookie(httpServletRequest);
        if (!hasCookie && session != null) {
            HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(httpServletResponse) {
                @Override
                public String encodeURL(String url) {
                    HttpSession session = httpServletRequest.getSession(false);
                    if (session != null) {
                        String sessionId = session.getId();
                        return URLRewritingUtil.encodeURLWithSession(url, sessionId);
                    }
                    return super.encodeURL(url);
                }

                @Override
                public String encodeRedirectURL(String url) {
                    HttpSession session = httpServletRequest.getSession(false);
                    if (session != null) {
                        String sessionId = session.getId();
                        return URLRewritingUtil.encodeURLWithSession(url, sessionId);
                    }
                    return super.encodeRedirectURL(url);
                }
            };
            System.out.println("dung url");
            filterChain.doFilter(servletRequest, responseWrapper);
        } else {
            //Nếu cookie hoạt động thì kiểm tra xem url có session id không, nếu có thì xoá đi
            System.out.println("dung cookie");
            String requestURL = httpServletRequest.getRequestURL().toString();

            int semicolonIndex = requestURL.indexOf(';');
            if (semicolonIndex > -1) {
                String newURL = requestURL.substring(0, semicolonIndex);
                httpServletResponse.sendRedirect(newURL);
                return;
            }
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    private boolean hasCookie(HttpServletRequest httpServletRequest) {
        Cookie[] cookies = httpServletRequest.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
