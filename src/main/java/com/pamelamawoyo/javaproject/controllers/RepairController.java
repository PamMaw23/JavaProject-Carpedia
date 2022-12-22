package com.pamelamawoyo.javaproject.controllers;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.pamelamawoyo.javaproject.models.Repair;
import com.pamelamawoyo.javaproject.services.RepairService;


@Controller
public class RepairController {
	
	@Autowired
	private RepairService repairService;
	
	//create service booking
		@GetMapping("/service/locations")
		public String displayNewServiceForm(@ModelAttribute("newRepair") Repair newRepair) {
			return "service.jsp";
		}
		
		@PostMapping("/service/locations")
		public String processServiceForm(@Valid @ModelAttribute("newRepair") Repair newRepair,
				BindingResult result, Model model) {
			if(result.hasErrors()) {
				return "service.jsp";
			}else {
				repairService.createRepair(newRepair);
				return "redirect:/dashboard";}
			}
			

}
