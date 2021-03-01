package com.sshumlyankiy.core.domain.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.List;
import java.util.StringJoiner;

@Data
@Entity
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstname;
    private String surname;
    private String patronymic;
    private String phone;

    @OneToOne
    private Company company;

    @OneToMany
    private List<Record> records;

    private String getFullName() {
        var joiner = new StringJoiner(" ");
        return joiner
                .add(surname).add(firstname).add(patronymic)
                .toString();
    }
}
