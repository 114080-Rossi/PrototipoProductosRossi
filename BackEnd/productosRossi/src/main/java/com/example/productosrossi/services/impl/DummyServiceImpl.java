package com.example.productosrossi.services.impl;


import com.example.productosrossi.models.Dummy;
import com.example.productosrossi.repositories.DummyRepository;
import com.example.productosrossi.services.DummyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service //Sea parte de aplication contect de spring
public class DummyServiceImpl implements DummyService { //Esto es una IMPLEMENTACION DE DummyService

    @Autowired //Cableamos con el repositorio
    private DummyRepository dummyRepository;


    @Override
    public Dummy getDummy(Long id) {
        return null;
    }

    @Override
    public List<Dummy> getDummyList() {
        return null;
    }

    @Override
    public Dummy createDummy(Dummy dummy) {
        return null;
    }

    @Override
    public Dummy updateDummy(Dummy dummy) {
        return null;
    }

    @Override
    public void deleteDummy(Dummy dummy) {

    }
}
