package com.klef.jfsd.springboot.controller;

import java.io.File;
import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.klef.jfsd.springboot.model.Citizen;
import com.klef.jfsd.springboot.model.Issue;
import com.klef.jfsd.springboot.model.Politician;
import com.klef.jfsd.springboot.service.CitizenService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CitizenController
{
  @Autowired
  private CitizenService citizenService;
  
  
  @GetMapping("citireg")
  public ModelAndView citireg()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("citireg");
    return mv;
  }
  
  @PostMapping("insertciti")
  public ModelAndView insertciti(HttpServletRequest request) 
  {
    String Aadharno = request.getParameter("cnum");
    String name = request.getParameter("cname");
    String gender = request.getParameter("cgender");
    String address = request.getParameter("caddress");
    String constituency = request.getParameter("cconstituency");
    String email = request.getParameter("cemail");
    String password = request.getParameter("cpwd");
    String phno = request.getParameter("cphno");
    
    
    
    Citizen citi=new Citizen();
    citi.setAadhaarno(Aadharno);
    citi.setName(name);
    citi.setGender(gender);
    citi.setAddress(address);
    citi.setConstituency(constituency);
    citi.setEmail(email);
    citi.setPassword(password);
    citi.setPhno(phno);
    
    ModelAndView mv = new ModelAndView();
      String msg = citizenService.CitizenRegistration(citi);
   
      mv.addObject("message", msg);
      mv.setViewName("citiregsuccess");
    
    return mv;
    
  }
  
  @GetMapping("citilogin")
  public ModelAndView citilogin()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("citilogin");
    return mv;
  }
  
  @PostMapping("checkcitilogin")
  public ModelAndView checkcitilogin(HttpServletRequest request)
  {
  
    ModelAndView mv = new ModelAndView();
    
    String caadhaar = request.getParameter("caadhar");
    String cpwd = request.getParameter("cpwd");
    
    Citizen citi = citizenService.checkcitilogin(caadhaar, cpwd);
    if(citi!=null)
    {
      HttpSession session = request.getSession();
      session.setAttribute("citi", citi);
      mv.setViewName("citihome");
    }
    else
    {
      mv.setViewName("citilogin");
      mv.addObject("message", "Login Failed");
    }
    return mv;
  }
  
  @GetMapping("citihome")
  public ModelAndView citihome()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("citihome");
    return mv;
  }


  
  @GetMapping("citilogout")
  public ModelAndView polilogout(HttpServletRequest request)
  {
  HttpSession session=request.getSession();
  session.removeAttribute("citizen");
  
    ModelAndView mv = new ModelAndView();
    mv.setViewName("citilogin");
    return mv;
  }
  
  @GetMapping("citiissue")
  public ModelAndView citiissue()
  {
  	ModelAndView mv=new ModelAndView();
  	mv.setViewName("citiissue");
  	return mv;
  }
  
  @PostMapping("submitissue")
  public ModelAndView submitissue(HttpServletRequest request)
  {
  	String adno= request.getParameter("adno");
  	String name=request.getParameter("name");
  	String constituency=request.getParameter("constituency");
  	String address=request.getParameter("address");
  	String problem=request.getParameter("problem");
  	String solution=request.getParameter("solution");
  	
  	Issue iss=new Issue();
  	iss.setAdno(adno);
  	iss.setName(name);
  	iss.setConstituency(constituency);
  	iss.setAddress(address);
  	iss.setProblem(problem);
  	iss.setSolution("");
  	
  	String msg= citizenService.ReportIssue(iss);
  	ModelAndView mv=new ModelAndView();
  	mv.setViewName("citiupdatesuccess");
  	return mv;
  }
  
  @GetMapping("viewallissues")
  public ModelAndView viewallissues(HttpServletRequest request) {
      ModelAndView mv = new ModelAndView();
      HttpSession session = request.getSession();
      
      Citizen citi = (Citizen) session.getAttribute("citi");
      if (citi == null) {
          // Redirect to login page or show an error message
          mv.setViewName("citilogin");
          mv.addObject("error", "Session expired. Please log in again.");
          return mv;
      }

      String adno = citi.getAadhaarno();
      List<Issue> issulist = citizenService.viewallcitiissues(adno);
      mv.addObject("issulist", issulist);
      mv.setViewName("viewallissues");
      return mv;
  }

  
  
}