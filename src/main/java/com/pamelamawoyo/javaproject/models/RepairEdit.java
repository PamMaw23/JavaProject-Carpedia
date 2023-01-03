package com.pamelamawoyo.javaproject.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.taglibs.standard.extra.spath.Step;

import java.util.List;

public class RepairEdit {

    @JsonProperty("id")
    public String id;
    @JsonProperty("assigned_staff")
    public String assignedStaff;
    @JsonProperty("milestone")
    public String milestone;



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAssignedStaff() {
        return assignedStaff;
    }

    public void setAssignedStaff(String assignedStaff) {
        this.assignedStaff = assignedStaff;
    }

    public String getMilestone() {
        return milestone;
    }

    public void setMilestone(String milestone) {
        this.milestone = milestone;
    }
}
