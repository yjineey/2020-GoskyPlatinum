package kr.co.gugu;

import java.io.File;
import java.nio.file.Files;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.util.ResourceUtils;

public class JsonTest {

	public static void main(String[] args) {
		
		try { 
			
			File file = ResourceUtils.getFile("classpath:json/login.json");
			
			String jsonData = new String(Files.readAllBytes(file.toPath()));
			
			JSONParser jsonParse = new JSONParser(); 
			//JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다. 
			
			JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData); 
			//JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다. 
			
			JSONObject jsonObj2 = (JSONObject) jsonObj.get("kakao");
			
			String url = (String) jsonObj2.get("url");
			url += "?client_id=" + jsonObj2.get("client_id");
			url += "&redirect_uri=" + jsonObj2.get("redirect_uri");
			url += "&response_type=" + jsonObj2.get("response_type");
			
			System.out.println(url);
			
		} catch (Exception e) {
			e.printStackTrace(); 
		} 
		
	} 
	
}
