package com.example.eval.service;

import com.opencsv.CSVParser;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import org.springframework.stereotype.Service;


import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class CSVReaderService {

    public void readCSV(String filePath) {


        try (CSVReader reader = new CSVReader(new FileReader(filePath))) {
            String[] nextLine;
            while ((nextLine = reader.readNext()) != null) {
                for(String text:nextLine){
                    System.out.println(text);
                }

            }
        } catch (IOException | CsvValidationException e) {
            e.printStackTrace();
        }



    }
}

