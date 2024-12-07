package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Citizen;
import com.klef.jfsd.springboot.model.Politician;

public interface AdminService 
{
  public String PoliticanRegistration(Politician p);
  public List<Politician> viewallpoliticians();
  public Admin checkadminlogin(String uname,String pwd);
  public List<Citizen> viewAllCitizens();
  public long citicount();
  public long policount();
 
 
}