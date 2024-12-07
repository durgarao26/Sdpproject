package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Citizen;
import com.klef.jfsd.springboot.model.Issue;
import com.klef.jfsd.springboot.repository.CitizenRepository;
import com.klef.jfsd.springboot.repository.IssueRepository;


@Service
public class CitizenServiceImpl implements CitizenService
{
  @Autowired
  private CitizenRepository citizenRepository;
  
  @Autowired
  private IssueRepository issueRepository;
 

  @Override
  public String CitizenRegistration(Citizen citi) {
    citizenRepository.save(citi);
    return "Citizen Registered Successfully";
  }

  @Override
  public Citizen checkcitilogin(String Aadhaarno, String pwd)
  {
    return citizenRepository.checkcitilogin(Aadhaarno, pwd);
  }



  
  
//  @Override
//  public List<Citizen> displayCitizens()
//  {
//    return (List<Citizen>) citizenRepository.findAll();
//  }
  @Override
	public String ReportIssue(Issue issue) {
		issueRepository.save(issue);
		return "Issue Submitted Successfully";
	}
  
  @Override
	public List<Issue> viewallcitiissues(String adno)
	{
		return issueRepository.findByAdno(adno);
	}
  }