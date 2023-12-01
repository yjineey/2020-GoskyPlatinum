package kr.co.gugu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gugu.domain.BoardDTO;
import kr.co.gugu.page.PageMaker;
import kr.co.gugu.page.SearchPaging;
import kr.co.gugu.service.BoardService;
import kr.co.gugu.util.UploadFile;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;

	public void setting(ModelAndView mav, PageMaker pm, SearchPaging sp, boolean flag) {
		pm.setPaging(sp);
		if (flag)
			pm.getPaging().setPage(1);
		pm.setTotalCount(boardService.countSearch(sp));

		mav.addObject("bsort", sp.getBsort());
		mav.addObject("pageMaker", pm);
	}

	/*
	 * 게시판 페이지 이동
	 */
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute("searchPaging") SearchPaging searchPaging) {

		ModelAndView mav = new ModelAndView();
		PageMaker pm = new PageMaker();

		setting(mav, pm, searchPaging, false);
		mav.addObject("list", boardService.getSearchList(searchPaging));

		return mav;
	}

	/*
	 * 글 쓰기 / 수정 페이지 이동
	 */

	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public ModelAndView write(@ModelAttribute("searchPaging") SearchPaging searchPaging,
			@RequestParam Map<String, String> map) {

		logger.info("write page");

		ModelAndView mav = new ModelAndView();
		PageMaker pm = new PageMaker();

		setting(mav, pm, searchPaging, false);

		if (map.get("bno") != null) {
			map.put("role", "update");
			mav.addObject("board", boardService.viewDetailBoard(map));
		}

		return mav;
	}

	/*
	 * 글 쓰기 Action
	 */
	// TODO
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(@ModelAttribute("searchPaging") SearchPaging searchPaging, @ModelAttribute BoardDTO board,
			RedirectAttributes rttr, MultipartFile file) throws IOException, Exception {

		logger.info("write action");

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFile.calcPath(imgUploadPath);
		String fileName = null;

		if (!file.getOriginalFilename().equals("")) {
			fileName = UploadFile.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		board.setSupload(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
//		board.setUpload(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		boardService.addNewBoard(board);

		rttr.addAttribute("bsort", searchPaging.getBsort());
		rttr.addAttribute("page", searchPaging.getPage());
		rttr.addAttribute("perPageNum", searchPaging.getPerPageNum());
		rttr.addAttribute("searchType", searchPaging.getSearchType());
		rttr.addAttribute("keyword", searchPaging.getKeyword());

		return "redirect:/board/list";
	}

	/*
	 * 글 자세히 보기 페이지 이동
	 */
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public ModelAndView view(@ModelAttribute("searchPaging") SearchPaging searchPaging,
			@RequestParam Map<String, String> map) {

		ModelAndView mav = new ModelAndView();
		PageMaker pm = new PageMaker();

		setting(mav, pm, searchPaging, false);
		mav.addObject("board", boardService.viewDetailBoard(map));

		return mav;
	}

	/*
	 * 글 수정 Action
	 */
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("searchPaging") SearchPaging searchPaging, @ModelAttribute BoardDTO board,
			MultipartFile file, HttpServletRequest req, RedirectAttributes rttr) throws IOException, Exception {
		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("supload")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFile.calcPath(imgUploadPath);
			String fileName = UploadFile.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			board.setSupload(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			board.setSupload(req.getParameter("supload"));
		}
		boardService.updateBoard(board);

		rttr.addAttribute("bno", board.getBno());
		rttr.addAttribute("bsort", searchPaging.getBsort());
		rttr.addAttribute("page", searchPaging.getPage());
		rttr.addAttribute("perPageNum", searchPaging.getPerPageNum());
		rttr.addAttribute("searchType", searchPaging.getSearchType());
		rttr.addAttribute("keyword", searchPaging.getKeyword());

		return "redirect:/board/view";
	}

	/*
	 * 글 삭제 Action
	 */
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("searchPaging") SearchPaging searchPaging,
			@RequestParam Map<String, String> map) {

		ModelAndView mav = new ModelAndView();
		PageMaker pm = new PageMaker();

		boardService.deleteBoard(map);

		setting(mav, pm, searchPaging, true);

		mav.setViewName("redirect:/board/list");

		return mav;
	}

	/*
	 * 게시판 이름 가져오기
	 */
	@ResponseBody
	@RequestMapping(value = "/board/getName", method = RequestMethod.GET)
	public Map<String, String> getBoardName(@RequestParam Map<String, String> map) {
		map.put("bsname", boardService.getBoardName(map));
		return map;
	}

}
