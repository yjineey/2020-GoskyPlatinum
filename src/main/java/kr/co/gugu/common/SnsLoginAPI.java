package kr.co.gugu.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.gugu.dao.MemberDAO;
import kr.co.gugu.domain.MemberDTO;

@Service
public class SnsLoginAPI {

	public Map<String, String> getURL(Map<String, String> map) {

		try { 

			File file = ResourceUtils.getFile("classpath:json/login.json");

			String jsonData = new String(Files.readAllBytes(file.toPath()));

			JSONParser jsonParse = new JSONParser(); 

			JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData); 

			JSONObject jsonObj2 = (JSONObject) jsonObj.get(map.get("key"));

			map.clear();
			
			map.put("client_id", (String) jsonObj2.get("client_id"));
			map.put("redirect_uri", (String) jsonObj2.get("redirect_uri"));
			
		} catch (Exception e) {
			e.printStackTrace(); 
		} 

		return map;
	}
	
	public String getAccessToken (String authorize_code, String key) {
        String access_Token = "";
        String reqURL;
        
        if(key.equals("kakao"))
        	reqURL = "https://kauth.kakao.com/oauth/token";
        else if(key.equals("google")) // google
        	reqURL = "https://www.googleapis.com/oauth2/v4/token";
        else // naver
        	reqURL = "https://nid.naver.com/oauth2.0/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            
            if(key.equals("kakao")) {
            	sb.append("&client_id=e005321d2821755d827e3a4f710f70bf");
                sb.append("&redirect_uri=http://localhost:8080/gugu/login/forKakao");
            }
            else if(key.equals("google")) { // google
            	sb.append("&client_id=272435018195-0rsf5unlom1vcqoadg7sh2qp5hb2keor.apps.googleusercontent.com");
                sb.append("&client_secret=TZyAWpp3QMqCBFhn95I7Awej");
                sb.append("&redirect_uri=http://localhost:8080/gugu/login/forGoogle");
            }
            else { // naver
            	sb.append("&client_id=Rw5jJ1AO4VB1rYlGWXGN");
            	sb.append("&client_secret=onMaqVDGxd");
            }
            
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
//            int responseCode = conn.getResponseCode();
//            System.out.println("[getAccessToken] responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }

//            System.out.println("result => " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            
            br.close();
            bw.close();
            
        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return access_Token;
    }

	
	
	@Autowired
	private MemberDAO memberDAO;
	
	public String getUserInfo (String access_Token, String key) {
	    
		String id = null;
		
//	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
//	    Map<String, Object> userInfo = new HashMap<String, Object>();
		
	    String reqURL;
        
        if(key.equals("kakao"))
        	reqURL = "https://kapi.kakao.com/v2/user/me";
        else if(key.equals("google")) // google
        	reqURL = "https://www.googleapis.com/userinfo/v2/me";
        else
        	reqURL = "https://openapi.naver.com/v1/nid/me";
        	
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        if(key.equals("kakao"))
	        	conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
//	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties;
//	        JsonObject account;
	        
	        String nickname = "";
	        String image = "";
	        
	        if(key.equals("kakao")) {
	        	properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//	        	account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        	
	        	id = element.getAsJsonObject().get("id").getAsString();
	        	
	        	nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        	image = properties.getAsJsonObject().get("profile_image").getAsString();
	        } else if(key.equals("google")) {
	        	id = element.getAsJsonObject().get("id").getAsString();
	        	
	        	nickname = element.getAsJsonObject().get("name").getAsString();
	        	image = element.getAsJsonObject().get("picture").getAsString();
	        } else {
	        	properties = element.getAsJsonObject().get("response").getAsJsonObject();

	        	id = properties.getAsJsonObject().get("id").getAsString();
	        	nickname = properties.getAsJsonObject().get("name").getAsString();
	        	image = properties.getAsJsonObject().get("profile_image").getAsString();
	        }
	        
	        if(memberDAO.checkDuplicatedId(id) == 0) {
	        	MemberDTO member = new MemberDTO();
				
				member.setMid(id);
				member.setMname(nickname);
				member.setImg(image);
				
				memberDAO.addMemberSNS(member);
	        }
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return id;
	}
	
}
