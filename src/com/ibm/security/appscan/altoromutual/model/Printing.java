package com.ibm.security.appscan.altoromutual.model;

import yahoofinance.Stock;
import yahoofinance.YahooFinance;
import yahoofinance.histquotes.HistoricalQuote;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Calendar;
import java.util.List;

import static yahoofinance.histquotes.Interval.MONTHLY;

public class Printing {

    public  List printingresult(String name,int year) throws IOException {
        Calendar from = Calendar.getInstance();
        Calendar to = Calendar.getInstance();
        year=year*(-1);
        from.add(Calendar.YEAR, year);

        Stock stock = YahooFinance.get(name);
        List<HistoricalQuote> past = stock.getHistory(from, to, MONTHLY);
        List<List<Object>> results = new ArrayList<>();
        List<List<Object>> check = new ArrayList<>();

        for (HistoricalQuote x: past) {
            List<Object> save = new ArrayList<>();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = dateFormat.format(x.getDate().getTime());

            save.add(dateStr.toString());
            save.add(x.getAdjClose());
            results.add(save);
        }
        System.out.println(results);


       return results;
    }
    
    public static void main(String[] args) throws IOException {
        Printing p= new Printing();
        p.printingresult("SPY",3);

    }

}
