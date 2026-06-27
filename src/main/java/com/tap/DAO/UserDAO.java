package com.tap.DAO;

import java.util.List;

import com.tap.model.User;

public interface UserDAO {
   int addUser(User user);
   void updateUser(User user);
   void deleteUser(int id);
//   User getUser(int id);
   User getUser(String email);
   List<User> getAll();
}
