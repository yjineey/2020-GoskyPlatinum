package kr.co.gugu.test;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.gugu.dao.BoardDAO;
import kr.co.gugu.domain.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardCreate {

	@Inject
	private BoardDAO boardDAO;

	@Test
	public void testInsert() throws Exception {
		
		BoardDTO boardDTO;
		
		for(int i=1; i<=200; i++) {
			boardDTO = new BoardDTO();
			
			boardDTO.setBsort("b04");
			boardDTO.setBtitle("또 다른 게시판 테스트 " + i);
			boardDTO.setBcontent("또 다른 게시판 테스트" + i);
			boardDTO.setMid("1407120115");
			
			boardDAO.insertBoard(boardDTO);
			Thread.sleep(500);
		}
		
	}

}






