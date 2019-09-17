package com.miksonx.myassistant.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.miksonx.myassistant.commands.UserCommand;
import com.miksonx.myassistant.utils.MyUtils;

@Controller
public class HomeController {
	
	private static Log log = LogFactory.getLog(SignupController.class);

	@Autowired
	private MessageSource messageSource;
	
    @RequestMapping("/")
    public  String login(Model model){
    	
    	model.addAttribute("user", new UserCommand());
    	return "login";    
    }

    @PostMapping
    public  String doLogin(@Validated @ModelAttribute("user") UserCommand user, BindingResult result){
    	
    	if(result.hasErrors())
    		return "error";
    	
    	log.info("Name: " + 
    			user.getName() + "; Password:" + user.getPassword());
    	return "redirect:/";    	
    }
    
}
