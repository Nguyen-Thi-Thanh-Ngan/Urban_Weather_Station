package main.DAO;



import main.db.JDBIConnector;
import main.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Optional;


public class UserDAO {

    public static User getUserByUsername(String username) throws SQLException {
        Optional<User> user = JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select * from users where username = ?")
                .bind(0, username)
                .mapToBean(User.class).stream().findFirst()
        ));
        return user.isEmpty() ? null : user.get();
    }

    public static void main(String[] args) throws SQLException {
        UserDAO u = new UserDAO();
        System.out.println(getUserByUsername("so2"));

    }

    public int insert(User user){
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO users(id, email, username, password) VALUES (?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, user.getId());
            st.setString(2, user.getEmail());
            st.setString(3, user.getUserName());
            st.setString(4, user.getPassword());

            result = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + result + " dòng bị thay đổi!");

            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
