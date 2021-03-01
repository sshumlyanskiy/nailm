package com.sshumlyankiy.core.domain.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import java.time.Instant;
import java.util.List;

@NoArgsConstructor
@Data
@Entity
public class Record {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    private Client client;

    private Instant startTime;

    private Instant finishTime;

    private Long actualCost;

    private Long expectedCost;

    @ManyToMany
    private List<ProcedureType> procedureTypes;
}
