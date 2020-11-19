package f5074.spring.drawing.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.drawing.dao.mapper.DrawingMapper;

@Repository
public class DrawingDaoImpl implements DrawingDao{
	@Autowired private DrawingMapper drawingMapper;
	
	@Override
	public List<DrawingVO> selectDrawingList(int type) {
		return drawingMapper.selectDrawingList(type);
	}
	
	@Override
	public int insertDrawing(DrawingVO vo) {
		return drawingMapper.insertDrawing(vo);
	}

}
