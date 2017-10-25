package com.gonzaleznestorweb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gonzaleznestorweb.model.Activity;
import com.gonzaleznestorweb.model.Exercise;
import com.gonzaleznestorweb.model.Goal;
import com.gonzaleznestorweb.service.ExerciseService;

@Controller
public class MinutesController {
	
	@Autowired
	private ExerciseService exerciseService;
	
	private List<Exercise> listExercises = new ArrayList<Exercise>();
	private int minTotal;
	
	@RequestMapping(value = "/addMinutes")
	public String addMinutes(@ModelAttribute("exercise") Exercise exercise) {
				
		if(exercise.getActivity()!=null 
		&& exercise.getActivity().compareTo("")!=0 
		&& exercise.getMinutes()!=0		
		&& exercise != null)
			listExercises.add(exercise);
		exercise.setList(showList());
		exercise.setTotalMinutes(minTotal);
		return "addMinutes";
	}
	
	//this shows the list of activities for today entered by the user
	private String showList() {
		String str = "<ul>";
		int totalMinutes = 0;	
		for(Exercise exer:listExercises) {
			str = str.concat("<li>"+exer.getActivity() + " " + exer.getMinutes()+" min </li>");	
			totalMinutes += exer.getMinutes();
		}
		str = str.concat("</ul>");
		minTotal = totalMinutes;
		return str;
	}

	//It find all activities availables and put it on a combobox
	@RequestMapping(value = "/activities", method = RequestMethod.GET)
	public @ResponseBody List<Activity> findAllActivities(){		
		return exerciseService.findAllActivities();
	}
	
	
/*	@RequestMapping(value = "/addMoreMinutes")
	public String addMoreMinutes(@ModelAttribute("exercise") Exercise exercise) {
		System.out.println("exercising: " + exercise.getMinutes());
		return "addMinutes";
	}*/

}
