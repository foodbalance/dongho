package com.project.foodbalance.ai.model.service;

import com.project.foodbalance.ai.model.vo.FoodAi;

public interface FoodAiService {
	int insertFoodAi(FoodAi foodai);
	int selectFoodAiCount(FoodAi foodai);
	FoodAi selectFoodAi(String foodid);

}
