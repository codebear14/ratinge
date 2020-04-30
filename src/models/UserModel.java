package models;

public class UserModel {

    int userId;
    String name;
    String email;
    String userName;
    String password;

    public UserModel(String name, String email, String userName, String password) {
        this.name = name;
        this.email = email;
        this.userName = userName;
        this.password = password;
    }

    public UserModel(int userId, String name, String email, String userName) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }
}
