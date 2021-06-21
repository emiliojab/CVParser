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
public class SkillExtractor implements ExtractorEngine {

    PDFTextStripper strip;
    PDDocument doc;
    String str, importedSkills, skills;
    String[] skillList;
    File file;

    @Override
    public void Extract(File file) {
        try {
            this.strip = new PDFTextStripper();
            this.doc = PDDocument.load(file);
            this.str = this.strip.getText(doc);
            this.doc.close();
            this.skillList = skillImport();
        } catch (IOException ex) {
            Logger.getLogger(SkillExtractor.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.skills = matchingSkills(this.str, this.skillList);
    }

    public String[] skillImport() throws FileNotFoundException, IOException {
        this.file = new File(getClass().getClassLoader().getResource("Skills.txt").getFile());
        FileReader fr = new FileReader(this.file);
        BufferedReader br = new BufferedReader(fr);
        this.importedSkills = br.readLine();
        return this.importedSkills.split(",");
    }

    public String matchingSkills(String text, String[] skills) {
        StringBuilder skillcont = new StringBuilder();
        for (String word : skills) {
            if (text.toLowerCase().contains(word)) {
                skillcont.append(word).append(", ");
            }
        }
        if (skillcont.length() > 0) {
            return skillcont.toString().substring(0, skillcont.length() - 2);
        } else {
            return "No Needed Skills";
        }
    }

    @Override
    public String getElement() {
        return this.skills;
    }

}
