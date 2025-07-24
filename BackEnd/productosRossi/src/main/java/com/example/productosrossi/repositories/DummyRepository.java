package com.example.productosrossi.repositories;

import com.example.productosrossi.entities.DummyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DummyRepository  extends JpaRepository<com.example.productosrossi.entities.DummyEntity, Long> { //NUESTRA INTERFACE TIENE TODOS LOS METODOS QUE EXTIENDE DE JpaRepository
}
