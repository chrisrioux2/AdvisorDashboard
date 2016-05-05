package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.AdvisorDBDAO;
import entities.Advisor;
import transferobjects.AdvisorTransferObject;

@Controller
@SessionAttributes({"user", "status"})
public class AdvisorController {
	@Autowired
	private AdvisorDBDAO advisorDAO;
	
	// credentials and login/logout
	@ModelAttribute("user")
	   public Advisor getUser()
	   {
	       Advisor user = new Advisor();
	       return user;
	   }
	
	@ModelAttribute("status")
	public String getStatus()
	{
		String status = "out";
		return status;
	}

	
	@RequestMapping(path="Login.do")
	public ModelAndView login(Model model, @ModelAttribute ("user") Advisor user, String name, String password) {
		ModelAndView mv = new ModelAndView();

		if (advisorDAO.login(name, password) ) {
			mv.setViewName("GetAllAdvisors.do");
			model.addAttribute("user", advisorDAO.getAdvisor(name));
			model.addAttribute("status", "in");
			return mv;
		}
		else {
			mv.setViewName("index.jsp");
			mv.addObject("false", false);
			return mv;
		}
	}
	
	@RequestMapping(path="Logout.do")
	public ModelAndView logout(Model model, @ModelAttribute ("status") String status) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect.jsp");
		mv.addObject("user", new Advisor());
		model.addAttribute("status", "out");
		return mv;
	}
	
	
	// going to and getting an advisor
	@RequestMapping(path="GoToAdvisor.do", method=RequestMethod.GET)
	public ModelAndView getAdvisor() {
		return new ModelAndView("advisor.jsp");
	}

	@RequestMapping(path="GetAdvisor.do", method=RequestMethod.GET)
	public ModelAndView getAdvisor(int id, @ModelAttribute("status") String status) {
		// get the advisor from the table by id and send to advisor.jsp
		Advisor a = advisorDAO.getAdvisor(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("advisor.jsp");
		mv.addObject("advisor", a);
		
		// get the sales data for the advisor
		mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(id));	
		mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(id));	
		mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(id));	
		return mv;
	}
	
	@RequestMapping(path="GetAllAdvisors.do", method=RequestMethod.GET)
	public ModelAndView getAllAdvisors(Model model, @ModelAttribute ("status") String status) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("advisorTable.jsp");
		mv.addObject("advisors", advisorDAO.getAllAdvisors());
		return mv;
	}
	
	
	// toggling through advisors
	@RequestMapping(path="NavigatePrevious.do")
	public ModelAndView previous(AdvisorTransferObject a) {
		try {
			if (a.getId() < 1) {
				a.setId(advisorDAO.getAllAdvisors().size() + 1);
			}
			ModelAndView mv = new ModelAndView();
			mv.setViewName("advisor.jsp");
			Advisor previousAdvisor = advisorDAO.getAdvisor(a.getId());
			mv.addObject("advisor", previousAdvisor);
			
			// get the sales data for the advisor
			mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(previousAdvisor.getId()));	
			mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(previousAdvisor.getId()));	
			mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(previousAdvisor.getId()));
			return mv;			
		} catch (Exception e) {
			try {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("advisor.jsp");
				Advisor previousAdvisor = advisorDAO.getAdvisor(a.getId() - 1);
				mv.addObject("advisor", previousAdvisor);
				
				// get the sales data for the advisor
				mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(previousAdvisor.getId()));	
				mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(previousAdvisor.getId()));	
				mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(previousAdvisor.getId()));
				return mv;
			} catch (Exception e2) {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("advisor.jsp");
				Advisor previousAdvisor = advisorDAO.getAdvisor(a.getId() - 2);
				mv.addObject("advisor", previousAdvisor);
				
				// get the sales data for the advisor
				mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(previousAdvisor.getId()));	
				mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(previousAdvisor.getId()));	
				mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(previousAdvisor.getId()));
				return mv;
			}
		}
	}
	
	@RequestMapping(path="NavigateNext.do")
	public ModelAndView next(AdvisorTransferObject a) {
		try {
			if (a.getId() > advisorDAO.getAllAdvisors().size() + 1) {
				a.setId(1);
			}
			ModelAndView mv = new ModelAndView();
			mv.setViewName("advisor.jsp");
			Advisor nextAdvisor = advisorDAO.getAdvisor(a.getId());
			mv.addObject("advisor", nextAdvisor);
			
			// get the sales data for the advisor
			mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(nextAdvisor.getId()));	
			mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(nextAdvisor.getId()));	
			mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(nextAdvisor.getId()));	
			return mv;
		} catch (Exception e) {
			try {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("advisor.jsp");
				Advisor nextAdvisor = advisorDAO.getAdvisor(a.getId() + 1);
				mv.addObject("advisor", nextAdvisor);
				
				// get the sales data for the advisor
				mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(nextAdvisor.getId()));	
				mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(nextAdvisor.getId()));	
				mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(nextAdvisor.getId()));	
				return mv;
			} catch (Exception e2) {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("advisor.jsp");
				Advisor nextAdvisor = advisorDAO.getAdvisor(a.getId() + 2);
				mv.addObject("advisor", nextAdvisor);
				
				// get the sales data for the advisor
				mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(nextAdvisor.getId()));	
				mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(nextAdvisor.getId()));	
				mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(nextAdvisor.getId()));	
				return mv;			
			}
		}
	}
	
	// adding an advisor
	@RequestMapping(path="GoToAddAdvisor.do", method=RequestMethod.GET)
	public ModelAndView goToAddAdvisor() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addAdvisor.jsp");
		
		// add fillmurray picture
		long hgt = Math.round((100 * (1 + (int)(Math.random() * ((4 - 1) + 1)))));
		long wth = Math.round((100 * (1 + (int)(Math.random() * ((4 - 1) + 1)))));
		String url = "http://fillmurray.com/" + hgt + "/" + wth;
		mv.addObject("url", url);
		
		// add position and location information to populate dropdown selections
		mv.addObject("positions", advisorDAO.getAllPositions());
		mv.addObject("locations", advisorDAO.getAllLocations());
		return mv;
	}
	
	@RequestMapping(path="AddAdvisor.do", method=RequestMethod.POST)
	public ModelAndView addAdvisor(AdvisorTransferObject ato) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("advisorTable.jsp");		
		advisorDAO.addAdvisor(ato);
		mv.addObject("advisors", advisorDAO.getAllAdvisors());
		return mv;
	}

	
	// update an advisor
	@RequestMapping(path="GoToUpdateAdvisor.do", method=RequestMethod.GET)
	public ModelAndView goToUpdateAdvisor(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateAdvisor.jsp");
		
		// add fillmurray picture
		long hgt = Math.round((100 * (1 + (int)(Math.random() * ((4 - 1) + 1)))));
		long wth = Math.round((100 * (1 + (int)(Math.random() * ((4 - 1) + 1)))));
		String url = "http://fillmurray.com/" + hgt + "/" + wth;
		mv.addObject("url", url);
		
		// send current advisor to update page
		Advisor a = advisorDAO.getAdvisor(id);
		mv.addObject("advisor", a);
		
		// add position and location information to populate dropdown selections
		mv.addObject("positions", advisorDAO.getAllPositions());
		mv.addObject("locations", advisorDAO.getAllLocations());
		return mv;
	}

	@RequestMapping(path="UpdateAdvisor.do", method=RequestMethod.POST)
	public ModelAndView updateAdvisor(AdvisorTransferObject a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("advisor.jsp");		
		Advisor updatedAdvisor = advisorDAO.updateAdvisor(a);
		mv.addObject("advisor", updatedAdvisor);
		
		// get the sales data for the advisor
		mv.addObject("advisorFundSales", advisorDAO.getAdvisorFundSales(a.getId()));	
		mv.addObject("advisorYearSales", advisorDAO.getAdvisorYearSales(a.getId()));	
		mv.addObject("advisorTrendSales", advisorDAO.getAdvisorTrendSales(a.getId()));
		return mv;
	}
	
	
	// delete advisor
	@RequestMapping(path="DeleteAdvisor.do", method=RequestMethod.POST)
	public ModelAndView deleteAdvisor(int id) {
		//execute deletion
		advisorDAO.deleteAdvisor(id);
		
		// return user to advisorTable page with all advisor data
		ModelAndView mv = new ModelAndView();
		mv.addObject("advisors", advisorDAO.getAllAdvisors());
		mv.setViewName("advisorTable.jsp");
		return mv;
	}

}