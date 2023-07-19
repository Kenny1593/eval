package com.example.eval.controller;

import com.example.eval.dao.HibernateDao;
import com.example.eval.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private HibernateDao hibernateDao;
    @Autowired
    private HomeController homeController;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.registerCustomEditor(Timestamp.class, new TimestampEditor());
    }

    @GetMapping("/home")
    public ModelAndView patient(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView= new ModelAndView();
            List<Patient> patients= hibernateDao.findAll(Patient.class);
            modelAndView.addObject("patients",patients);
            modelAndView.setViewName("admin/Home");
            return modelAndView;
        }
    }
    @PostMapping("/insertPatient")
    public ModelAndView insertPatient(@ModelAttribute Patient patient,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(patient);
            return patient(httpSession);
        }
    }

    @GetMapping("/modifPa/{id}")
    public ModelAndView modif(@PathVariable(name = "id")Integer id, HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("/admin/ModifPatient");
            Patient patient=hibernateDao.findById(Patient.class,id);
            System.out.println(patient.getDateAjout());
            modelAndView.addObject("patient",patient);
            return modelAndView;
        }
    }
    @PostMapping("/modifPatient")
    public ModelAndView modifEve(@ModelAttribute Patient patient,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(patient);
            return patient(httpSession);
        }
    }

    @GetMapping("/typeActe")
    public ModelAndView acte(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView = new ModelAndView();
            List<TypeActe> typeActes = hibernateDao.findAll(TypeActe.class);
            modelAndView.addObject("typeActes", typeActes);
            modelAndView.setViewName("admin/TypeActe");
            return modelAndView;
        }
    }
    @PostMapping("/insertActe")
    public ModelAndView insertActe(@ModelAttribute TypeActe typeActe, HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(typeActe);
            return acte(httpSession);
        }
    }

    @GetMapping("/typeDepense")
    public ModelAndView depense(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView = new ModelAndView();
            List<TypeDepense> typeDepenses = hibernateDao.findAll(TypeDepense.class);
            modelAndView.addObject("typeDepenses", typeDepenses);
            modelAndView.setViewName("admin/AjoutTypeDepense");
            return modelAndView;
        }
    }
    @PostMapping("/insertDepense")
    public ModelAndView insertDepense(@ModelAttribute TypeDepense typeDepense, HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(typeDepense);
            return depense(httpSession);
        }
    }

    @GetMapping("/tableBord")
    public ModelAndView tableBord(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView=new ModelAndView();
            List<Annee> annees=hibernateDao.findAll(Annee.class);
            modelAndView.addObject("annees",annees);
            modelAndView.setViewName("admin/TableBord");
            return modelAndView;
        }
    }

    @GetMapping("/annee")
    public ModelAndView annee(@RequestParam Integer annee,@RequestParam Integer mois,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {

            V_recette vRecette= new V_recette();
            vRecette.setAnnee(annee);

            List<V_depense> vDepenses=hibernateDao.findQuery(V_depense.class,"select * from v_vraiDep vv where vv.mois="+mois+" and vv.annee="+annee);
            ModelAndView modelAndView=tableBord(httpSession).addObject("vDepenses",vDepenses);
            List<V_recette> vRecettes=hibernateDao.findQuery(V_recette.class,"select * from v_vraiRecette vv where vv.mois="+mois+" and vv.annee="+annee);
            modelAndView.addObject("annee",annee);
            modelAndView.addObject("vRecettes",vRecettes);
            return modelAndView;

        }
    }

    @GetMapping("/modifTypeActe/{id}")
    public ModelAndView modifTypeActe(HttpSession httpSession, @PathVariable Integer id){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView=new ModelAndView();
            TypeActe typeActe=hibernateDao.findById(TypeActe.class,id);
            System.out.println(typeActe);
            modelAndView.addObject("typeActe",typeActe);
            modelAndView.setViewName("admin/ModifActe");
            return modelAndView;
        }
    }
    @PostMapping("/modifActe")
    public ModelAndView modifActe(HttpSession httpSession,@ModelAttribute TypeActe typeActe){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(typeActe);
            return acte(httpSession);
        }
    }

    @GetMapping("/modifTypeDepense/{id}")
    public ModelAndView modifTypeDepense(HttpSession httpSession, @PathVariable Integer id){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView=new ModelAndView();
            TypeDepense typeDepense=hibernateDao.findById(TypeDepense.class,id);
            modelAndView.addObject("typeDepense",typeDepense);
            modelAndView.setViewName("admin/ModifTypeDepense");
            return modelAndView;
        }
    }
    @PostMapping("/modifTyDep")
    public ModelAndView modifTyDep(HttpSession httpSession,@ModelAttribute TypeDepense typeDepense){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(typeDepense);
            return depense(httpSession);
        }
    }






}
