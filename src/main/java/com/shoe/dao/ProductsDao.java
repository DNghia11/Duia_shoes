package com.shoe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shoe.model.*;


public class ProductsDao {
	private Connection con;
	private String query;
	private PreparedStatement pr;
	private ResultSet rs;
	
	public ProductsDao(Connection con) {
		this.con = con;
	}
	
	public List<Products> getAllProducts(){
		List<Products> products = new ArrayList<Products>();
		try {
			query = "select * from products";
			pr = this.con.prepareStatement(query);
			rs = pr.executeQuery();
			while(rs.next()) {
				Products row = new Products();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return products;
	}
	
	public List<Products> getOne(int id){
		List<Products> products = new ArrayList<Products>();
		try {
			query = "select * from products where id = ?";
			pr = this.con.prepareStatement(query);
			pr.setInt(1, id);
			rs = pr.executeQuery();
			while(rs.next()) {
				Products row = new Products();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Carts> getCartProduts(ArrayList<Carts> cartList){
		List<Carts> book = new ArrayList<>();
		try {
			if(cartList.size() > 0) {
				for(Carts items : cartList) {
					query = "select * from products where id=?";
					pr = this.con.prepareStatement(query);
					pr.setInt(1,items.getId());
					rs = pr.executeQuery();
					while(rs.next()) {
						Carts row = new Carts();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*items.getQuantity());
						row.setImage(rs.getString("image"));
						row.setQuantity(items.getQuantity());
						book.add(row);
					}
				}
			}
		} catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
	}
	
	public double getTotolCart(ArrayList<Carts> cartsList) {
		double sum = 0;
		try {
			if(cartsList.size()>0) {
				for(Carts items : cartsList) {
					query = "select price from products where id=?";
					pr = this.con.prepareStatement(query);
					pr.setInt(1, items.getId());
					rs = pr.executeQuery();
					while(rs.next()) {
						sum+= rs.getDouble("price")*items.getQuantity();
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
}
