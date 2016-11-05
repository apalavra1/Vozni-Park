package net.codejava.springmvc;



import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.sql.Date;
import java.util.Calendar;
import java.util.Map;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}*/
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
	    String greetings = "Greetings, Spring MVC!";
	    model.addAttribute("message", greetings);
	 
	    return "test";
	}
	
	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public String pocetna(Model model) 
	{	
		model.addAttribute("userFormLogin", new Korisnik());
		model.addAttribute("userFormRegister", new Korisnik());

	    return "pocetna";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, @ModelAttribute("userFormRegister") Korisnik k) 
	{
		model.addAttribute("userFormLogin", new Korisnik());
		model.addAttribute("userFormRegister", new Korisnik());
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		
		KorisnikDAO korisnikDAO = ctx.getBean("korisnikDAO", KorisnikDAO.class);
		
		korisnikDAO.unesi(k);
		System.out.println(k.getIme());
		
		return "redirect:pocetna";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, @ModelAttribute("userFormLogin") Korisnik k) 
	{
		model.addAttribute("userFormLogin", new Korisnik());
		model.addAttribute("userFormRegister", new Korisnik());
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		
		KorisnikDAO korisnikDAO = ctx.getBean("korisnikDAO", KorisnikDAO.class);
		
		korisnikDAO.provjeriLogin(k.getUsername(), k.getPassword());
		
		return "redirect:pocetna";
	}
}
