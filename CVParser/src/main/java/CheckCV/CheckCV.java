/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CheckCV;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCV extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String CVPath = request.getParameter("hInp");
        File file = new File(CVPath);
        response.setHeader("Content-Type", getServletContext().getMimeType(file.getName()));
        response.setHeader("Content-Length", String.valueOf(file.length()));
        response.setHeader("Content-Disposition", "inline");
        Files.copy(file.toPath(), response.getOutputStream());
    }

}
