package f5074.spring.drawing.dao.mapper;

import java.util.List;

import f5074.spring.common.domain.DrawingVO;

public interface DrawingMapper {
	List<DrawingVO> selectDrawingList(DrawingVO vo);
	DrawingVO selectDrawingOne(DrawingVO vo);
	int insertDrawing(DrawingVO vo);
}
