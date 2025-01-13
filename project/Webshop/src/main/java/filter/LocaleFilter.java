package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

@WebFilter("/*")
public class LocaleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        String lang = request.getParameter("lang");

        if (lang != null) {
            if (lang.equals("en"))
            {
                session.setAttribute("lang", "en");
                session.setAttribute("locale", new Locale("en"));
            } else if(lang.equals("vi")){
                session.setAttribute("lang", "vi");
                session.setAttribute("locale", new Locale("vi"));
            }
        }
        else if (session.getAttribute("locale") == null)
        {
            session.setAttribute("locale", new Locale("vi"));
        }


        filterChain.doFilter(servletRequest, servletResponse);
    }
}