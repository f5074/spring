package f5074.spring.drawing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.drawing.dao.DrawingDao;

@Service
public class DrawingServiceImpl implements DrawingService{
	@Autowired private DrawingDao drawingDao;

	@Transactional
	@Override
	public List<DrawingVO> selectDrawingList(int type) {
		return drawingDao.selectDrawingList(type);
	}

	@Transactional
	@Override
	public int insertDrawing(DrawingVO vo) {
		return drawingDao.insertDrawing(vo);
	}
}
