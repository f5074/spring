package f5074.spring.drawing.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import f5074.spring.common.domain.DrawingVO;
import f5074.spring.common.domain.EquipmentVO;
import f5074.spring.common.domain.IconVO;

@Mapper
public interface DrawingMapper {
	List<DrawingVO> selectDrawingList(DrawingVO vo);
	int insertDrawing(DrawingVO vo);
	
	List<IconVO> selectIconList(IconVO vo);
	int insertIcon(IconVO vo);
	
	List<EquipmentVO> selectEquipmentList(EquipmentVO vo);
	int insertEquipment(EquipmentVO vo);
	int updateEquipment(EquipmentVO vo);
}
