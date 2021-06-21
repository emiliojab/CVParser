/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Engine;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

/**
 *
 * @author User
 */
public class EmailExtractor implements ExtractorEngine {

    private static final Pattern EMAIL_ADDRESS_PATTERN = Pattern.compile("[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}", Pattern.CASE_INSENSITIVE);
    PDFTextStripper strip;
    PDDocument doc;
    String str;
    String emailAddress;
    
    @Override
    public void Extract(File file) {
        try {
            this.strip = new PDFTextStripper();
            doc = PDDocument.load(file);
            str = this.strip.getText(doc);
            doc.close();
        } catch (IOException ex) {
            Logger.getLogger(EmailExtractor.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.emailAddress = matchingEmail(str);
    }
    
    public String matchingEmail(String str){
        Matcher match = EMAIL_ADDRESS_PATTERN.matcher(str);
        if(match.find()){
            return match.group();
        } else return "N/A";
    }

    @Override
    public String getElement() {
        return this.emailAddress;
    }

}
