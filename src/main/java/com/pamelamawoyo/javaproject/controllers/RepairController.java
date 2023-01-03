package com.pamelamawoyo.javaproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.pamelamawoyo.javaproject.models.RepairEdit;
import com.pamelamawoyo.javaproject.models.RepairsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.pamelamawoyo.javaproject.models.Repair;
import com.pamelamawoyo.javaproject.services.RepairService;


@Controller
public class RepairController {
	
	@Autowired
	private RepairService repairService;
	
	//create service booking
		@GetMapping("/service/locations")
		public String displayNewServiceForm(HttpSession session, @ModelAttribute("newRepair") Repair newRepair) {
			if (Boolean.valueOf(session.getAttribute("admin").toString())) {
				return "service_admin.jsp";
			}
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

	@PostMapping(path = "/repair/edit", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String editRepair(@RequestBody RepairsDao repairsDao) {

				for (RepairEdit repairEdit : repairsDao.getRepairEdits()) {
					Long id = getId(repairEdit.getId());
					Repair repair = repairService.singleSRepair(id);
					repair.setAssigned_staff(repairEdit.getAssignedStaff());
					repair.setMileStone(repairEdit.getMilestone());
					repairService.editRepair(repair);
				}

			return "values saved";
		}

	private Long getId(String val) {
			String res = "";
			for(char s : val.toCharArray()) {
				if (Character.isDigit(s)) {
					res = res + s;
				}
			}
			return Long.parseLong(res);
	}
			

}
