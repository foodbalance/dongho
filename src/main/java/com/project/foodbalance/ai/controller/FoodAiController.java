package com.project.foodbalance.ai.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.foodbalance.ai.ai.PythonAi;
import com.project.foodbalance.ai.model.service.FoodAiService;
import com.project.foodbalance.ai.model.vo.FoodAi;

@Controller
public class FoodAiController {
	private static final Logger logger = LoggerFactory.getLogger(FoodAiController.class);
	
	private FoodAi resultFoodAi = new FoodAi();
	
	@Autowired
	private FoodAiService foodaiService;
	
	@RequestMapping("foodai.do")
	public String moveAiPage(Model model) {
		model.addAttribute("imgfile", resultFoodAi.getFood_rename_img());
		return "foodai/foodai";
	}
	
	@RequestMapping(value = "foodImgfileUpload.do", method = RequestMethod.POST)
	public String FoodAiImgInsertMethod(HttpServletRequest request, FoodAi foodai, Model model,
			@RequestParam(name="fupfile", required=false) MultipartFile mfile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/ai_food_img");
		//System.out.println("img upload path : " + savePath);
		//System.out.println("mfile : "+ mfile);
		//첨부파일 있을때만 업로드된 파일을 지정 폴더로 옮기기
		if(!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			//System.out.println("check1 : " + fileName);
			//renaming
			if(fileName != null && fileName.length() > 0) {
				//변경할 파일명 문자열 만들기
				//등록 요청 시점의 날짜정보를 이용
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				//변경할 파일이름 만들기
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "_" + foodai.getUser_id();
				//원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				
				//파일객체 만들기
				File originFile = new File(savePath + "\\" + fileName);
				File renameFile = new File(savePath + "\\" + renameFileName);
				
				System.out.println("check rename : " + renameFileName);
				//upload file save and renaming
				try {
					mfile.transferTo(renameFile);
					
				}catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "Image save failed");
					return "common/commonview";
				}
				
				foodai.setFood_original_img(fileName);
				foodai.setFood_rename_img(renameFileName);
				
				//값 입력
				resultFoodAi.setFood_original_img(fileName.trim());
				resultFoodAi.setFood_rename_img(renameFileName.trim());
				
				model.addAttribute("imgfile", resultFoodAi.getFood_rename_img());
				System.out.println("파일명 : " +resultFoodAi.getFood_rename_img());
				}	
		}
		return "foodai/foodaiupdate";
	}
	
	
	@RequestMapping(value="foodaiInsert.do", method = RequestMethod.POST)
	public String FoodAiInsertMethod(@RequestParam("user_id") String user_id, HttpServletRequest request, Model model) {
		System.out.println("save file check : " + resultFoodAi.getFood_original_img());
		String savePath = request.getSession().getServletContext().getRealPath("resources/ai_food_img/");
		try {
			if(user_id.equals("")) {
				model.addAttribute("message", "로그인 필요 페이지");
				return "common/commonview";
			}else if(resultFoodAi.getFood_rename_img() == null){
				System.out.println("출력 확인");
				model.addAttribute("message", "사진을 등록하세요");
				return "foodai/foodai";
			}else {
//				FoodAi foodai = new FoodAi();
				
//				//파일명 등록
//				foodai.setFood_original_img(resultFoodAi.getFood_original_img());
//				foodai.setFood_rename_img(resultFoodAi.getFood_rename_img());
			
				//ai측정 등록
				PythonAi ai = new PythonAi();
				String food_id = ai.AiValue(savePath, resultFoodAi.getFood_rename_img());
				System.out.println("food id : " + food_id);
				FoodAi food_info = foodaiService.selectFoodAi(food_id);
				System.out.println(food_info.getFood_name());
				
				model.addAttribute("food_img", resultFoodAi.getFood_rename_img());
				model.addAttribute("food_name", food_info.getFood_name());
				model.addAttribute("weight", food_info.getWeight());
				model.addAttribute("kcal", food_info.getKcal());
				model.addAttribute("carbo", food_info.getCarbo());
				model.addAttribute("sugars", food_info.getSugars());
				model.addAttribute("fat", food_info.getFat());
				model.addAttribute("protein", food_info.getProtein());
				return "foodai/foodresult";
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "잘못 입력하셨습니다.");
			return "common/commonview";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
	
	
}
