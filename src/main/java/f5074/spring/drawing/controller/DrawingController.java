package f5074.spring.drawing.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import f5074.spring.common.controller.CommonController;
import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.EquipmentVO;
import f5074.spring.common.domain.IconVO;
import f5074.spring.drawing.service.DrawingService;

@Controller
public class DrawingController {
	private Logger logger = Logger.getLogger(DrawingController.class);
	
	@Value("${savePathDrawing}")
	private String propSavePath;
	@Value("${savePathIcon}")
	private String propSavePathIcon;
	@Value("${userId}")
	private String propUserId;
	
	@Autowired
	private DrawingService drawingService;
	
	@RequestMapping(value = { "selectDrawingList", "drawing/user/selectDrawingList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<DrawingVO> selectDrawingList(DrawingVO vo) {
		return drawingService.selectDrawingList(vo);
	}
	
	@RequestMapping(value = { "selectIconList", "drawing/user/selectIconList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<IconVO> selectIconList(IconVO vo) {
		return drawingService.selectIconList(vo);
	}
	
	@RequestMapping(value = { "selectEquipmentList", "drawing/user/selectEquipmentList" }, method = RequestMethod.POST)
	@ResponseBody
	public List<EquipmentVO> selectEquipmentList(EquipmentVO vo) {
		return drawingService.selectEquipmentList(vo);
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
		
		int res = drawingService.insertDrawing(vo);
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

		int res = drawingService.insertIcon(vo);
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
			fos.close();
		} catch (Exception ex) {
			fos.close();
			throw new RuntimeException("File Save Error");
		}
	}
	
	@RequestMapping(value = { "insertEquipment", "drawing/user/insertEquipment" }, method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public int insertEquipment(HttpServletRequest request, EquipmentVO vo) throws IOException{
		vo.setCrtId(propUserId);
		vo.setChgId(propUserId);
		int res = drawingService.insertEquipment(vo);
		return res;
	}
	
	@RequestMapping(value = { "updateEquipment", "drawing/user/updateEquipment" }, method = RequestMethod.POST )
	@ResponseBody
	public int updateEquipment(EquipmentVO vo) throws IOException{
		vo.setChgId(propUserId);
		int res = drawingService.updateEquipment(vo);
		return res;
	}
	
}