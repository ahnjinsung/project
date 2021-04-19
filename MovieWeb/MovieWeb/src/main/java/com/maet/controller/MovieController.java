package com.maet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maet.command.MoviePreVO;
import com.maet.command.MovieRepVO;
import com.maet.command.MovieVO;
import com.maet.movie.service.MovieService;
import com.maet.moviepre.service.MoviePreService;
import com.maet.movierep.service.MovieRepService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	
	@Autowired
	@Qualifier("moviePreService")
	private MoviePreService mps;
	
	@Autowired
	@Qualifier("movieService")
	private MovieService ms;
	
	@Autowired 
	@Qualifier("movieRepService")
	private MovieRepService mrs;
	
	
	@RequestMapping("/moviePreDelete")
	public String moviePreDelete(@RequestParam("rsvNo") int rsvNo,Model model) {
		mps.moviePreDelete(rsvNo);
		return "redirect:/";
	}
	
	
	@RequestMapping("/movieList")				//영화보기 ,상영종료된건 빼고보여주기
	public String movieList(Model model) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		String strDate = sdf.format(date);
		strDate = strDate.replaceAll("/", "");
		int intDate = Integer.parseInt(strDate);
		ArrayList<MovieVO> vo = ms.movieList();
		ArrayList<Integer> check = new ArrayList<>();
		for(int i=0; i<vo.size(); i++) {
			String strEnd = vo.get(i).getMovEndDate();
			strEnd = strEnd.replaceAll("/", "");
			int intEnd = Integer.parseInt(strEnd);
			if(intEnd < intDate) {
				check.add(i);
			}
		}
		int icheck = check.size();
		for(int i=icheck; i>0; i--) {
			int num = check.get(i-1);
			vo.remove(num);
		}
		model.addAttribute("vo", vo);
		return "movie/movieList";
	}
	
	@RequestMapping("/view")			//영화사진 보여주는거 img src=에들어가는뷰
	@ResponseBody
	public byte[] view(@RequestParam("fileLoca") String fileLoca,
			@RequestParam("fileName") String fileName) {
		File file = new File("D:\\seungsoo_spring\\spring_work\\MovieWeb\\src\\main\\webapp\\resources\\img"+fileLoca+"\\"+fileName);
		byte[] result = null;
		
		try {
			result = FileCopyUtils.copyToByteArray(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	} 
	
	@RequestMapping(value="/moviePre", method=RequestMethod.GET)		//영화예약으로가기
	public String moviePre(@RequestParam("movNo")int movNo, Model model) {
		MovieVO vo = ms.movieOneList(movNo);
		model.addAttribute("vo", vo);
		return "movie/moviePre";
	}
	
	
	@RequestMapping(value="/moviePreInsert", method=RequestMethod.POST)	//영화예약추가
	public String moviePreInsert(MoviePreVO vo,RedirectAttributes ra
			,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		int peo = vo.getMrPeo();
		vo.setRsvPay(String.valueOf(peo*11000));
		vo.setUserId(userId);
		int res = mps.moviePreInsert(vo);
		if(res==1) {
			ra.addFlashAttribute("msg","예약이완료됨");
			return "redirect:/movie/movieList";
		}else {
			ra.addFlashAttribute("msg","예약이실패됨");
			return "redirect:/movie/movieList";
		}
	}
	
	@RequestMapping("/movieSitList/{movName}/{mrTime}/{mrDate}/{mrPlace}")	//영화자리 예매한곳 체크
	@ResponseBody
	public ArrayList<String> movieSitList(@PathVariable("movName") String movName,
			@PathVariable("mrTime") String mrTime,
			@PathVariable("mrDate") String mrDate,
			@PathVariable("mrPlace") String mrPlace
		) {
		MoviePreVO vo = new MoviePreVO();
		
		vo.setMovName(movName);
		vo.setMrDate(mrDate);
		vo.setMrPlace(mrPlace);
		vo.setMrTime(mrTime);
		ArrayList<MoviePreVO> vo1 = mps.getList(vo);
		ArrayList<String> sit = new ArrayList<String>();
		for(int i=0; i<vo1.size(); i++) {
			String res = vo1.get(i).getMrSit();
			String[] res1 = res.split(",");
			for(int j=0; j<res1.length; j++) {
				sit.add(res1[j]);
			}
		}
		System.out.println(sit.toString());
		return sit;
	}
	
	
	
	
	
	
	@RequestMapping("/movieDetail/{movNo}")		//해당영화 상세보기
	@ResponseBody
	public MovieVO movieDetail(@PathVariable("movNo") int movNo) {
		return ms.movieDetail(movNo);
	}
	
	
	
	@RequestMapping("/movieRepInsert")		//영화댓글추가(후기)
	@ResponseBody
	public int movieRepInsert(@RequestBody MovieRepVO vo) {
		mrs.movieRepInsert(vo);
		return 1;
	}
	
	@RequestMapping("/movieRepDelete")		//영화댓글삭제
	@ResponseBody
	public int movieRepDelete(@RequestBody MovieRepVO vo) {
		mrs.movieRepDelete(vo);
		return 1;
	}
	
	@RequestMapping("/movieRepUpdate")		//영화댓글수정
	@ResponseBody
	public int movieRepUpdate(@RequestBody MovieRepVO vo) {
		return mrs.movieRepUpdate(vo);
	}
}
