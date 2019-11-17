package com.fsoft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.fsoft.entities.Clazz;
import com.fsoft.entities.Course;
import com.fsoft.entities.LearningPath;
import com.fsoft.entities.Trainer;
import com.fsoft.services.ClazzAdminService;
import com.fsoft.services.ClazzService;
import com.fsoft.services.CourseService;
import com.fsoft.services.LearningService;
import com.fsoft.services.TrainerService;
import com.fsoft.utils.Constants;
import com.fsoft.utils.Log4J;

@Controller
public class AppController {
  @Autowired
  private ClazzService clazzService;
  @Autowired
  private CourseService courseService;
  @Autowired
  private ClazzAdminService clazzAdminService;
  @Autowired
  private TrainerService trainerService;

  /**
   * Use SpEL.
   */
  @Value("#{'${mentor}'.split(',')}")
  private List<String> mentors;

  /**
   * Use SpEL.
   */
  /*@Value("#{'${technic_name}'.split(',')}")
  private List<String> technics;*/

  @Autowired
  private LearningService learningService;

  // ModelAndView modelAndView = new ModelAndView();
  RedirectView redirectView = new RedirectView();

  @RequestMapping(value = { "/singout" }, method = RequestMethod.GET)
  public String signOut(HttpServletRequest request) {

    request.getSession().removeAttribute("user");
    
    return "sign-in";
  }

  /**
   * initial method.
   * 
   * @param modelMap
   *          a ModelMap object.
   * @param page
   *          a String object to present current page.
   * @return
   */
  // @RequestMapping(value = "/initial", method = RequestMethod.GET)
  @GetMapping(path = "/initial/{page}")
  public RedirectView initial(Model model, @PathVariable String page,
      RedirectAttributes redir) {

    Log4J.getLogger().info(page);

    // modelAndView.setViewName("redirect:/index.htm");
    redir.addAttribute("page", page);

    redirectView.setContextRelative(true);
    redirectView.setUrl("/index/{page}");

    /*
     * List all of Courses
     */
    switch (page) {
    case Constants.COURSE_LIST:
      List<Course> listOfCourse = null; // courseService.findAll();

      String pageNumber = Constants.INITIAL_PAGE;

      String courseTitle = Constants.INITIAL_TITLE;
      String courseCode = Constants.INITIAL_CODE;

      try {
        listOfCourse = courseService.findByPageandSearch(
            Integer.parseInt(Constants.PAGE_SIZE),
            Integer.parseInt(pageNumber), courseCode, courseTitle);

        if (listOfCourse.size() == 0) {
          redir.addFlashAttribute("page", "0");
        } else {
          redir.addFlashAttribute("page", Integer.parseInt(pageNumber));
        }

        redir.addFlashAttribute("listOfCourse", listOfCourse);
        
      } catch (Exception e) {
        redirectView.setUrl("/error/{page}");
      }
      return redirectView;

    case Constants.COURSE_ADD:
      return redirectView;
    
    case Constants.CLAZZ_ADD:
      /*
       * Init data
       */
      List<LearningPath> technics = learningService.findAll();
      List<Trainer> admins = clazzAdminService.findAll();

      redir.addFlashAttribute("admins", admins);
      redir.addFlashAttribute("mentors", mentors);
      redir.addFlashAttribute("technics", technics);

      return redirectView;
    default:
      Log4J.getLogger().info("Inside");
      return redirectView;
    }

  }

  /**
   * This method to get all course.
   * 
   * @param modelMap
   *          ModelMap object.
   * @return
   */
  @RequestMapping(value = "/setupCourse", method = RequestMethod.GET)
  public String setupCourse(ModelMap modelMap) {

    List<Course> listOfCourse = courseService.findAll();
    modelMap.addAttribute("listOfCourse", listOfCourse);
    return Constants.COURSE_LIST;

  }

  /**
   * The method show index page with context corresponding to the request.
   * 
   * @param page
   *          the content page.
   * @param model
   *          the object that contain data.
   * @return a string object.
   */
  @SuppressWarnings("unchecked")
  @RequestMapping(value = "/index/{page}", method = RequestMethod.GET)
  public String index(@PathVariable("page") String page, Model model) {
    Log4J.getLogger().info(page);

    if (Constants.COURSE_ADD.equalsIgnoreCase(page))
      return page;

    List<Course> courses = (List<Course>) model.asMap().get("listOfCourse");
    
    Log4J.getLogger().info(courses);
    if ((courses == null) || (courses.size() == 0)) {
      return "redirect:/initial/" + page;
    }
    return page;
  }

}
