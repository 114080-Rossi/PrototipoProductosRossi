package com.example.productosrossi.controllers;


import com.example.productosrossi.dtos.DummyDto;
import com.example.productosrossi.models.Dummy;
import com.example.productosrossi.services.DummyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController//Esta clase va ser de restController
@RequestMapping("/dummy")
public class DummyController {

    @Autowired
    private DummyService dummyService; //inyeccion de dependencia

    @GetMapping("") //Mapeo de nuestro controlador
    public ResponseEntity<DummyDto> getDummyList(){
        List<Dummy> dummyList = dummyService.getDummyList();
        return null;
    }

    @GetMapping("/{id}") //En este recibimos un ID como parametro
    public ResponseEntity<DummyDto> getDummyList(@PathVariable Long id){ //Hay que incluir el @PathVariable si no, nos va a tomar el id
        Dummy dummy = dummyService.getDummy(id);
        return null;
    }

    @PostMapping("")
    public ResponseEntity<DummyDto> createDummy(DummyDto dummyDto){
        Dummy dummy = dummyService.createDummy(null);
        return null;
    }

    @PutMapping("")
    public ResponseEntity<DummyDto> updateDummy(DummyDto dummyDto){
        Dummy dummy = dummyService.updateDummy(null);
        return null;
    }

    @DeleteMapping("")
    public ResponseEntity<Void> deleteDummy(DummyDto dummyDto){
        dummyService.deleteDummy(null);
        return null;
    }
}
