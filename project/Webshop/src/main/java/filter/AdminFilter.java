package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

// cấu hinh bằng annotation
@WebFilter(filterName = "AdminAuthen", urlPatterns = {"/view/jsp/admin/*"})
public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        HttpSession session = httpServletRequest.getSession(false);

        if(session == null || session.getAttribute("user") == null) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/view/jsp/Login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        int id_role = user.getId_role();

        if(id_role == 2) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/view/jsp/FilterDenied.jsp");
        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
