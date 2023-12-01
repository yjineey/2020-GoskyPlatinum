package kr.co.gugu.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	//servlet_context에 지정한 파일업로드 id _ 참조하겠다 // 경로설정.
	@Resource(name = "uploadPath")
	private String uploadPath;

	//파일업로드 : 업로드 버튼클릭 _ 임시디렉토리 업로드 _ 지정된 디렉토리 저장 _ file 저장
	@RequestMapping(value = "/UploadForm", method = RequestMethod.GET)
	public String UploadForm() {
		return "notice/UploadForm";
	}

	//파일이름_크기_타입 로그설정
	@RequestMapping(value = "/UploadForm", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public ModelAndView UploadForm(MultipartFile file) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		String savedName = file.getOriginalFilename();
		  savedName = uploadFile(savedName, file.getBytes());

		mav.setViewName("notice/Upload");
		mav.addObject("savedName", savedName);
		
		return mav;
	}
	
    // 파일명 랜덤생성 메서드
    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
        UUID uuid = UUID.randomUUID();
        // 랜덤생성+파일이름 저장
        String savedName = uuid.toString()+"_"+originalName;
        File target = new File(uploadPath, savedName);
        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target);
        return savedName;
    }
}	