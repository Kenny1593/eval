package com.example.eval.controller;

import com.example.eval.dao.HibernateDao;
import com.example.eval.model.*;

import com.example.eval.service.CSVReaderService;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private HibernateDao hibernateDao;
    @Autowired
    private AdminController adminController;
    @Autowired
    private UtilisateurController utilisateurController;

    @PostMapping("/import")
    public ModelAndView importation(@RequestParam MultipartFile file, HttpSession httpSession) {
        List<String[]> tabl = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            CSVReader csvReader = new CSVReader(reader);
            String[] nextLine;
            while ((nextLine = csvReader.readNext()) != null) {
                for (String text : nextLine) {
                    String[] valeur = text.split(";");
                    tabl.add(valeur);
                }
            }
            for (String[] str : tabl) {
                Depense depense = new Depense();
                for (int i = 0; i < str.length; i++) {
                    System.out.println(str[i]);
                    String[] date = str[0].split("/");
                    for (int j = 0; j < date.length; j++) {
                        depense.setDate(Date.valueOf(date[2] + "-" + date[1] + "-" + date[0]));
                    }
                    List<TypeDepense> typeDepenses = hibernateDao.findAll(TypeDepense.class);
                    for (TypeDepense typeDepense : typeDepenses) {
                        if (str[1].equals(typeDepense.getCode())) {
                            depense.setTypeDepense(typeDepense);
                        }
                    }
                    depense.setMontant(Double.valueOf(str[2]));

                    Depense depense1 = hibernateDao.create(depense);
                    System.out.println(depense1);
                }
            }
        } catch (IOException | CsvValidationException e) {
            e.printStackTrace();
        }
        return utilisateurController.typeDep(httpSession);

    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Timestamp.class, new TimestampEditor());
    }


    @GetMapping("/")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @PostMapping("/connected")
    public ModelAndView connected(@RequestParam String nom, @RequestParam String pwd, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        Admin admin = hibernateDao.trait_log(nom, pwd);
        Utilisateur utilisateur = hibernateDao.trait_logUser(nom, pwd);
        if (admin != null && utilisateur == null) {
            session.setAttribute("idAdmin", admin.getId());
            return adminController.patient(session);
        }
        if (utilisateur != null && admin == null) {
            session.setAttribute("idClient", utilisateur.getId());
            return utilisateurController.homeUser(session);
        } else {
            return login();
        }

    }/*
    @GetMapping("/Paginate")
    public ModelAndView PaginateArticle(@RequestParam(name = "numPage" , defaultValue = "1") int numPage, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        int isaPage = HomeServcie.getPage(HomeServcie.nombre(), 2);
        modelAndView.setViewName("User/Pagination");
        modelAndView.addObject("isaPage",isaPage);
        session.setAttribute("id",1);
        List<V_solde> data = hibernateDao.paginateBe(numPage);
        modelAndView.addObject("liste",data);
        return modelAndView;
    }*/

}
