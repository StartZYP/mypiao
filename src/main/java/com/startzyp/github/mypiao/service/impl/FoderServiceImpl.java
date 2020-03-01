package com.startzyp.github.mypiao.service.impl;

import com.startzyp.github.mypiao.dao.FoderMapper;
import com.startzyp.github.mypiao.entity.Foder;
import com.startzyp.github.mypiao.service.interfaces.FoderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
@Service
public class FoderServiceImpl implements FoderService {
    @Autowired
    private FoderMapper foderMapper;

    @Override
    public int insert(Foder foder) {
        return foderMapper.insert(foder);
    }

    @Override
    public int Updata(int pid) {
        return foderMapper.Updata(pid);
    }

    @Override
    public List<Foder> listfoderall() {
        return foderMapper.listfoderall();
    }

    @Override
    public List<Foder> listfoder(String uid) {
        return foderMapper.listfoder(uid);
    }


}
