package com.fsoft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fsoft.entities.Course;
import com.fsoft.services.CourseService;
import com.fsoft.utils.Constants;
import com.fsoft.utils.Log4J;

@Controller
public class CourseController {
  @Autowired
  private CourseService courseService;

  /* @Autowired
   private Course course;*/

  @RequestMapping(value = "/search", method = RequestMethod.GET)
  public String search(HttpServletRequest request) {

    String pageNumber = null;

    String action = request.getParameter("action");
    String redirect = request.getParameter("redirect");

    Log4J.getLogger().info("action: " + action);

    if ((Constants.ACTION.equalsIgnoreCase(action))
        || (Constants.REDIRECT.equalsIgnoreCase(redirect))) {
      pageNumber = Constants.INITIAL_PAGE;
    } else {
      pageNumber = request.getParameter("pageNumber");

    }
    Log4J.getLogger().info(pageNumber);

    String courseTitle = request.getParameter("courseTitle");
    String courseCode = request.getParameter("courseCode");

    if (courseTitle == null) {
      courseTitle = "";
    }

    if (courseCode == null) {
      courseCode = "";
    }

    List<Course> listOfCourse;
    try {
      listOfCourse = courseService.findByPageandSearch(
          Integer.parseInt(Constants.PAGE_SIZE),
          Integer.parseInt(pageNumber), courseCode, courseTitle);

      if ((listOfCourse.size() > 0)
          || (Constants.ACTION.equalsIgnoreCase(action))) {

        request.setAttribute("page", Integer.parseInt(pageNumber));
        request.setAttribute("listOfCourse", listOfCourse);

        return "course_table_search";
      }

      return (String) Constants.OTHER_RESULT;

    } catch (Exception e) {
      Log4J.getLogger().error(e.getMessage());
      request.setAttribute("message", "Error!");
      return "error";
    }

  }

  @RequestMapping(value = "/saveCourse", method = RequestMethod.POST)
  public String save(@ModelAttribute Course course, ModelMap modelMap) {

    /*course.setCourseCode(courseCode);
    course.setCourseTitle(courseTitle);
    course.setDuration(Integer.parseInt(duration));
    course.setDescriptions(descriptions);
    int courseStatus = (status == null) ? 0 : 1;
    course.setStatus(courseStatus);*/

    String result = courseService.add(course);
    if (Constants.SUCCESS.equalsIgnoreCase(result)) {
      modelMap
          .addAttribute("message_success", "Add/Update a course success!");
      return Constants.COURSE_ADD;
    } else {
      modelMap.addAttribute("message_fail", "Add/Update new course fail!");
      return Constants.COURSE_ADD;
    }
  }

  @RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
  public String update(@RequestParam("courseCode") String courseCode,
      ModelMap modelMap) {
    Course course = courseService.findOne(courseCode);

    modelMap.addAttribute("update", true);
    modelMap.addAttribute("course", course);

    return Constants.COURSE_ADD;
  }

  @RequestMapping(value = "/deleteCourse", method = RequestMethod.POST)
  public String delete(@RequestParam("courseCode") String courseCode) {
    Course course = courseService.findOne(courseCode);

    Log4J.getLogger().info(course);

    try {
      courseService.delete(course);
    } catch (Exception e) {
      Log4J.getLogger().error(e.getMessage());
      return "redirect:/initial/error";
    }

    return "redirect:/initial/course_list";
  }
}
