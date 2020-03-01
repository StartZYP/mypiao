package com.startzyp.github.mypiao.controller;

import com.google.gson.Gson;
import com.startzyp.github.mypiao.entity.Foder;
import com.startzyp.github.mypiao.entity.Prentity;
import com.startzyp.github.mypiao.entity.Product;
import com.startzyp.github.mypiao.service.interfaces.FoderService;
import com.startzyp.github.mypiao.service.interfaces.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private FoderService foderService;

    @Autowired
    private ProductService productService;


    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(){
        return "newpiao";
    }

    @RequestMapping(value="/add",method=RequestMethod.GET)
    public String add() {
        return "add";
    }


    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String add(@Param("productname") String productname,@Param("num") String num,@Param("introduction") String introduction,@Param("addr") String addr,@Param("groupname") String groupname,@Param("dates") String dates,@Param("types") String types,@Param("price") String price) throws ParseException {
        System.out.print("进入");
        Timestamp ts = Timestamp.valueOf(dates);
        Product product = new Product(null,productname,addr,"0",types,groupname,introduction,Integer.parseInt(num),ts,Double.parseDouble(price));
        //System.out.print(new Product(null,productname,introduction,addr,groupname,date,Integer.parseInt(num),types,Double.parseDouble(price),"0"));
        productService.insert(product);
        return "add";
    }

    @RequestMapping(value="/delete",method= RequestMethod.GET)
    public void deleteProduct(@Param("pid")int pid){
        productService.DeleteProduct(pid);
    }

    @RequestMapping(value="/listall",method=RequestMethod.GET)
    public void listProduct(ServletResponse response) throws IOException {
        List<Product> list = productService.listProduct();
        List<Prentity> list1 = new ArrayList<>();
        for (Product product:list){
            list1.add(new Prentity(product.getPid(),product.getProductname(),product.getIntroduction(),product.getAddr(),product.getGroupname(),new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(product.getDates()).trim(),product.getNum(),product.getTypes(),product.getPrice(),product.getIsDelete()));
        }
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(list1));
    }

    @RequestMapping(value = "/buy",method = RequestMethod.POST)
    public void buy(@Param("productname") String productname,@Param("uid") String uid,@Param("addr") String addr,@Param("groupname") String groupname,@Param("types") String types,@Param("price") String price,@Param("buydate") String buydate){
        Foder foder = new Foder(null, uid, productname, addr, groupname, types, Double.parseDouble(price), Timestamp.valueOf(buydate), "未出票");
        foderService.insert(foder);
    }


}
