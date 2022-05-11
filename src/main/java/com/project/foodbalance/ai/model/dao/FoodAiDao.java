package com.project.foodbalance.ai.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.ai.model.vo.FoodAi;

@Repository("foodai")
public class FoodAiDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public FoodAiDao() {}
	
	public int insertFoodAi(FoodAi foodai) {
		return session.insert("foodaiMapper.inserFoodAi", foodai);
	}
	
	public int selectFoodAiCount(FoodAi foodai) {
		return session.selectOne("foodaiMapper.selectFoodAiCount", foodai);
	}
}
