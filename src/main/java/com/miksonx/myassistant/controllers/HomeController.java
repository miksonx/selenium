package com.miksonx.myassistant.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.miksonx.myassistant.utils.MyUtils;

@Controller
public class HomeController {

	@Autowired
	private MessageSource messageSource;
	
    @RequestMapping("/")
    public  String proba(Model model){
    	
    	Object[] urls = {"http://mk.miksonx.com", 
    			"http://en.miksonx.com"};
    	
//    	model.addAttribute("name", 
//    			messageSource.getMessage("text", urls, LocaleContextHolder.getLocale()));

    	model.addAttribute("name", 
    			MyUtils.getMessage("text", "http://mk.miksonx.com", "http://en.miksonx.com"));
    	
    	return "proba";
    }
    @RequestMapping("/proba/{id}")
    public  String probaId(Model model, 
    		@PathVariable("id") int id,
    		@RequestParam(required=false) String name){
    	
    	model.addAttribute("id", id);
    	model.addAttribute("name", name);
    	return "hello-id";
    }
//	@RequestMapping("/proba")
//	public ModelAndView hello() {
//		ModelAndView mav = new ModelAndView("proba"); //the logical view name
//		mav.addObject("name", "MiksonX");
//		return mav;
//	}
}
