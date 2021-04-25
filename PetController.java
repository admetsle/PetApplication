package com.hcl.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.model.Pet;
import com.hcl.model.User;
import com.hcl.service.PetService;

@Controller
public class PetController {
	
private PetService petService;
	
	@Autowired(required = true)
	public void setPetService(PetService petService) {
		this.petService = petService;
	}
	
	//list all pets in welcome page
	@RequestMapping("/listallpets")
	public ModelAndView displayPetsAvailable() {
		ModelAndView model = new ModelAndView();
		model.addObject("pet", new Pet());// for book entry form model mapping
		model.addObject("petList", petService.listAllPets());// to display the book table data below the form
		System.out.println("All pets are listed");
		model.setViewName("welcome");// jsp page
		return model;
	}
	
	//buy pet- displaying the selected pet details 
	@RequestMapping("/getbuypet/{petId}")
	public ModelAndView displayBuyPetById(@PathVariable("petId") Integer petId, Map<String, Object> map) {
		ModelAndView model = new ModelAndView();
		
		model.addObject("pet", new Pet());// for pet entry form model mapping
		map.put("petList", petService.getPetById(petId));// to display the pet table data of selected id

		System.out.println("Pet selected with given ID: "+petId);
		model.setViewName("buypet");// jsp page
		return model;
	}
	
	//buy pet- updated Sold
	@RequestMapping("/buypet/{petId}")
	public String buyPet(@PathVariable("petId") Integer petId, Model model, HttpServletRequest httpServletRequest) {	
		System.out.println("Pet purchased with given ID: "+petId);
		HttpSession session = httpServletRequest.getSession();
		User user = (User) session.getAttribute("checkuser");
		Pet Pet = petService.buyPet(petId, user);
		if(Pet==null) {
			 String message = "Sorry your Purchase Failed..!!";
				model.addAttribute("message",message);
			}
		String message = "Your purchase is success!! ";
		model.addAttribute("message",message);
		System.out.println("Pet purchase is successfull");
		return "redirect:/listallpets";
       
	}
	
	//list owned pets
	@RequestMapping("/listownedpets")
    public ModelAndView listOwnedPets(HttpServletRequest httpServletRequest) {
        ModelAndView model=new ModelAndView();
        HttpSession session = httpServletRequest.getSession();
		User user = (User) session.getAttribute("checkuser");
		
        model.addObject("pet",new Pet());
        model.addObject("petList", petService.listOwnedPets(user.getId()));
		System.out.println("Owned pets are listed");
        model.setViewName("listownedpets"); //jsp page
        return model;
    }
	
	//add pet page
	@RequestMapping("/addpet")
    public ModelAndView addpetpage() {
        ModelAndView model=new ModelAndView();
       
		System.out.println("Add pet jsp showed");
        model.setViewName("addPet"); //jsp page
        return model;
    }
	
	//add pet
	@RequestMapping(value = "/pet/add", method = RequestMethod.POST)
	public String addPet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, Map<String, Object> map) {
		if (result.hasErrors()) {
			map.put("petList", petService.listAllPets());
			return "addPet";
		} else {
			if (pet.getPetId() == null) {
				petService.addNewPet(pet);
			} 
			return "redirect:/listallpets";
		}
	}
	
}
