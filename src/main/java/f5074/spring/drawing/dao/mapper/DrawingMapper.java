package f5074.spring.drawing.dao.mapper;

import java.util.List;

import f5074.spring.common.domain.DrawingVO;

public interface DrawingMapper {
	List<DrawingVO> selectDrawingList(int type);
	int insertDrawing(DrawingVO vo);
}
