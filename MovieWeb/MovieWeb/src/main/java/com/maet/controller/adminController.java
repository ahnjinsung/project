package com.maet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.maet.command.MovieAdminVO;
import com.maet.command.MoviePreVO;
import com.maet.command.MovieVO;
import com.maet.movie.service.MovieService;
import com.maet.moviepre.service.MoviePreService;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Autowired
	@Qualifier("movieService")
	private MovieService ms;
	
	@Autowired
	@Qualifier("moviePreService")
	private MoviePreService mps;
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/adminMovieList")			//영화 리스트
	public String adminMovieList(Model model) {
		ArrayList<MovieVO> vo = ms.movieList();
		model.addAttribute("vo", vo);
		return "admin/adminMovieList";
	}
	
	@RequestMapping("/adminLoginPage")
	public String adminLoginPage() {
		return "admin/adminLoginPage";
	}
	
	@RequestMapping("/adminLogin")
	public String adminLogin(MovieAdminVO vo) {
		int res = ms.adminLogin(vo);
		if(res==1) {
			return "admin/adminMain";
		}else {
			return "admin/adminLoginPage";
		}
	}
	
	@RequestMapping("/adminMoviePre")			//영화예약리스트
	public String adminMoviePre(Model model) {
		ArrayList<MoviePreVO> vo = mps.preList();
		model.addAttribute("vo",vo);
		return "admin/adminMoviePre";
	}
	
	@RequestMapping("/movieInsert")				//영화추가
	@ResponseBody
	public String movieInsert(@RequestParam("file") MultipartFile file,
			@RequestParam("movName") String movName,
			@RequestParam("movContent") String movContent,
			@RequestParam("movStartDate") String movStartDate,
			@RequestParam("movEndDate") String movEndDate) {
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replace("-", "");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String uploadDay = sdf.format(date); //업로드폴더를 생성할 날짜
		
		File folder = new File("D:\\seungsoo_spring\\spring_work\\MovieWeb\\src\\main\\webapp\\resources\\img" + uploadDay);
		if(!folder.exists() ) {
			folder.mkdir(); //폴더생성
		}
		
		try {
			String fileRealName = file.getOriginalFilename(); // 파일 정보
			MovieVO vo = new MovieVO();
			String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 파일// 확장자
			 String fileLoca = uploadDay;
	         String uploadPath = "D:\\seungsoo_spring\\spring_work\\MovieWeb\\src\\main\\webapp\\resources\\img"+uploadDay;
	         String fileName = uuids+"."+fileExtention;
	         File saveFile = new File("D:\\seungsoo_spring\\spring_work\\MovieWeb\\src\\main\\webapp\\resources\\img"+uploadDay+"\\"+ fileName);
	         vo.setMovName(movName);
	         vo.setMovContent(movContent);
	         vo.setMovEndDate(movEndDate);
	         vo.setMovStartDate(movStartDate);
	         vo.setMovFileLoca(fileLoca);
	         vo.setMovFileName(fileName);
	         vo.setMovUploadPath(uploadPath);
	         vo.setMovFileRealName(fileRealName);
	         vo.setMovMoney("11000");
	         if(ms.movieInsert(vo)) {
	        	 file.transferTo(saveFile);
	         }
	         
		}catch (Exception e) {e.printStackTrace();}
		return null;
	}
	
	
	@RequestMapping("/view")				//영화리스트 img src에들어가는 뷰
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
	
	@RequestMapping("/movieDetail/{movNo}")		//영화상세보기
	@ResponseBody
	public MovieVO movieDetail(@PathVariable("movNo") int movNo) {
		return ms.movieDetail(movNo);
	}
	
	@RequestMapping("/movieDelete")				//영화삭제
	@ResponseBody
	public int movieDelete(@RequestBody MovieVO vo) {
		return ms.movieDelete(vo);
	}
	
}
