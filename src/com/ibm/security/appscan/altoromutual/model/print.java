package com.ibm.security.appscan.altoromutual.model;

import yahoofinance.Stock;
import yahoofinance.YahooFinance;
import yahoofinance.histquotes.HistoricalQuote;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Calendar;
import java.util.List;

import static yahoofinance.histquotes.Interval.DAILY;

public class print {
    public static void main(String[] args) throws IOException {
        Calendar from = Calendar.getInstance();
        Calendar to = Calendar.getInstance();
        from.add(Calendar.YEAR, -5);

        List<BigDecimal> save=new ArrayList<>();
        Stock stock = YahooFinance.get("TSLA");
        List<HistoricalQuote> past = stock.getHistory(from, to, DAILY);

        for (HistoricalQuote x: past) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = dateFormat.format(x.getDate().getTime());

            System.out.println(dateStr);
            System.out.println(x.getAdjClose());
            System.out.println(x.getVolume());
            System.out.println("==========================");
            save.add(x.getAdjClose());

        }


    }

}
