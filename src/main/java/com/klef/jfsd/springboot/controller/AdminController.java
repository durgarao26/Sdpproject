package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Citizen;
import com.klef.jfsd.springboot.model.Politician;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
  @Autowired
  private AdminService adminService;
  
  
   @GetMapping("adminlogin")
     public ModelAndView adminlogin()
     {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("adminlogin");
       return mv;
     }
   
   @GetMapping("/")
   public ModelAndView home()
   {
     ModelAndView mv=new ModelAndView();
     mv.setViewName("home");
     return mv;
   }
   
   @GetMapping("adminhome")
   public ModelAndView adminhome()
   {
     ModelAndView mv = new ModelAndView("adminhome");
     long count1 = adminService.citicount();
	 mv.addObject("count1", count1);
	 
	 long count2 = adminService.policount();
	 mv.addObject("count2", count2);
     return mv;
   }
   
   @PostMapping("checkadminlogin")
   public ModelAndView checkadminlogin(HttpServletRequest request)
   {
      ModelAndView mv = new ModelAndView();
       
       String auname = request.getParameter("auname");
       String apwd = request.getParameter("apwd");
       
      Admin admin = adminService.checkadminlogin(auname, apwd);
      
      if(admin!=null)
      {
        HttpSession session = request.getSession();
        session.setAttribute("admin", admin);
        mv.setViewName("adminhome");
        
      }
      else
      {
        mv.setViewName("adminloginfail");
        mv.addObject("message", "Login Failed");
      }
      return mv;
     }
   @GetMapping("polireg")
   public ModelAndView polireg() 
   {
     ModelAndView mv=new ModelAndView();
     mv.setViewName("polireg");
     return mv;
     
   }
   
   @PostMapping("insertpoli")
   public ModelAndView insertpoli(HttpServletRequest request)
   {
     String name=request.getParameter("name");
     String gender=request.getParameter("gender");
     String dob=request.getParameter("dateofbirth");
     String email=request.getParameter("email");
     String constituency=request.getParameter("constituency");
     String contact=request.getParameter("contact");
     String party=request.getParameter("party");
     String position=request.getParameter("position");
     String state=request.getParameter("state");
     String password=request.getParameter("password");
     
     Politician p=new Politician();
     p.setName(name);
     p.setGender(gender);
     p.setEmail(email);
     p.setDateofbirth(dob);
     p.setConstituency(constituency);
     p.setContact(contact);
     p.setParty(party);
     p.setPosition(position);
     p.setState(state);
     p.setPassword(password);
     String msg = adminService.PoliticanRegistration(p);
          
          ModelAndView mv = new ModelAndView("poliregsuccess");
          mv.addObject("message", msg);
        
          return mv;
     
   }
   
   @GetMapping("viewallpoli")
   public ModelAndView viewallpoli()
   {
     ModelAndView mv = new ModelAndView();
     List<Politician> polilist=adminService.viewallpoliticians();
     mv.setViewName("viewallpoli");
     mv.addObject("polilist", polilist);
     return mv;
   }
   @GetMapping("viewallciti")
    public ModelAndView viewallciti()
    {
      List<Citizen> citizenlist = adminService.viewAllCitizens();
      ModelAndView mv = new ModelAndView("viewallciti");
      mv.addObject("citizenlist", citizenlist);
      return mv;
    }
   
  
   @GetMapping("adminlogout")
   public ModelAndView adminlogout(HttpServletRequest request)
   {
     HttpSession session = request.getSession();
     session.removeAttribute("admin");
     
     ModelAndView mv = new ModelAndView("adminlogin");
     return mv;
   }
   
  
   
   

}