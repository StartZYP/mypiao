package com.startzyp.github.mypiao.service.impl;


import com.startzyp.github.mypiao.dao.ProductMapper;
import com.startzyp.github.mypiao.entity.Product;
import com.startzyp.github.mypiao.service.interfaces.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public int insert(Product record) {
        return productMapper.insert(record);
    }

//    @Override
//    public int updateByPrimaryKey(Product record) {
//        return productMapper.updateByPrimaryKey(record);
//    }
//
    @Override
    public List<Product> listProduct() {
        return productMapper.listProduct();
    }

    @Override
    public int DeleteProduct(int id) {
        return productMapper.DeleteProduct(id);
    }
//
//    @Override
//    public Product getProduct(int id) {
//        return productMapper.getProduct(id);
//    }
}
