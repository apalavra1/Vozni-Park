package net.codejava.springmvc;



import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/unosVozila", method = RequestMethod.GET)
	public String unosVozila(Model model) {
		model.addAttribute("userFormUnosVozila", new Vozilo());
		
	 
	    return "unosVozila";
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
	public String login(HttpSession session, Model model, @ModelAttribute("userFormLogin") Korisnik k) 
	{
		model.addAttribute("userFormLogin", new Korisnik());
		model.addAttribute("userFormRegister", new Korisnik());
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		
		KorisnikDAO korisnikDAO = ctx.getBean("korisnikDAO", KorisnikDAO.class);
		if(korisnikDAO.provjeriLogin(k.getUsername(), k.getPassword()))
		{
			session.setAttribute("loggedInUser", korisnikDAO.dajKorisnika(k.getUsername(), k.getPassword()));
			System.out.println(((Korisnik)session.getAttribute("loggedInUser")).getId());
			return "redirect:unosVozila";
		}
		else
		{
			return "redirect:pocetna";
		}
	}
	
	@RequestMapping(value = "/unosVozila", method = RequestMethod.POST)
	public String register(HttpSession session, Model model, @ModelAttribute("userFormUnosVozila") Vozilo v) 
	{
		model.addAttribute("userFormUnosVozila", new Vozilo());
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		
		VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
		voziloDAO.unesi(v, ((Korisnik)session.getAttribute("loggedInUser")).getId());
		System.out.println(v.getMarkaVozila());
		
		return "unosVozila";
	}
	
	@RequestMapping("/odjava")
	public String odjava(HttpSession session)
	{
		session.removeAttribute("loggedInUser");
		session.invalidate();
		return "redirect:pocetna";
	}
	
	@RequestMapping(value = "/mojaVozila", method = RequestMethod.GET)
	public Model mojaVozila(HttpSession session, Model model) 
	{	
		int id_korisnika = ((Korisnik)session.getAttribute("loggedInUser")).getId();
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		
		VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
		List<Vozilo> lista_vozila = new ArrayList<Vozilo>();
		lista_vozila = voziloDAO.dajVozila(id_korisnika);
		
		model.addAttribute("userFormMojaVozila", lista_vozila);
		
	    //return "mojaVozila";
		return model;
	}
	
	@RequestMapping(value = "/obrisiVozila", params = "obrisi", method = RequestMethod.POST)
	public String obrisi(@RequestParam(value = "registarskeOznake", required = false) String[] registarskeOznake)
	{
		if(registarskeOznake != null)
		{
			ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
			VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
			
			for(int i = 0; i < registarskeOznake.length; i++)
			{
				voziloDAO.obrisiVozilo(registarskeOznake[i]);
			}
		}
		
		return "redirect:mojaVozila";
	}
	
	@RequestMapping("/edit/{reg}")
	public String edit(@PathVariable("reg")String reg, Model model, RedirectAttributes redir)
	{
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
		System.out.println(reg);
		Vozilo v = voziloDAO.dajVozilo(reg);
		redir.addFlashAttribute("userFormEditVozila", v);
		return "redirect:http://localhost:8080/springmvc/editVozila";
	}
	
	@RequestMapping(value = "/editVozila", method = RequestMethod.GET)
	public String editVozila(Model model) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
	    return "editVozila";
	}
	
	@RequestMapping(value = "/editVozila", method = RequestMethod.POST)
	public String updateVozila(HttpSession session, Model model, @ModelAttribute("userFormEditVozila") Vozilo v) 
	{
		model.addAttribute("userFormEditVozila", new Vozilo());
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
		System.out.println(v.getId());
		voziloDAO.updateVozila(v.getId(), v);
		return "redirect:mojaVozila";
	}
	
	@RequestMapping(value = "/mapa", method = RequestMethod.GET)
	public String mapa(Model model) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("Beans.xml");
		VoziloDAO voziloDAO = ctx.getBean("voziloDAO", VoziloDAO.class);
	    return "mapa";
	}
	
	
}
