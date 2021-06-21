/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Engine;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

public class PhoneNbExtractor implements ExtractorEngine {

    private final List<Pattern> PATTERNS = new ArrayList<>();
    
    /* Five phone number formats, we could add more*/
    private final Pattern PHONE_NUMBER_PATTERN1 = Pattern.compile("(\\(\\d{3}\\))\\s*(\\d{3})\\s*(\\d{2})\\s*(\\d{2})");
    private final Pattern PHONE_NUMBER_PATTERN2 = Pattern.compile("\\+*(\\d{3})\\s*(\\d+)\\s*(\\d{3})\\s*(\\d{3})");
    private final Pattern PHONE_NUMBER_PATTERN3 = Pattern.compile("(\\+\\d{1,3}( )?)?((\\(\\d{3}\\))|\\d{3})[- .]?\\d{3}[- .]?\\d{4}");
    private final Pattern PHONE_NUMBER_PATTERN4 = Pattern.compile("(\\+\\d{1,3}( )?)?(\\d{3}[ ]?){2}\\d{3}");
    private final Pattern PHONE_NUMBER_PATTERN5 = Pattern.compile("(\\+\\d{1,3}( )?)?(\\d{3}[ ]?)(\\d{2}[ ]?){2}\\d{2}");

    PDFTextStripper strip;
    PDDocument doc;
    String str;
    String phoneNb;

    @Override
    public void Extract(File file) {

        try {
            this.strip = new PDFTextStripper();
            this.doc = PDDocument.load(file);
            this.str = this.strip.getText(this.doc);

            this.doc.close();
        } catch (IOException ex) {
            Logger.getLogger(PhoneNbExtractor.class.getName()).log(Level.SEVERE, null, ex);
        }

        this.phoneNb = matchingNb(this.str);
    }

    public String matchingNb(String str) {

        this.PATTERNS.add(PHONE_NUMBER_PATTERN1);
        this.PATTERNS.add(PHONE_NUMBER_PATTERN2);
        this.PATTERNS.add(PHONE_NUMBER_PATTERN3);
        this.PATTERNS.add(PHONE_NUMBER_PATTERN4);
        this.PATTERNS.add(PHONE_NUMBER_PATTERN5);

        for (Pattern p : this.PATTERNS) {
            Matcher matcher = p.matcher(this.str);
            if (matcher.find()) {
                return matcher.group();
            }
        }
        return "N/A";

    }
    /*if we are expecting one format for example the lebanese format and we want to clean/shrink it to save storage in database we can use the following method*/
    
//    public String phoneNbCleaner(String str) {
//        if (str.equals("N/A")) {
//            return str;
//        } else if (str.substring(0, 5).equals("+961 ")) {
//            str = str.substring(5).replaceAll(" ", "");
//            if (str.charAt(0) == '0') {
//                str = str.replaceFirst("0", "");
//            }
//            return str;
//        } else if (str.substring(0, 4).equals("961 ")) {
//            str = str.substring(4).replaceAll(" ", "");
//            if (str.charAt(0) == '0') {
//                str = str.replaceFirst("0", "");
//            }
//            return str;
//        }
//        return "An unidentified error occured while executing method PhoneNbExtractor.phoneNbCleaner(String str) at line 58";
//    }

    @Override
    public String getElement() {

        return this.phoneNb;
    }
}
