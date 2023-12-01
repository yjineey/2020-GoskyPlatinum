package kr.co.gugu.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gugu.service.ReplyService;
import kr.co.gugu.domain.ReplyDTO;

@Controller
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@RequestMapping(value = "/reply/getList", method = RequestMethod.POST)
	public List<ReplyDTO> getReplyList(@RequestParam Map<String, String> map) {
		return replyService.getReplyList(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/insert", method = RequestMethod.POST)
	public int insertReply(@ModelAttribute ReplyDTO reply) {
		return replyService.insertReply(reply);
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/update", method = RequestMethod.POST)
	public int updateReply(@ModelAttribute ReplyDTO reply) {
		return replyService.updateReply(reply);
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/delete", method = RequestMethod.POST)
	public int deleteReply(@RequestParam Map<String, String> map) {
		return replyService.deleteReply(map);
	}
	
}
