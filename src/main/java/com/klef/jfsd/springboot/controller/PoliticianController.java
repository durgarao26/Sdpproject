package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Issue;
import com.klef.jfsd.springboot.model.Politician;
import com.klef.jfsd.springboot.service.PoliticianService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PoliticianController 
{
  
  @Autowired
  private PoliticianService politicianService;
      
 
  
  @GetMapping("polihome")
  public ModelAndView polihome()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("polihome");
    return mv;
  }
   
   
   @GetMapping("polilogin")
        public ModelAndView polilogin() {
            ModelAndView mv = new ModelAndView();
            mv.setViewName("polilogin");
            return mv;
        }
     
   @PostMapping("checkpolilogin")
    public ModelAndView checkpolilogin(HttpServletRequest request)
    {
      ModelAndView mv = new ModelAndView();
      
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      
      Politician p =  politicianService.checkpolilogin(email, password);
     
      
      if(p!=null)
      {
      //session
        HttpSession session=request.getSession();
        session.setAttribute("politician",p);//employee is session variable  
        
      //session.setMaxInactiveInterval(5);
          mv.setViewName("polihome");
      }
      else
      {
        mv.setViewName("polilogin");
        mv.addObject("message", "Login Failed");
      } 
        return mv;
    }
   
     @GetMapping("poliprofile")
     public ModelAndView profile() 
     {
     ModelAndView mv=new ModelAndView();
     mv.setViewName("poliprofile");
     return mv;
   }
     @GetMapping("updatepoli")
	 public ModelAndView updatepoli()
	 {
		 ModelAndView mv = new ModelAndView("updatepoli");
		 return mv;
	 }
	
	 @PostMapping("updatepoliprofile")
	 public ModelAndView updatePoliProfile(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     
	     try {
	         int id = Integer.parseInt(request.getParameter("pid"));
	         String name = request.getParameter("pname");
	         String gender = request.getParameter("pgender");
	         String constituency = request.getParameter("pconstituency");
	         String contact = request.getParameter("pcontact");
	         String dob = request.getParameter("pdob");
	         String party = request.getParameter("pparty");
	         String state = request.getParameter("pstate");
	         String password = request.getParameter("ppassword");

	         Politician poli = new Politician();
	         poli.setId(id);
	         poli.setName(name);
	         poli.setGender(gender);
	         poli.setConstituency(constituency);
	         poli.setContact(contact);
	         poli.setDateofbirth(dob);
	         poli.setParty(party);
	         poli.setState(state);
	         poli.setPassword(password);

	      
	         String msg = politicianService.UpdatePoliticianProfile(poli);

	        
	         Politician p = politicianService.displayPoliticianById(id);

	      
	         HttpSession session = request.getSession();
	         session.setAttribute("politician", p);

	         mv.setViewName("updatesuccess");
	         mv.addObject("message", msg);
	         
	     } catch (Exception e) {
	         mv.setViewName("updateerror");
	         mv.addObject("message", e.getMessage());
	     }
	     return mv;
	 }
 
    @GetMapping("polilogout")
     public ModelAndView polilogout(HttpServletRequest request)
     {
     HttpSession session=request.getSession();
     session.removeAttribute("politician");//politician is session variable
     
     //session.invalidate();//remove  all session attributes;
     
     
       ModelAndView mv = new ModelAndView();
       mv.setViewName("polilogin");
       return mv;
     }
    @GetMapping("polisessionexpiry")
	 public ModelAndView polisessionexpiry()
	 {
		 ModelAndView mv = new ModelAndView("polisessionexpiry");
		 return mv;
	 }
	 
	 @GetMapping("viewcitizenissuebycons")
	 public ModelAndView viewcitizenissuebycons(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     HttpSession session = request.getSession();
	     Politician poli = (Politician) session.getAttribute("politician");

			/*
			 * // Check if Politician is null if (poli == null) { // Log the error for
			 * debugging System.out.println("Politician is null in session.");
			 * 
			 * // Redirect to an error page or login page with a message
			 * mv.setViewName("error"); // Assuming you have an error.html page
			 * mv.addObject("message", "Session expired or user not logged in."); return mv;
			 * }
			 */

	     // If politician is not null, proceed to fetch issues
	     List<Issue> issulist = politicianService.displayissue(poli.getConstituency());
	     mv.addObject("issulist", issulist);
	     mv.setViewName("viewcitizenissue");
	     return mv;
	 }

	 @GetMapping("updateissue")
	 public ModelAndView updateissue(@RequestParam("id") int rid)
	 {
		 ModelAndView mv=new ModelAndView();
		 Issue issue = politicianService.findissue(rid);
		 mv.addObject("issue", issue);
		 mv.setViewName("updateissue");
		 return mv;
	 }
	 
	 @PostMapping("submitsolution")
	 public ModelAndView submitsolution(HttpServletRequest request)
	 {
		 String solution = request.getParameter("solution");
		 int rid = Integer.parseInt(request.getParameter("rid"));
		 Issue issue = new Issue();
		 issue.setSolution(solution);
		 
		 String msg = politicianService.updateissue(solution, rid);
		 ModelAndView mv = new ModelAndView();
		 Issue iss = politicianService.findissue(rid);
		 mv.addObject("issue", iss);
		 mv.addObject("msg","Updated Successfully");
		 mv.setViewName("updateissue");
		 return mv;
	 }
    

  
 }