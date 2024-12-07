package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Citizen;
import com.klef.jfsd.springboot.model.Politician;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CitizenRepository;
import com.klef.jfsd.springboot.repository.PoliticianRepository;

@Service
public class AdminServiceImpl implements AdminService
{
  @Autowired
  private PoliticianRepository politicianRepository;
  
  @Autowired
  private AdminRepository adminRepository;
  
  @Autowired
  private CitizenRepository citizenRepository;

  @Override
  public String PoliticanRegistration(Politician p)
  {
    politicianRepository.save(p);
    return "Politician Registered Successfully";
    
  }

  @Override
  public List<Politician> viewallpoliticians() 
  {
    return politicianRepository.findAll();
    
  }

  

  @Override
  public Admin checkadminlogin(String uname, String pwd) {
    return adminRepository.checkadminlogin(uname, pwd);
  }

  @Override
  public List<Citizen> viewAllCitizens()
  {
    return (List<Citizen>) citizenRepository.findAll();
  }
  @Override
	public long citicount()
	{
		return citizenRepository.count();
	}

	@Override
	public long policount()
	{
		return politicianRepository.count();
	}

}