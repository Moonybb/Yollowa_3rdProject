package com.proj.yollowa.util.socialLogin;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;

public class AccessToken {


	public static JsonNode getAccessToken(String code) {
		final String RequestUrl;
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();


		RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "65ddf9c4a57ddf27e0cf2ac5eaac8af5")); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", "http://112.169.196.125/yollowa/login/kakao/callback")); // 리다이렉트 URI

		/*https://accounts.google.com/o/oauth2/v2/auth?redirect_uri=http://localhost:8080/yollowa/login/google/callback&response_type=code&client_id=183141477636-5vabtlolvogrdtv3r2rg8graq5c96fk2.apps.googleusercontent.com&scope=https://www.googleapis.com/auth/userinfo.email&access_type=offline
		 */	        
		postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값

		final HttpClient client = HttpClientBuilder.create().build();
		System.out.println(client);
		final HttpPost post = new HttpPost(RequestUrl);
		System.out.println(post);
		JsonNode returnNode = null;

		try {

			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);


			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
//			System.out.println(response.getEntity().getContent());
//				            InputStream is = response.getEntity().getContent();
//				            int su=-1;
//				            while((su=is.read())!=-1) {
//				            	System.out.print((char)su);
//				            }
			returnNode = mapper.readTree(response.getEntity().getContent());


		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
		}

		return returnNode;
	}


}
