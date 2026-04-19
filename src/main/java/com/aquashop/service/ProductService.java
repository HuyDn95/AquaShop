package com.aquashop.service;

import com.aquashop.dao.ProductDAO;
import com.aquashop.model.entity.Product;

import java.util.List;

public class ProductService {
    private final ProductDAO productDAO = new ProductDAO();

    public List<Product> getProductByCID(int cid) {
        return productDAO.getProductByCID(cid);
    }
    public List<Product> getAllProducts() {
        return productDAO.getAllProduct();
    }

    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    public void addProduct(Product product) {
        productDAO.insertProduct(product);
    }

    public void updateProduct(Product product) {
        productDAO.updateProduct(product);
    }

    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    public void updateCategoryForProducts(int categoryId, List<Integer> productIds) {
        productDAO.updateCategoryForProducts(categoryId, productIds);
    }
}
