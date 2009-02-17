package com.amb.wikishare.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.amb.wikishare.service.WikipageService;

public class FrontpageController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass()); 

	private Map<String, Object> model = new HashMap<String, Object>();
	private WikipageService wpService = null;
	
	public ModelAndView handleRequest(
			HttpServletRequest request,
			HttpServletResponse response) {

		try {
			model.put("pages", wpService.getWikipagesList(true, true));
		} catch (Exception e) {
			model.put("error", "Service not available.");
			logger.error("No DB connection or no pages found ind DB.");
		}
		
		return new ModelAndView("frontpage", "model", model);
	}

	public void setWikipageService(WikipageService wpService) {
		this.wpService = wpService;
	}

}
