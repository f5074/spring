package f5074.spring.drawing.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.EquipmentVO;
import f5074.spring.common.domain.IconVO;
import f5074.spring.drawing.dao.mapper.DrawingMapper;

@Repository
public class DrawingDaoImpl implements DrawingDao{
	@Autowired private DrawingMapper drawingMapper;
	
	@Override
	public List<DrawingVO> selectDrawingList(DrawingVO vo) {
		return drawingMapper.selectDrawingList(vo);
	}
	
	@Override
	public int insertDrawing(DrawingVO vo) {
		return drawingMapper.insertDrawing(vo);
	}
	
	@Override
	public List<IconVO> selectIconList(IconVO vo) {
		return drawingMapper.selectIconList(vo);
	}
	
	@Override
	public int insertIcon(IconVO vo) {
		return drawingMapper.insertIcon(vo);
	}
	
	@Override
	public List<EquipmentVO> selectEquipmentList(EquipmentVO vo) {
		return drawingMapper.selectEquipmentList(vo);
	}

	@Override
	public int insertEquipment(EquipmentVO vo) {
		return drawingMapper.insertEquipment(vo);
	}

}
