package f5074.spring.drawing.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.EquipmentVO;
import f5074.spring.common.domain.IconVO;
import f5074.spring.drawing.mapper.DrawingMapper;

@Controller
public class DrawingController {
	private Logger logger = Logger.getLogger(DrawingController.class);
	
	@Value("${savePathDrawing}")
	private String propSavePath;
	@Value("${savePathIcon}")
	private String propSavePathIcon;
	@Value("${savePathUpload}")
	private String propSavePathUpload;
	@Value("${userId}")
	private String propUserId;
	
	@Autowired
	private DrawingMapper drawingMapper;
	
	@RequestMapping(value = { "selectDrawingList", "drawing/user/selectDrawingList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<DrawingVO> selectDrawingList(DrawingVO vo) {
		return drawingMapper.selectDrawingList(vo);
	}
	
	@RequestMapping(value = { "selectIconList", "drawing/user/selectIconList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<IconVO> selectIconList(IconVO vo) {
		return drawingMapper.selectIconList(vo);
	}
	
	@RequestMapping(value = { "selectEquipmentList", "drawing/user/selectEquipmentList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<EquipmentVO> selectEquipmentList(EquipmentVO vo) {
		return drawingMapper.selectEquipmentList(vo);
	}
	
	
	@RequestMapping(value = { "insertDrawing", "drawing/user/insertDrawing" }, method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public int insertDrawing(HttpServletRequest request, DrawingVO vo , @RequestParam(value = "uploadFile") MultipartFile uploadFile) throws IOException{
		String fileFullNm = uploadFile.getOriginalFilename();
		vo.setFileFullNm(fileFullNm);
		vo.setCrtId(propUserId);
		vo.setChgId(propUserId);		
		// 파일 경로에 파일 업로드
		String dir = request.getServletContext().getRealPath(propSavePath);
		fileUpload(dir, uploadFile);
		
		int res = drawingMapper.insertDrawing(vo);
		return res;
	}
	
	@RequestMapping(value = { "insertIcon", "drawing/user/insertIcon" }, method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public int insertIcon(HttpServletRequest request, IconVO vo , @RequestParam(value = "uploadFile") MultipartFile uploadFile) throws IOException{
		String iconFullNm = uploadFile.getOriginalFilename();
		vo.setIconFullNm(iconFullNm);
		vo.setCrtId(propUserId);
		vo.setChgId(propUserId);
		
		// 파일 경로에 파일 업로드
		String dir = request.getServletContext().getRealPath(propSavePathIcon);
		fileUpload(dir, uploadFile);

		int res = drawingMapper.insertIcon(vo);
		return res;
	}
	
	/**
	 * 파일업로드용 Method
	 * @param dir
	 * @param uploadFile
	 * @throws IOException
	 */
	private void fileUpload(String dir,MultipartFile uploadFile ) throws IOException {
		
		// 폴더가 없을경우 폴더 생성
		File file = new File(dir);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		// 파일 해당 경로에 업로드
		FileOutputStream fos = new FileOutputStream(dir + uploadFile.getOriginalFilename());
		InputStream is = uploadFile.getInputStream();
		try {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			throw new RuntimeException("[File Upload]" + ex.getMessage());
		} finally {
			fos.close();
		}
	}
	
	@RequestMapping(value = { "insertEquipment", "drawing/user/insertEquipment" }, method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public int insertEquipment(HttpServletRequest request, EquipmentVO vo) throws IOException{
		vo.setCrtId(propUserId);
		vo.setChgId(propUserId);
		int res = drawingMapper.insertEquipment(vo);
		return res;
	}
	
	@RequestMapping(value = { "uploadFile", "drawing/user/uploadFile" }, method = RequestMethod.POST)
	@ResponseBody
	public int uploadFile(MultipartHttpServletRequest mtfRequest) throws IOException{
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String fileDir =  mtfRequest.getServletContext().getRealPath(propSavePathUpload);
		
		for (MultipartFile mf : fileList) {			
			fileUpload(fileDir, mf);
		}
		return 1;
	}
	
	@RequestMapping(value = { "downloadFile", "drawing/user/downloadFile" }, method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String,String>> downloadFile( HttpServletRequest request
							, HttpServletResponse response) throws IOException {
		List<HashMap<String, String>> resultList = new ArrayList<HashMap<String,String>>();
		
		String fileNm = request.getParameter("fileNm");
		String fileDir = "/spring/upload/downloads/";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("fileNm", fileNm);
		map.put("fullDir", fileDir + fileNm);
		resultList.add(map);
		
//		String FullDir = fileDir + fileNm;
//		System.out.println(FullDir);	
//		String contentType = "image/png";
//		long fileLength = 0;
//		FileInputStream fis = new FileInputStream(FullDir);
//		fileLength =  fis.getChannel().size();
//		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNm + "\";");
//		response.setHeader("Content-Transfer-Encoding", "binary");
//		response.setHeader("Content-Type", contentType);
//		response.setHeader("Content-Length", "" + fileLength);
//		response.setHeader("Pragma", "no-cache;");
//		response.setHeader("Expires", "-1;");
//		OutputStream out = response.getOutputStream();
//		try {
//			int readCount = 0;
//			byte[] buffer = new byte[1024];
//			while ((readCount = fis.read(buffer)) != -1) {
//				out.write(buffer, 0, readCount);
//			}
//		} catch (Exception ex) {
//			throw new RuntimeException("[File Download]" + ex.getMessage());
//		} finally {
//			out.close();
//		}
		System.out.println(resultList.size());
		return resultList;
	}
	
	@RequestMapping(value = { "beforeDownloadFiles", "drawing/user/beforeDownloadFiles" }, method = RequestMethod.POST)
	@ResponseBody
	public void beforeDownloadFiles( HttpServletRequest request
							, HttpServletResponse response
							, @RequestParam("fileNm") String fileNm) throws IOException {
//		String fileNm = request.getParameter("fileNm");
		String fileDir = "C:\\DEV\\Downloads\\";
		String FullDir = fileDir + fileNm;
		System.out.println(FullDir);	
		String contentType = "image/png";
		long fileLength = 0;
		FileInputStream fis = new FileInputStream(FullDir);
		fileLength =  fis.getChannel().size();
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNm + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		OutputStream out = response.getOutputStream();
		try {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			throw new RuntimeException("[File Download]" + ex.getMessage());
		} finally {
			out.close();
		}
	}
	
	
	@RequestMapping(value = { "downloadFiles", "drawing/user/downloadFiles" }, method = RequestMethod.GET)
	@ResponseBody
	public void downloadFiles( HttpServletRequest request
							, HttpServletResponse response
							, @RequestParam("fileNm") String fileNm) throws IOException {
		System.out.println("Test2");
		String fileDir = "C:\\DEV\\Downloads\\";
		
		if(fileDir.substring(fileDir.length()-1, fileDir.length()) == "/" || fileDir.substring(fileDir.length()-1, fileDir.length()) == "\\") {
			
		}else {
			fileDir += "\\";
		}
		
		String FullDir = fileDir + fileNm;
		System.out.println(FullDir);	
		String contentType = "image/png";
		long fileLength = 0;
		FileInputStream fis = new FileInputStream(FullDir);
		fileLength =  fis.getChannel().size();
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNm + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileLength);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		OutputStream out = response.getOutputStream();
		try {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			throw new RuntimeException("[File Download]" + ex.getMessage());
		} finally {
			out.close();
		}
	}
	
	
	@RequestMapping(value = { "updateEquipment", "drawing/user/updateEquipment" }, method = RequestMethod.POST )
	@ResponseBody
	public int updateEquipment(EquipmentVO vo) throws IOException{
		vo.setChgId(propUserId);
		int res = drawingMapper.updateEquipment(vo);
		return res;
	}
	
}