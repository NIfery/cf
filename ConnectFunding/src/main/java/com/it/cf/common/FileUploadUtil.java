package com.it.cf.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component  
public class FileUploadUtil {
	
	private static final Logger logger
		= LoggerFactory.getLogger(FileUploadUtil.class);
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request,int pathFlag)
			throws IllegalStateException, IOException {
		
		MultipartHttpServletRequest multiRequest =
					(MultipartHttpServletRequest) request; 
	
		List<Map<String, Object>> list = new ArrayList<>();
		
		Map<String, MultipartFile> filesMap	= multiRequest.getFileMap();
		
		Iterator<String> iter = filesMap.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			MultipartFile tempFile = filesMap.get(key);
			
			if(!tempFile.isEmpty()) {
				long fileSize = tempFile.getSize();
				String originFileName = tempFile.getOriginalFilename();
				
				//변경된 파일 이름  
				String fileName = getUniqueFileName(originFileName);
				//업로드 경로
				String uploadPath = getUploadPath(request,pathFlag);
				
				//업로드 처리하기 - 업로드 경로에 업로드 파일 저장
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file); //저장
				
				
				//return 시에 vo에 담아서 저장해서 리턴해도 가능하지만 map에 담아서 리턴해도 가능하다.
				//vo와 map은 같은 역할을한다. vo에는 변수들이 많기때문에 . 깔끔하게 필요한것만 사용하기위해 map 사용 
				
				Map<String, Object> map = new HashMap<>();
				map.put("fileName", fileName);				
				map.put("fileSize", fileSize);
				map.put("originalFileName", originFileName);
				
				list.add(map);
			}
		}//while
		
		return list;
	}
	
	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		//업로드 경로 구하기
		String path ="";
		
		if(ConstUtil.FILE_UPLOAD_TYPE.equals("BoardUp")) {
			if(pathFlag==ConstUtil.UPLOAD_FILE_FLAG) {
				path = ConstUtil.FILE_UPLOAD_PATH_BOARD;
			}
		}else {
			if(pathFlag==ConstUtil.UPLOAD_FILE_FLAG) {
				path = ConstUtil.FILE_UPLOAD_PATH;
			}
			//실제 물리적인 경로 구하기
			path = request.getSession().getServletContext().getRealPath(path);
		}
		
		logger.info("업로드 경로 : {}", path);
		
		return path;
	}
	
	public String getUniqueFileName(String fileName) {
		
		//순수파일명만 구하기
		int idx = fileName.lastIndexOf(".");
		String fName = fileName.substring(0, idx);
		
		//확장자 구하기
		String ext = fileName.substring(idx);
		
		String result = fName + "_" + getTimeStamp()+ext;
		logger.info("변경된 파일명 :{}", result);
		return result;
		
	}
	
	public String getTimeStamp() {
		Date d = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str = sdf.format(d);
		
		return str;
	}
}
