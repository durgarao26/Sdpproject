package com.klef.jfsd.springboot.service;


import java.util.List;

import com.klef.jfsd.springboot.model.Citizen;
import com.klef.jfsd.springboot.model.Issue;

public interface CitizenService
{
  public String CitizenRegistration(Citizen citi);
  public Citizen checkcitilogin(String Aadhaarno,String pwd);
  public String ReportIssue(Issue issue);
  public List<Issue> viewallcitiissues(String adno);
  
  
}