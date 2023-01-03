package com.pamelamawoyo.javaproject.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

import java.util.List;

@JsonSerialize
@Data
public class RepairsDao {

    @JsonProperty("repairEdits")
    public List<RepairEdit> repairEdits;

    public List<RepairEdit> getRepairEdits() {
        return repairEdits;
    }

    public void setRepairEdits(List<RepairEdit> repairEdits) {
        this.repairEdits = repairEdits;
    }
}
