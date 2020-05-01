package models;

public class Comment {

    String userFullName;
    String userName;
    String comment;
    String dateTime;

    public Comment(String userFullName, String userName, String comment, String dateTime) {
        this.userFullName = userFullName;
        this.userName = userName;
        this.comment = comment;
        this.dateTime = dateTime;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public String getUserName() {
        return userName;
    }

    public String getComment() {
        return comment;
    }

    public String getDateTime() {
        return dateTime;
    }
}
