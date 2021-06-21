/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parser;

import Engine.EmailExtractor;
import Engine.ExtractorEngine;
import Engine.PhoneNbExtractor;
import Engine.PrLangExtractor;
import Engine.SkillExtractor;
import Engine.SpLangExtractor;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class CVParse {
    private static ArrayList extracted;
    
    public static ArrayList Parse(File file, String path) throws IOException{
        ExtractorEngine ext = new EmailExtractor();
        ExtractorEngine ext1 = new PhoneNbExtractor();
        ExtractorEngine ext2 = new SpLangExtractor();
        ExtractorEngine ext3 = new PrLangExtractor();
        ExtractorEngine ext4 = new SkillExtractor();
        ext.Extract(file);
        ext1.Extract(file);
        ext2.Extract(file);
        ext3.Extract(file);
        ext4.Extract(file);
        
        extracted = new ArrayList(5);
        extracted.add(ext.getElement());
        extracted.add(ext1.getElement());
        extracted.add(ext2.getElement());
        extracted.add(ext3.getElement());
        extracted.add(ext4.getElement());
        
        return extracted;
    }
}
