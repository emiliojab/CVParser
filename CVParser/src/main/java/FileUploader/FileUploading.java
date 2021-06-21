package FileUploader;

import Parser.CVParse;
import Parser.DbStore;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploading extends HttpServlet {

    String fullname = "";
    String pdfLink = "";
    String message = "";
    File file;
    int id;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
        List<FileItem> files;
        String fname = "";
        String lname = "";
        
        try {
            files = sf.parseRequest(request);
            for (FileItem item : files) {
                if (item.isFormField()) {
                    if ("lname".equals(item.getFieldName())) {
                        lname = item.getString();
                    } else if ("fname".equals(item.getFieldName())) {
                        fname = item.getString();
                    } else if("message".equals(item.getFieldName())){
                        message = item.getString();
                    }
                }
            }

            this.fullname = fname + " " + lname;

            for (FileItem item : files) {
                if (!item.isFormField()) {
                    if ("pdf".equals(getFileExtension(item))) {
                        this.id = DbStore.getIdCount() + 1;
                        this.pdfLink = "C:\\Users\\User\\Desktop\\UploadedCvs\\" + this.id + ".pdf";
                        this.file = new File(this.pdfLink);
                        item.write(this.file);
                        ParseCV(this.file);
                    } else {
                        System.out.println("invalid");
                    }
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(FileUploading.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        response.sendRedirect("Submitted.jsp");
        pw.close();

        System.out.println("Done");
    }

    public String getFileExtension(FileItem file) {
        String name = file.getName();
        if (name.contains(".")) {
            int i = name.lastIndexOf(".") + 1;
            if (i == -1) {
                return "Empty";
            }
            return name.substring(i);
        }
        return name;
    }

    public void ParseCV(File file) throws IOException {
        ArrayList ext;
        ext = CVParse.Parse(file, this.pdfLink);
        String emailAdd = (String) ext.get(0);
        String phoneNb = (String) ext.get(1);
        String spLang = (String) ext.get(2);
        String prLang = (String) ext.get(3);
        String skills = (String) ext.get(4);
        
        DbStore.Store(this.fullname, phoneNb, emailAdd, spLang, prLang, skills, pdfLink, this.message);
    }

}
