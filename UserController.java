package com.hcl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hcl.model.Pet;
import com.hcl.model.User;
import com.hcl.service.UserService;

@Controller
public class UserController {

	private UserService userService;

	@Autowired(required = true)
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// homepage
	@RequestMapping("/index")
	public ModelAndView loginform() {
		ModelAndView model = new ModelAndView();
		model.setViewName("homepage");// jsp page
		return model;
	}

	// loginpage
	@RequestMapping("/loginpage")
	public ModelAndView  loginpage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");// jsp page
		return model;
	}

	// register page
	@RequestMapping("/registerpage")
	public ModelAndView registerpage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("register");// jsp page
		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("the user email is: " + user.getEmail() + " and password is: " + user.getPassword());
		User checkuser = userService.login(user);
		if (checkuser != null) {
			System.out.println("Correct Login credentials, redirected to welcome page");
			HttpSession session = request.getSession();
			session.setAttribute("checkuser", checkuser);
			model.addAttribute("checkuser", session.getAttribute("checkuser"));
			
			return "redirect:/listallpets"; // jsp

		} else {
			System.out.println("Incorrect email or password");
			model.addAttribute("message", "Incorrect email or password");
			return "redirect:/index";
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println("Registration has error ");
			return "homepage";
		} else {
			if (userService.register(user) == true) {
				System.out.println("Registration Successful, Login with new credentials");
				return "redirect:/loginpage"; // jsp page
			} else {
				System.out.println("User already exist..");
				return "redirect:/loginpage";// jsp page
			}
		}
	}

	// show user name
		@RequestMapping("/username")
		public String username(@Valid @ModelAttribute("user")User user) {
			ModelAndView model = new ModelAndView();
			model.addObject("username",user.getUserName());// for book entry form model mapping user.getUserName()
			// username = user.getUserName();
			// model.addAttribute("username", username);
			System.out.println("User name: " + user.getUserName() );
			return "redirect:/headerfooterwithname";

		}
		
	/*
	 * // logout
	 * 
	 * @RequestMapping("/logoutcontroller") public ModelAndView logout(User user) {
	 * System.out.println("logged out "); ModelAndView model = new ModelAndView();
	 * model.addObject(user); String message = ("  ");
	 * model.setViewName("logout");// jsp page return model;
	 * 
	 * }
	 */
}
