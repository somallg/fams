package com.fsoft.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fsoft.entities.Clazz;
import com.fsoft.services.ClazzService;
import com.fsoft.utils.Constants;
import com.fsoft.utils.Log4J;

@Controller
public class ClazzController {

  @Autowired
  private ClazzService clazzService;

  @RequestMapping(value = "/clazz_list", method = RequestMethod.GET)
  public String findAll(ModelMap modelMap) {
    List<Clazz> listOfClazz = clazzService.findAll();

    modelMap.addAttribute("listOfClazz", listOfClazz);

    Log4J.getLogger().info(listOfClazz.size());

    return Constants.CLAZZ_LIST;
  }

  //
  @RequestMapping(value = "/clazz_remove", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
  @ResponseBody
  public List<Clazz> remove(@RequestBody List<String> clazzIds) {
    Log4J.getLogger().info("Deleting ");
    Log4J.getLogger().info("Deleting " + clazzIds);
    //
    // Deleting

    List<Clazz> listOfClazz = clazzService.findAll();
    // List<Clazz> listOfClazz = new ArrayList<Clazz>();
    // Clazz clazz = new Clazz();
    // clazz.setClazzId(1);

    // listOfClazz.add(clazz);
    // https://stackoverflow.com/questions/19894955/spring-jsonignore-not-working

    return listOfClazz;
  }
  
 
}
