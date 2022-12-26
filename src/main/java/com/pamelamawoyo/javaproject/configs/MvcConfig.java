package com.pamelamawoyo.javaproject.configs;

import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer{
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		Path brandUploadDir = Paths.get("./car-photos");
		String brandUploadPath = brandUploadDir.toFile().getAbsolutePath();
		registry.addResourceHandler("/car-photos/**").addResourceLocations("file:/" + brandUploadPath +'/');
//        exposeDirectory("./car-photos", registry);
    }
     
//    private void exposeDirectory(String dirName, ResourceHandlerRegistry registry) {
//        Path uploadDir = Paths.get(dirName);
//        String uploadPath = uploadDir.toFile().getAbsolutePath();
//         
//        if (dirName.startsWith("../")) dirName = dirName.replace("../", "");
//         
//        registry.addResourceHandler("/" + dirName + "/**").addResourceLocations("file:/"+ uploadPath + "/");
//    }

}
