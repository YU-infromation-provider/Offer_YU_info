package com.example.Haksik.User;

public class User {
    private String name;
    private String email;
    private String password;
    private String username;

    public User() {

    }
    public User(String name,String email,String password,String username){
        this.name=name;
        this.email=email;
        this.password=password;
        this.username=username;
    }

    public String getName(){
        return name;
    }
    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    public String getUsername(){
        return username;
    }
}
