package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Issue;
import com.klef.jfsd.springboot.model.Politician;
import com.klef.jfsd.springboot.repository.IssueRepository;
import com.klef.jfsd.springboot.repository.PoliticianRepository;

@Service
public class PoliticianServiceImpl implements PoliticianService
{
   @Autowired
  private PoliticianRepository politicianRepository;
   
   @Autowired
   private IssueRepository issueRepository;
   
   
  @Override
  public Politician checkpolilogin(String email, String password) {
    
    return politicianRepository.checkpolilogin(email, password);
  }

  @Override
	public Politician displayPoliticianById(int pid) 
	{
		return politicianRepository.findById(pid).get();
	}

	@Override
	public String UpdatePoliticianProfile(Politician poli) 
	{
		Politician p = politicianRepository.findById(poli.getId()).get();
		
		p.setName(poli.getName());
		p.setGender(poli.getGender());
		p.setConstituency(poli.getConstituency());
		p.setContact(poli.getContact());
		p.setDateofbirth(poli.getDateofbirth());
		p.setParty(poli.getParty());
		p.setState(poli.getState());
		p.setPassword(poli.getPassword());
		
		politicianRepository.save(p);
		
		return "Politician Updated Successfully";
		
	}
	
	@Override
	public String updateissue(String solution,int rid) {
		
		issueRepository.updateissue(solution, rid);
		return "Solution Updated Successfully";
	}


	@Override
	public List<Issue> displayissue(String constituency) {
		
		return issueRepository.findByConstituency(constituency);
	}


	@Override
	public Issue findissue(int rid) {
		return issueRepository.findById(rid).get();
	}


  

  

  


  
}