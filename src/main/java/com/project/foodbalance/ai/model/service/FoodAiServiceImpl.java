package com.project.foodbalance.ai.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.foodbalance.ai.model.dao.FoodAiDao;
import com.project.foodbalance.ai.model.vo.FoodAi;

@Service("foodaiService")
public class FoodAiServiceImpl implements FoodAiService{
	
	@Autowired	
	private FoodAiDao foodaiDao;
	
	@Override
	public int insertFoodAi(FoodAi foodai) {
		return foodaiDao.insertFoodAi(foodai);
	}
	@Override
	public int selectFoodAiCount(FoodAi foodai) {
		return foodaiDao.selectFoodAiCount(foodai);
	}

}
