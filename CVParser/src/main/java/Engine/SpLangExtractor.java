/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Engine;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

/**
 *
 * @author User
 */
public class SpLangExtractor implements ExtractorEngine {

    PDFTextStripper strip;
    PDDocument doc;
    String str, importedLangs, langs;
    String[] langsList;
    File file;

    @Override
    public void Extract(File file) {
        try {
            this.strip = new PDFTextStripper();
            this.doc = PDDocument.load(file);
            this.str = this.strip.getText(doc);
            this.doc.close();
            this.langsList = LangImport();
        } catch (IOException ex) {
            Logger.getLogger(SpLangExtractor.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.langs = MatchingLangs(this.str, this.langsList);
    }

    public String[] LangImport() throws FileNotFoundException, IOException {
        this.file = new File(getClass().getClassLoader().getResource("SpLang.txt").getFile());
        FileReader fr = new FileReader(this.file);
        BufferedReader br = new BufferedReader(fr);
        this.importedLangs = br.readLine();
        return this.importedLangs.split(",");
    }

    public String MatchingLangs(String text, String[] skills) {
        StringBuilder langcont = new StringBuilder();
        for (String word : skills) {
            if (text.toLowerCase().contains(word)) {
                langcont.append(word).append(", ");
            }
        }
        if (langcont.length() > 0) {
            return langcont.toString().substring(0, langcont.length() - 2);
        } else {
            return "N/A";
        }
    }

    @Override
    public String getElement() {
        return this.langs;
    }

}
