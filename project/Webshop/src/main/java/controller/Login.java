package controller;

import dao.database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import util.Encrypt;

import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userDAO.getUserIfLogin(email, Encrypt.encrypt(password));
        //test
        System.out.println(user.getUsername());
        if (user != null) {
            // thong tin hop le thi tra ve 1 session tuy chinh
            HttpSession session = request.getSession(true); // true la tao session neu chưa có, lấy session nếu có
            session.setAttribute("user", user);

//            //Kiểm tra cookie consent người dùng có accept kh (giong header trong raf)
//            boolean useCookie = false;
//            if (request.getCookies() != null) {
//                for (Cookie cookie : request.getCookies()) {
//                    if (cookie.getName().equals("cookieT")) {
//                        if (cookie.getValue().equals("true")) {
//                            useCookie = true;
//                        }
//                        break;
//                    }
//                }
//            }

//            // neu khong dong y dung url rewriting
//            if (!useCookie) {
//                if (user.getId_role() == 1) {
//                    String url = response.encodeRedirectURL(request.getContextPath() + "/LoadProduct");
//                    response.sendRedirect(url);
//                } else {
//                    String url = response.encodeRedirectURL(request.getContextPath() + "/view/jsp/admin/Overview_admin.jsp");
//                    response.sendRedirect(url);
//                }
//            } else {
//                // neu dong y thi dùng cookie de quan ly session
//                if (user.getId_role() == 1) {
//                    response.sendRedirect(request.getContextPath() + "/LoadProduct");
//                } else {
//                    response.sendRedirect(request.getContextPath() + "/view/jsp/admin/Overview_admin.jsp");
//                }
//            }
//
//        } else {
//            request.setAttribute("error", "Tên đăng nhập và mật khẩu không khả dụng");
//            request.getRequestDispatcher("view/jsp/Login.jsp").forward(request, response);
//        }

            if (user != null) {
                // thong tin hop le thi tra ve 1 session tuy chinh
                session.setAttribute("user", user);

                String url;
                if (user.getId_role() == 1) {
                    url = response.encodeRedirectURL(request.getContextPath() + "/LoadProduct");
                } else {
                    url = response.encodeRedirectURL(request.getContextPath() + "/view/jsp/admin/Overview_admin.jsp");
                }
                response.sendRedirect(url);


            } else {
                request.setAttribute("error", "Tên đăng nhập và mật khẩu không khả dụng");
                request.getRequestDispatcher("view/jsp/Login.jsp").forward(request, response);
            }
        }
    }
}