package com.tap.DAO;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {
	   void addMenu(Menu menu);
	   void updateMenu(Menu menu);
	   void deleteMenu(int id);
	   String getMenuName(int id);
	   int getMenuPrice(int id);
	   Menu getMenu(int id);
	   List<Menu> getAllByRestaurantId(int restaurantId);
//	   List<Menu> getAll();

}
