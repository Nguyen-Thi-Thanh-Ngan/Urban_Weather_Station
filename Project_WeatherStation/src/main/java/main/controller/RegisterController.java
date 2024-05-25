package main.controller;

import main.DAO.UserDAO;
import main.model.User;
import main.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private User user;
    private UserDAO userDAO;
    private UserService userService;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String idUser = "u_" + idUserRandom();

        userService = UserService.getInstance();
        userDAO = new UserDAO();
        try {
            if (!userService.isUserNameExist(username)) {
                user = new User(idUser, email, username, password);
                userDAO.insert(user);
                request.setAttribute("success", "");
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Người dùng đã tồn tại");
                request.getRequestDispatcher("dangky.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public String idUserRandom() {
        Random random = new Random();
        int rdNumber = random.nextInt(900) + 100;
        return String.valueOf(rdNumber);
    }
}
