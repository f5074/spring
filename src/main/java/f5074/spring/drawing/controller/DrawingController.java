package f5074.spring.drawing.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.SampleVO;
import f5074.spring.drawing.service.DrawingService;

@Controller
public class DrawingController {
	@Value("${savePathDrawing}")
	private String propSavePath;
	@Value("${userId}")
	private String propUserId;
	
	@Autowired
	private DrawingService drawingService;
	
	@RequestMapping(value = { "selectDrawingList", "user/drawing/selectDrawingList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<DrawingVO> selectDrawingList(int type) {
		return drawingService.selectDrawingList(type);
	}
	
	
	@RequestMapping(value = { "insertDrawing", "user/drawing/insertDrawing" }, method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public int insertDrawing(HttpServletRequest request, DrawingVO vo , @RequestParam(value = "uploadFile") MultipartFile uploadFile) throws IOException{
		
		String fileFullNm = uploadFile.getOriginalFilename();
		vo.setFileFullNm(fileFullNm);
		vo.setCrtId(propUserId);
		vo.setChgId(propUserId);
		long fileSize = uploadFile.getSize();
		String fileNm = vo.getFileNm();
		String fileContent = vo.getFileContent();
		
		String dir = request.getServletContext().getRealPath(propSavePath);
		
		// 폴더가 없을경우 폴더 생성
		File file = new File(dir);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		FileOutputStream fos = new FileOutputStream(dir + uploadFile.getOriginalFilename());
		InputStream is = uploadFile.getInputStream();
		try {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}
			fos.close();
		} catch (Exception ex) {
			fos.close();
			throw new RuntimeException("File Save Error");
		}
		
		int res = drawingService.insertDrawing(vo);
		return res;
	}
	
	
	@RequestMapping(value = { "user/drawing/sendList" }, method = RequestMethod.GET)
	@ResponseBody
	public List<SampleVO> sendList() { // List<SampleVO> 형태의 리스트를 반환하는 method sendList

		List<SampleVO> list = new ArrayList<SampleVO>(); // List 생성
		for (int i = 0; i < 20; i++) { // 예로 10개의 SampleVO를 담는다.
			SampleVO vo = new SampleVO(); // SampleVO를 생성
			vo.setAthlete("Test"); // 데이터를 담는다.
			vo.setAge(i);
			vo.setCountry("Test");
			vo.setYear(2012);
			vo.setSport("Test");
			vo.setGold(0);
			vo.setSilver(0);
			vo.setBronze(0);
			vo.setTotal(2);
			list.add(vo); // list에 객체를 추가한다.
		}
		return list; // List 객체를 반환
	}

	@SuppressWarnings("resource")
	@RequestMapping(value = { "user/drawing/upload" }, method = RequestMethod.GET)
	public String upload(@RequestParam("file") MultipartFile file) throws IOException {
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 크기 : " + file.getSize());
		FileOutputStream fos = new FileOutputStream("c:\\DEV/tmp\\" + file.getOriginalFilename());
		InputStream is = file.getInputStream();
		try {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			fos.close();
			throw new RuntimeException("file Save Error");
		}
		return "user/drawing/drawingDesign";
	}
	
	@RequestMapping(value = { "downloadDrawingFile", "user/drawing/downloadDrawingFile" }, method = RequestMethod.POST)
	@ResponseBody
	public void downloadDrawingFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("type") String fileName) throws IOException {
		String dir = request.getServletContext().getRealPath(propSavePath);
		
		System.out.println(fileName);
		String saveFileName = dir + fileName;
		System.out.println(saveFileName);	
		String contentType = "image/png";
		long fileLength = 0;
		FileInputStream fis = new FileInputStream(saveFileName);
		fileLength =  fis.getChannel().size();
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		OutputStream out = response.getOutputStream();
		try  
		{
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
			}
			out.close();
		} catch (Exception ex) {
			out.close();
			throw new RuntimeException("file Save Error");
		}
	}
}