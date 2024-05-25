package main.controller;

import main.DAO.UserDAO;
import main.model.User;
import main.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private UserDAO userDAO;
    private User user;
    private UserService userService;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        userService = UserService.getInstance();
        try {
            user = userService.checkLogin(username, password);
            if(user != null){
                request.setAttribute("success", "Đăng nhập thành công.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{
                request.setAttribute("error", "Bạn nhập sai username hoặc password.");
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
