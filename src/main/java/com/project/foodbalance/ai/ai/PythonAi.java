package com.project.foodbalance.ai.ai;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PythonAi {
	
	public String AiValue(String save_path, String img_name) {
		String value = null;
		
		
		System.out.println("img_name : " + img_name);

		String command = "C:/Users/ict02-07/.conda/envs/food/python.exe";		
		String argv1 = "C:/django/pytorch-YOLOv4-master/models.py";
		
		String argv2 = "15";
		String argv3 = "C:/django/pytorch-YOLOv4-master/checkpoints/Yolov4_epoch50.pth";
		String argv4 = "C:/FoodBalance/food/src/main/webapp/resources/ai_food_img/" + img_name;
		String argv5 = "C:/django/pytorch-YOLOv4-master/test/_classes.txt";
		String argvs = argv2 + argv3 + argv4 + argv5;
		try {
			ProcessBuilder builder = new ProcessBuilder(command,  argv1, argv2, argv3, argv4, argv5);
			Process process = builder.start();
			int exitVal = process.waitFor();
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "euc-kr"));
			String line;
			line = br.readLine();
			value = line.substring(0,8);
			
			/*
			 * while ((line = br.readLine()) != null) { System.out.println(">>>" + line);
			 * value = line+","; }
			 */
			
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
