package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Citizen;


@Repository
public interface CitizenRepository extends JpaRepository<Citizen, String>
{
  @Query("select c from Citizen c where c.Aadhaarno=?1 and c.password=?2")
  public Citizen checkcitilogin(String Aadhaarno,String pwd);
  
  
}