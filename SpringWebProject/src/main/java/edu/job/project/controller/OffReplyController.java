package edu.job.project.controller;

import java.util.List;

import javax.xml.ws.http.HTTPException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.job.project.domain.Message;
import edu.job.project.domain.OffReply;
import edu.job.project.service.OffReplyService;
import edu.job.project.util.PageLinkMaker;
import edu.job.project.util.PaginationCriteria;

@Controller
public class OffReplyController {

	@Autowired OffReplyService replyService;

	
	@RequestMapping(value ="/offDetail2", method=RequestMethod.GET)
	public ResponseEntity<List<OffReply>> readRepliesByBno(int bno, Model model, int start, int end){
		
		System.out.println("readRepliesByBno()로 들어옴 bno =" + bno);		
//		List<OffReply> list = replyService.read(bno);
//		ResponseEntity<List<OffReply>> entity = new ResponseEntity<List<OffReply>>(list, HttpStatus.OK); 
				
		PaginationCriteria criteria = new PaginationCriteria();
		criteria.setStart(start);
		criteria.setEnd(end);
		List<OffReply> list = replyService.read(bno,criteria);
		int result = replyService.getNumOfRecords(bno);
		
		System.out.println("result (total count) = " + result);
		System.out.println("criteria.getNumsPerPage() : "+ criteria.getNumsPerPage());
		
		int nums =(int) Math.ceil( (double)result / criteria.getNumsPerPage());
		System.out.println("nums : bno갯수를 perpage 로 나눈 값 총 페이지 갯수 : " + nums);
		
		if(nums > criteria.getNumsPerPage()) {
			int page = criteria.getPage();
			page ++;
			System.out.println("page : " +page);
		}
		
//		model.addAttribute("bno", bno);
//		model.addAttribute("replyList", list);
		ResponseEntity<List<OffReply>> entity = new ResponseEntity<List<OffReply>>(list,HttpStatus.OK);
		
		return entity;
	} // readRepliesByBno
	

	@RequestMapping(value="/create2" , method=RequestMethod.POST)
	public ResponseEntity<Integer> createOffReply(@RequestBody OffReply OffReply){
		System.out.println("create 들어왔음?!");
		int result = replyService.create(OffReply);
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		System.out.println("entity로 저장되었음!??!");
		return entity; 
	} // createOffReply()
	

	@RequestMapping(value="/update2" , method= RequestMethod.PUT)
	public ResponseEntity<Integer> updateOffReply(@RequestBody OffReply OffReply){
		System.out.println(OffReply.getContent());
		System.out.println("update() 로 들어와라!! ");	
		System.out.println("rno=" + OffReply.getRno());
		int result = replyService.update(OffReply);
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		
		return entity;	
	}// updateOffReply()
	
	@RequestMapping(value="/delete2", method =RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<Integer> deleteOffReply(@RequestBody OffReply reply){
		
		System.out.println("delete 로 들어와라 !! ");
		System.out.println(reply.getRno());
		int result = replyService.delete(reply.getRno());
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);

		System.out.println("delete() 메소드가 불렸는데,, ");
		return entity;
	} // deleteOffReply
	
	
	
/*	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String replyList(Integer page, Integer numsPerPage, Model model) {
		
		PaginationCriteria criteria = new PaginationCriteria();
		if(page != null) {
			criteria.setPage(page);
		}
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		List<OffReply> list = replyService.read(criteria);
		model.addAttribute("replyList", list);
//		ResponseEntity<List<OffReply>> entity = new ResponseEntity<List<OffReply>>(list,HttpStatus.OK);
		
		PageLinkMaker pagemaker = new PageLinkMaker();
		pagemaker.setCriteria(criteria);
		pagemaker.setTotalCount(replyService.getNumOfRecords());
		pagemaker.setPageLinkData();
		model.addAttribute("pageMaker", pagemaker);
//		ResponseEntity<PageLinkMaker> entity = new ResponseEntity<PageLinkMaker>(pagemaker, HttpStatus.OK);
		
		
		
		return "mypage";
	} // replyList()
	
	*/
	
	
	
} // OffReplyController{}
