package com.example.eval.controller;

import com.example.eval.dao.HibernateDao;
import com.example.eval.model.*;
import com.example.eval.service.DateService;
import com.itextpdf.text.pdf.qrcode.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class UtilisateurController {
    @Autowired
    private HibernateDao hibernateDao;
    @Autowired
    private HomeController homeController;
    @Autowired
    private DateService dateService;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        binder.registerCustomEditor(Timestamp.class, new TimestampEditor());
    }

    @GetMapping("/homeUser")
    public ModelAndView homeUser(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView = new ModelAndView();
            List<Patient> patients = hibernateDao.findAll(Patient.class);
            modelAndView.addObject("patients", patients);
            modelAndView.setViewName("utilisateur/HomeUser");
            return modelAndView;
        }
    }

    @GetMapping("/facture/{id}")
    public ModelAndView facture(@PathVariable Integer id,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView = new ModelAndView();
            Patient patient = hibernateDao.findById(Patient.class, id);
            httpSession.setAttribute("patient", patient);
            modelAndView.setViewName("utilisateur/Date");
            return modelAndView;
        }
    }

    @GetMapping("/det")
    public ModelAndView det(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView = new ModelAndView();
            Facture facto = (Facture) httpSession.getAttribute("facto");
            List<TypeActe> typeActes = hibernateDao.findAll(TypeActe.class);
            List<DetailActePatient> detailActePatients = hibernateDao.findAll(DetailActePatient.class);

            modelAndView.addObject("detailActePatients", detailActePatients);
            modelAndView.addObject("typeActes", typeActes);
            modelAndView.addObject("fact", facto);
            modelAndView.setViewName("utilisateur/recette");
            return modelAndView;
        }
    }

    @PostMapping("/date")
    public ModelAndView date(@RequestParam Date date,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
        ModelAndView modelAndView= new ModelAndView();
        Patient patient=(Patient) httpSession.getAttribute("patient");
        Facture facture= new Facture();
        facture.setPatient(patient);
        facture.setDate(date);
        Facture fact=hibernateDao.create(facture);
        Integer IdFacture=fact.getId();
        List<TypeActe> typeActes= hibernateDao.findAll(TypeActe.class);
        modelAndView.addObject("IdFacture",IdFacture);
        modelAndView.addObject("typeActes",typeActes);
        modelAndView.addObject("fact",fact);
        modelAndView.setViewName("utilisateur/DetailsRecette");
        return modelAndView;
        }
    }




    @PostMapping("/detail")
    public ModelAndView detail(@ModelAttribute DetailActePatient detailActePatiente,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            Integer idFacture=detailActePatiente.getFacture().getId();
            hibernateDao.create(detailActePatiente);
            ModelAndView modelAndView=new ModelAndView();
            List<TypeActe> typeActes=hibernateDao.findAll(TypeActe.class);
            DetailActePatient detailActePatient= new DetailActePatient();
            Facture facture=hibernateDao.findById(Facture.class,idFacture);
            detailActePatient.setFacture(facture);
            List<DetailActePatient> detailActePatients= hibernateDao.findWhere(detailActePatient);

            modelAndView.addObject("typeActes",typeActes);
            modelAndView.addObject("detailActePatients",detailActePatients);
            modelAndView.addObject("fact",facture);
            modelAndView.setViewName("utilisateur/DetailsRecette");
            return modelAndView;

        }
    }


    @GetMapping("/modifdetail/{id}")
    public ModelAndView modifDetail(@PathVariable Integer id,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView = new ModelAndView();
            DetailActePatient detailActePatient = hibernateDao.findById(DetailActePatient.class, id);
            List<TypeActe> typeActes = hibernateDao.findAll(TypeActe.class);
            System.out.println(detailActePatient.getFacture().getId());

            modelAndView.addObject("detailActePatient", detailActePatient);
            modelAndView.addObject("typeActes", typeActes);
            modelAndView.setViewName("utilisateur/ModifDetail");
            return modelAndView;
        }
    }

    @PostMapping("/modDetail")
    public ModelAndView modDetail(@ModelAttribute DetailActePatient detailActePatient,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(detailActePatient);
            return det(httpSession);
        }
    }
    @GetMapping("/terminer")
    public ModelAndView terminer(HttpSession httpSession){
        return homeUser(httpSession);
    }

    @GetMapping("/listFact")
    public ModelAndView listeFact(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView= new ModelAndView();
            List<Facture> factures=hibernateDao.findAll(Facture.class);
            modelAndView.addObject("factures",factures);
            modelAndView.setViewName("utilisateur/listeFacture");
            return modelAndView;
        }
    }

    @GetMapping("/factu/{id}")
    public ModelAndView fact(@PathVariable Integer id, HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView= new ModelAndView();

            Facture facture= hibernateDao.findById(Facture.class,id);

            List<DetailActePatient> detailActePatients= hibernateDao.findAll(DetailActePatient.class);

            modelAndView.addObject("facture",facture);
            modelAndView.addObject("detailActePatients",detailActePatients);
            modelAndView.setViewName("utilisateur/statistique");
            return modelAndView;
        }
    }

    @GetMapping("/typeDep")
    public ModelAndView typeDep(HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView=new ModelAndView();
            List<TypeDepense> typeDepenses= hibernateDao.findAll(TypeDepense.class);
            List<Depense> depenses= hibernateDao.findAll(Depense.class);

            modelAndView.addObject("depenses",depenses);
            modelAndView.addObject("typeDepenses",typeDepenses);
            modelAndView.setViewName("utilisateur/TypeDepense");
            return modelAndView;
        }
    }
    @PostMapping("/ajoutDepense")
    public ModelAndView ajoutDepense(@RequestParam(name = "jour") int jour,@RequestParam(name = "mois") int[] mois,@RequestParam(name = "annee") int annee,@RequestParam(name = "montant") int montant,@RequestParam(name = "idTypeDepense") int idTypeDepense,HttpSession httpSession) throws Exception {
        if(httpSession==null){
            return homeController.login();
        }else {
            if(dateService.checkMois(jour,mois,annee)==true){
                dateService.inseretDepense(jour,mois,annee,montant,idTypeDepense);
            }
            return typeDep(httpSession);
        }
    }

    @GetMapping("/modifDepense/{id}")
    public ModelAndView modifDepense(@PathVariable Integer id,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView= new ModelAndView();
            Depense depense=hibernateDao.findById(Depense.class,id);
            List<TypeDepense> typeDepenses=hibernateDao.findAll(TypeDepense.class);
            modelAndView.addObject("typeDepenses",typeDepenses);
            modelAndView.addObject("depense",depense);
            modelAndView.setViewName("utilisateur/ModifDepense");
            return modelAndView;
        }
    }

    @PostMapping("/modifDep")
    public ModelAndView modifDep(@ModelAttribute Depense depense,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(depense);
            return typeDep(httpSession);
        }
    }

    @GetMapping("/modifFact/{id}")
    public ModelAndView modifFact(@PathVariable(name = "id") Integer id ,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            ModelAndView modelAndView= new ModelAndView();
            Facture facture=hibernateDao.findById(Facture.class,id);
            List<Patient> patients=hibernateDao.findAll(Patient.class);
            modelAndView.addObject("patients",patients);
            modelAndView.addObject("facture",facture);
            modelAndView.setViewName("utilisateur/ModifFacture");
            return modelAndView;
        }
    }

    @PostMapping("/modFact")
    public ModelAndView modFact(@ModelAttribute Facture facture,HttpSession httpSession){
        if(httpSession==null){
            return homeController.login();
        }else {
            hibernateDao.create(facture);
            return listeFact(httpSession);
        }
    }
    @GetMapping("/deleteDetails/{id}/{idFacture}")
    public String deleteDetails(@PathVariable(name = "id") Integer id,@PathVariable Integer idFacture,HttpSession httpSession){
        if(httpSession==null){
            return "redirect:/";
        }else {
            hibernateDao.deleteById(DetailActePatient.class,id);
            return "redirect:/factu/"+idFacture;
        }
    }

    @GetMapping("/deleteDepense/{id}")
    public String deleteDepense(@PathVariable(name = "id") Integer id,HttpSession httpSession){
        if(httpSession==null){
            return "redirect:/";
        }else {
            hibernateDao.deleteById(Depense.class,id);
            return "redirect:/typeDep";
        }
    }













}
