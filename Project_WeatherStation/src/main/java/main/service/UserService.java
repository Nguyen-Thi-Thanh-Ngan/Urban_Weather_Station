package main.service;

import main.DAO.UserDAO;
import main.model.User;

import java.sql.SQLException;

public class UserService {
    private static UserService instance;
    private UserDAO userDAO;
    private User user;

    public static UserService getInstance(){
        if(instance == null)
            instance = new UserService();
        return instance;
    }

    public User checkLogin (String username, String password) throws SQLException {
        userDAO = new UserDAO();
        user = userDAO.getUserByUsername(username);
        if(user == null) return null;
        if(!user.getUserName().equals(username) || !user.getPassword().equals(password)) return null;
        return user;
    }

    public boolean isUserNameExist(String username) throws SQLException {
        userDAO = new UserDAO();
        user = userDAO.getUserByUsername(username);
        if (user == null) {
            return false;
        }
        return user.getUserName().equals(username);
    }

    public static void main(String[] args) throws SQLException {
        UserService u = new UserService();
        System.out.println(u.isUserNameExist("so5"));
    }
}
