package com.poppyred.common;

import java.io.File;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poppyred.domain.EventAttachVo;
import com.poppyred.domain.MenuAttachVo;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component // 개발자가 직접 스프링에게 빈(객체)으로 등록하고 싶을 때 사용
public class FileUploadUtil {
	private final String uploadFolder = Paths.get("C:", "uploadcafe").toString();

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); // os환경에 맞는 파일 구분자로 치환. 윈도우 \\, 리눅스 /
	}

	public MenuAttachVo uploadFiles(final @RequestParam("uploadfile") MultipartFile uploadfile) {

		String uploadFolderPath = getFolder();
		// uploadFolderPath => 2024/03/18
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		// uploadPath => C:/upload/2024/03/18
		MenuAttachVo vo = new MenuAttachVo();
		String uploadFileName = uploadfile.getOriginalFilename();
		String uploadFileOri = uploadfile.getOriginalFilename();

		// 중복방지 유일한 값 생성
		UUID uuid = UUID.randomUUID();
		// 중복방지를 위해서 UUID 유일한 값 생성
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		// UUID값_uploadFileName을 합쳐서 새로운 업로드 파일 이름 생성

		// uploadPath c:/upload/2024/03/18
		if (uploadPath.exists() == false) { // 파일의 존재여부
			uploadPath.mkdirs(); // 상위 폴더부터 생성
		}

		File saveFile = new File(uploadPath, uploadFileName);
		// saveFile => //uploadPath => C:/upload/2024/03/18/a.jpg
		try {
			uploadfile.transferTo(saveFile);
			// 파일을 물리적으로 지정된 경로에 저장
			vo.setUuid(uuid.toString());
			vo.setUploadpath(uploadFolderPath);
			vo.setUploadfile(uploadFileOri);
			// DB에 저장하기 위해서 vo에 set

		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;

	}
	public void getDeleteFile(MenuAttachVo vo) {
		File uploadpath = new File(uploadFolder, vo.getUploadpath());
		String filename = vo.getUuid() + "_" + vo.getUploadfile();
		File deletefile = new File(uploadpath, filename);
		deletefile.delete();
	}
}
