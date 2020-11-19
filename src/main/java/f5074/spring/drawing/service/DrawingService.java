package f5074.spring.drawing.service;

import java.util.List;

import f5074.spring.common.domain.DrawingVO;

public interface DrawingService {
	List<DrawingVO> selectDrawingList(int type);
	int insertDrawing(DrawingVO vo);
}
