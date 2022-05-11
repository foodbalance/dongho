package com.project.foodbalance.ai.model.vo;

public class FoodAi implements java.io.Serializable{

	private static final long serialVersionUID = -3941224764874675796L;
	
	
	private String food_name;
	private String user_id;
	private String food_id;
	private int weight;
	private int kcal;
	private int carbo;
	private int sugars;
	private int fat;
	private int protein;
	private int ca;
	private int na;
	private int p;
	private int mg;
	private int fe;
	private int ze;
	private String food_original_img;
	private String food_rename_img;
	private String food_result;
	
	public FoodAi() {
		super();
	}

	public FoodAi(String food_name, String user_id, String food_id, int weight, int kcal, int carbo, int sugars,
			int fat, int protein, int ca, int na, int p, int mg, int fe, int ze, String food_original_img,
			String food_rename_img, String food_result) {
		super();
		this.food_name = food_name;
		this.user_id = user_id;
		this.food_id = food_id;
		this.weight = weight;
		this.kcal = kcal;
		this.carbo = carbo;
		this.sugars = sugars;
		this.fat = fat;
		this.protein = protein;
		this.ca = ca;
		this.na = na;
		this.p = p;
		this.mg = mg;
		this.fe = fe;
		this.ze = ze;
		this.food_original_img = food_original_img;
		this.food_rename_img = food_rename_img;
		this.food_result = food_result;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getCarbo() {
		return carbo;
	}

	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}

	public int getSugars() {
		return sugars;
	}

	public void setSugars(int sugars) {
		this.sugars = sugars;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getCa() {
		return ca;
	}

	public void setCa(int ca) {
		this.ca = ca;
	}

	public int getNa() {
		return na;
	}

	public void setNa(int na) {
		this.na = na;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getMg() {
		return mg;
	}

	public void setMg(int mg) {
		this.mg = mg;
	}

	public int getFe() {
		return fe;
	}

	public void setFe(int fe) {
		this.fe = fe;
	}

	public int getZe() {
		return ze;
	}

	public void setZe(int ze) {
		this.ze = ze;
	}

	public String getFood_original_img() {
		return food_original_img;
	}

	public void setFood_original_img(String food_original_img) {
		this.food_original_img = food_original_img;
	}

	public String getFood_rename_img() {
		return food_rename_img;
	}

	public void setFood_rename_img(String food_rename_img) {
		this.food_rename_img = food_rename_img;
	}

	public String getFood_result() {
		return food_result;
	}

	public void setFood_result(String food_result) {
		this.food_result = food_result;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
