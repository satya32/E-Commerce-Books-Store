package DAO;

import users.UserEntity;

public interface userdao {
public boolean userRegister(UserEntity us);
public UserEntity login(String email,String password);
public boolean checkPassword(int id,String pas);
public boolean updateProfile(UserEntity us);
public boolean checkUser(String email);
}
