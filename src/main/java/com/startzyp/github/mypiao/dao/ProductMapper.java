package com.startzyp.github.mypiao.dao;

import com.startzyp.github.mypiao.entity.Product;

import java.util.List;

public interface ProductMapper {

    int insert(Product record);

//    int updateByPrimaryKey(Product record);

    List<Product> listProduct();

    int DeleteProduct(int id);
//
//    Product getProduct(int id);

}
