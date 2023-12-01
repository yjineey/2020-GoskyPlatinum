package kr.co.gugu.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gugu.domain.WorkListDTO;
import kr.co.gugu.domain.InterviewDTO;
import kr.co.gugu.domain.Paging;
import kr.co.gugu.domain.SearchPaging;

@Repository
public class WorkListDAOImpl implements WorkListDAO {

	@Inject
	SqlSession sqlSession;

	private String namespace = "mappers.WorkListMapper";

	// 강사업무리스트 + 검색처리
	@Override
	public WorkListDTO WorkList(int msno) throws Exception {
		return sqlSession.selectOne(namespace + ".WorkList", msno);
	}

	// 강사 업무 상세보기
	@Override
	public InterviewDTO WorkListDetail(int msno) throws Exception {
		return sqlSession.selectOne(namespace + ".WorkListDetail", msno);
	}

	// 관리자업무리스트 + 검색처리
	@Override
	public List<WorkListDTO> MworkList() throws Exception {
		return sqlSession.selectList(namespace + ".MworkList");
	}
	
	// 관리자 업무 상세보기
	@Override
	public InterviewDTO MworkListDetail(int msno) throws Exception {
		return sqlSession.selectOne(namespace + ".WorkListDetail", msno);
	}
	
	// 관리자 업무 진행현황
	@Override
	public int WorkListStatus(Map<String, String> map) throws Exception {
		return sqlSession.update(namespace + ".WorkListStatus", map);
	}

	// 관리자 업무 진행현황
	@Override
	public int WorkListWrite(InterviewDTO dto) throws Exception {
		
		int r =sqlSession.insert(namespace + ".MessageWrite", dto);
		if (r>0) {
			int msno = sqlSession.selectOne(namespace + ".SelectMsno", dto.getContent());
			if (msno>0) {
				dto.setMsno(msno);
				return sqlSession.insert(namespace + ".WorkListWrite", dto);
			}
		}
		return -1;
	}

	//페이징처리
	@Override
	public List<WorkListDTO> Paging(Paging paging) throws Exception {
		return sqlSession.selectList(namespace + ".Paging", paging);
	}

	//페이징처리 _전체게시글 갯수 구하기
	@Override
	public int CountPaging(Paging paging) throws Exception {
		return sqlSession.selectOne(namespace + ".CountPaging", paging);
	}
	
	//검색목록
	@Override
	public List<WorkListDTO> Search(SearchPaging searchPaging) throws Exception {
		if (searchPaging.getFromid() != null) {
			return sqlSession.selectList(namespace + ".FromSearch", searchPaging);
		} else {
			return sqlSession.selectList(namespace + ".Search", searchPaging);
		}
	}
	
	//검색된 게시글 갯수구하기
	@Override
	public int CountSearch(SearchPaging searchPaging) throws Exception {
		if (searchPaging.getFromid() != null) {
		return sqlSession.selectOne(namespace + ".FromSearchPaging", searchPaging);
		}else {
			return sqlSession.selectOne(namespace + ".SearchPaging", searchPaging);
		}	}

	@Override
	public int readchk(int msno) throws Exception {
		return sqlSession.update(namespace + ".readchk", msno);
	}

}
