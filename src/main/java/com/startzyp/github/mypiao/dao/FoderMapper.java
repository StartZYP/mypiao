package com.startzyp.github.mypiao.dao;

import com.startzyp.github.mypiao.entity.Foder;

import java.util.List;

public interface FoderMapper {

    int insert(Foder foder);

    int Updata(int pid);

    List<Foder> listfoderall();

    List<Foder> listfoder(String uid);
}
