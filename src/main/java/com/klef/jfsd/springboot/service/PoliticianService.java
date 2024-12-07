package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Issue;
import com.klef.jfsd.springboot.model.Politician;

public interface PoliticianService

{

  public Politician checkpolilogin(String email,String password);
  public Politician displayPoliticianById(int pid);
  public String UpdatePoliticianProfile(Politician poli);
  public List<Issue> displayissue(String constituency);
  public Issue findissue(int rid);
  public String updateissue(String solution,int rid);
  
  
}