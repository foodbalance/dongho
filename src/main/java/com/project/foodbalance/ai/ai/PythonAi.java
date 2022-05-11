package com.project.foodbalance.ai.ai;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PythonAi {
	
	public String AiValue(String save_path, String img_name) {
		String value = null;
		
		String img_path = "C:/FoodBalance/food/src/main/webapp/resources/ai_food_img/" + img_name;
		System.out.println("img_name : " + img_name);
		
		save_path = "/";
		String command = "C:/Users/ict02-07/.conda/envs/food/python.exe";
		
		String arg1 = "C:/django/pytorch-YOLOv4-master/demo.py";
		String argv1 = "15";
		String argv2 = "C:/django/pytorch-YOLOv4-master/checkpoints/Yolov4_epoch50.pth";
		String argv4 = "C:/django/pytorch-YOLOv4-master/test/_classes.txt";
		
		try {
			ProcessBuilder builder = new ProcessBuilder(command, arg1, argv1, argv2, img_path, argv4);
			System.out.println("builder : " + builder);
			Process process = builder.start();
			int exitVal = process.waitFor();
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "euc-kr"));
			String line;
			
			while ((line = br.readLine()) != null) {
				System.out.println(">>>" + line);
				value = line;
			}
			
			if(exitVal != 0) {
				System.out.println("error on process");
				System.out.println(exitVal);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("값 : " + value);
		
		return value.trim();
	}
}
