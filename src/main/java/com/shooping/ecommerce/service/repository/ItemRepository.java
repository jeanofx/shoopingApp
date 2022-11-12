package com.shooping.ecommerce.service.repository;

import com.shooping.ecommerce.service.entity.Item;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ItemRepository extends CrudRepository<Item, Integer> {
    @Query("SELECT P FROM Item P WHERE P.recomendado = 1")
    Iterable<Item> listarItemsRecomendados();

    @Query("SELECT P FROM Item P WHERE P.categoria.id=:idC")
    Iterable<Item> listarItemsPorCategoria(int idC);

    @Modifying
    @Query("UPDATE Item P SET P.stock=stock-:cant WHERE P.id=:id")
    void descontarStock(int cant, int id);

    @Modifying
    @Query("UPDATE Item P SET P.stock=stock+:cant WHERE P.id=:id")
    void aumentarStock(int cant, int id);
}
