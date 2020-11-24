package f5074.spring.drawing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.EquipmentVO;
import f5074.spring.common.domain.IconVO;
import f5074.spring.drawing.dao.DrawingDao;

@Service
public class DrawingServiceImpl implements DrawingService{
	@Autowired private DrawingDao drawingDao;

	@Transactional
	@Override
	public List<DrawingVO> selectDrawingList(DrawingVO vo) {
		return drawingDao.selectDrawingList(vo);
	}

	@Transactional
	@Override
	public int insertDrawing(DrawingVO vo) {
		return drawingDao.insertDrawing(vo);
	}
	
	@Override
	public List<IconVO> selectIconList(IconVO vo) {
		return drawingDao.selectIconList(vo);
	}
	
	@Override
	public int insertIcon(IconVO vo) {
		return drawingDao.insertIcon(vo);
	}
	
	@Transactional
	@Override
	public List<EquipmentVO> selectEquipmentList(EquipmentVO vo) {
		return drawingDao.selectEquipmentList(vo);
	}

	@Transactional
	@Override
	public int insertEquipment(EquipmentVO vo) {
		return drawingDao.insertEquipment(vo);
	}
}
