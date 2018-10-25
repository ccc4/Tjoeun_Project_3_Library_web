package mvc.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.action.Action;

@WebServlet(urlPatterns= {"/"}, loadOnStartup=1)
@MultipartConfig
public class FrontController extends HttpServlet {
	
	private HashMap<String, Action> actionMap;
       
	@Override
	public void init() throws ServletException {
		
		Properties prop = new Properties();
		String filePath = "/WEB-INF/URIMappingInfo.properties";
		filePath = getServletContext().getRealPath(filePath);
		File file = new File(filePath);
		
		try (FileReader reader = new FileReader(file)){
			prop.load(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionMap = new HashMap<>();
		
		Enumeration<Object> enu = prop.keys();
		while(enu.hasMoreElements()) {
			String key = (String) enu.nextElement();
			String value = prop.getProperty(key);
			
			try {
				Class<?> object = Class.forName(value);
				Action action = (Action)object.newInstance();
				actionMap.put(key, action);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		
		Action action = null;
		action = actionMap.get(uri);
		
		if(action != null) action.execute(request, response);
	}
}
