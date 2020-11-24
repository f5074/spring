package f5074.spring.drawing.dao.mapper;

import java.util.List;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.EquipmentVO;
import f5074.spring.common.domain.IconVO;

public interface DrawingMapper {
	List<DrawingVO> selectDrawingList(DrawingVO vo);
	int insertDrawing(DrawingVO vo);
	
	List<IconVO> selectIconList(IconVO vo);
	int insertIcon(IconVO vo);
	
	List<EquipmentVO> selectEquipmentList(EquipmentVO vo);
	int insertEquipment(EquipmentVO vo);
}
