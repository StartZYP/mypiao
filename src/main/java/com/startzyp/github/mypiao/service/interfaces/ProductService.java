package com.startzyp.github.mypiao.service.interfaces;

import com.startzyp.github.mypiao.entity.Product;

import java.util.List;

public interface ProductService {
    int insert(Product record);

//    int updateByPrimaryKey(Product record);

    List<Product> listProduct();

    int DeleteProduct(int id);
//
//    Product GetProduct(int id);

}
