package com.sshumlyankiy.core.repository;

import com.sshumlyankiy.core.domain.entity.Client;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ClientRepository extends CrudRepository<Client, Long> {
    List<Client> findAllByIdAndSurnameEndingWith(Long id, String surname);
}
