package com.szt.modules.wx.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import javax.net.ssl.*;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class NetworkUtils 
{
	private static final String CHARACTER_ENCO="UTF-8";
	public final static String EXE_TYPE_POST="POST";
	public final static String EXE_TYPE_GET="GET";
	private final static String ERROR_DEFALUT_VAL="{errmsg:'network error',errcode:808080}";
	public static String httpUrl(String url,String data,String type){
		HttpsURLConnection conn = null;
		try{
			TrustManager[] tm = {new X509TrustManager() {
				@Override
				public X509Certificate[] getAcceptedIssuers() {
					return null;
				}
				@Override
				public void checkServerTrusted(X509Certificate[] arg0, String arg1)
						throws CertificateException {
				}
				
				@Override
				public void checkClientTrusted(X509Certificate[] arg0, String arg1)
						throws CertificateException {
				}
			}};  
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
            sslContext.init(null, tm, new SecureRandom());  
            SSLSocketFactory ssf = sslContext.getSocketFactory();  
			URL httpclient =new URL(url);
			conn =(HttpsURLConnection ) httpclient.openConnection();
	        conn.setSSLSocketFactory(ssf);
	        //conn.setConnectTimeout(10000);
	        //conn.setReadTimeout(10000);
	        conn.setRequestMethod(type);
	        //conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
	        conn.setDoInput(true);
	        conn.setUseCaches(false);
	        
	        if(data!=null){
	        	conn.setDoOutput(true);
		        conn.connect();
	        	OutputStream os= conn.getOutputStream();    
		        os.write(data.getBytes(CHARACTER_ENCO));
		        os.flush();
		        os.close();
	        }

	        InputStream is =conn.getInputStream();
	        InputStreamReader inputStreamReader = new InputStreamReader(is, CHARACTER_ENCO);  
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
            String str = null;  
            StringBuilder builder = new StringBuilder();
            while ((str = bufferedReader.readLine()) != null) {  
            	builder.append(str);  
            }  
            bufferedReader.close();  
            inputStreamReader.close();
	        is.close();
	        
	        return builder.toString();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(conn!=null)conn.disconnect();
		}
		return ERROR_DEFALUT_VAL;
	}
	public static String httpClient(String url,String data,String type){
		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;;
		String result = null;
		HttpUriRequest request = null;
		try {
			if(EXE_TYPE_GET.equals(type))request = new HttpGet(url);
			else if(EXE_TYPE_POST.equals(type))request = new HttpPost(url);
			response = httpclient.execute(request);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				result = EntityUtils.toString(entity,CHARACTER_ENCO);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(response!=null){
				try {
					response.close();
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
		
	}
	public static String httpClient(String url,Map<String,Object> data,String type){
		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		String result = null;
		try {
			if(EXE_TYPE_GET.equals(type)){
				StringBuilder buffer = new StringBuilder();
				buffer.append("?");
				for(String key:data.keySet()){
					buffer.append(key).append("=").append(data.get(key)).append("&");
				}
				buffer.deleteCharAt(buffer.length()-1);
				HttpGet get = new HttpGet(url+buffer.toString());
				response = httpclient.execute(get);
			}
			else if(EXE_TYPE_POST.equals(type)){
				List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
				for(String key:data.keySet()){
					nvps.add(new BasicNameValuePair(key,(String) data.get(key)));
				}
				HttpPost post = new HttpPost(url);
				post.setEntity(new UrlEncodedFormEntity(nvps, Charset.forName(CHARACTER_ENCO)));
				response = httpclient.execute(post);
			}
			
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				result = EntityUtils.toString(entity,CHARACTER_ENCO);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(response!=null){
				try {
					response.close();
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	public static String httpClient(String url, JSONObject json, String type){
		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		String result = ERROR_DEFALUT_VAL;
		try {
			if(EXE_TYPE_GET.equals(type)){
				HttpGet get = new HttpGet(url);
				response = httpclient.execute(get);
			}
			else if(EXE_TYPE_POST.equals(type)){
				StringEntity entity = new StringEntity(json.toString(),Charset.forName(CHARACTER_ENCO));
				entity.setContentEncoding(CHARACTER_ENCO);    
                entity.setContentType("application/json");  
				HttpPost post = new HttpPost(url);
				post.setEntity(entity);
				response = httpclient.execute(post);
			}
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				result = EntityUtils.toString(entity,CHARACTER_ENCO);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(response!=null){
				try {
					response.close();
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	public static String uploadImage(String requestUrl,String fileName){
		
		CloseableHttpClient http = HttpClients.createDefault();
		HttpPost post = new HttpPost(requestUrl);
		FileBody file = new FileBody(new File(fileName));
		CloseableHttpResponse response = null;
		try {
			  
			HttpEntity reqEntity = MultipartEntityBuilder.create()
                    .setMode(HttpMultipartMode.BROWSER_COMPATIBLE)
                    .addPart("media", file)
                   .build();  
			post.setEntity(reqEntity);
			response = http.execute(post);
			if(response.getStatusLine().getStatusCode() ==HttpStatus.SC_OK){
				return EntityUtils.toString(response.getEntity());
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(response!=null){
				try {
					response.close();
					http.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
		 
	}
	public static byte[] downMedia(String requestUrl){
		CloseableHttpClient http = HttpClients.createDefault();
		HttpGet get = new HttpGet(requestUrl);
		CloseableHttpResponse response = null;
		try {
			response = http.execute(get);
			byte[] result = null;
			if(response.getStatusLine().getStatusCode() ==HttpStatus.SC_OK){
				result = EntityUtils.toByteArray(response.getEntity());
				return result;
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(response!=null){
				try {
					response.close();
					http.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	public static String test(String url,String type){
		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;;
		String result = null;
		HttpUriRequest request = null;
		try {
			if(EXE_TYPE_GET.equals(type))request = new HttpGet(url);
			else if(EXE_TYPE_POST.equals(type))request = new HttpPost(url);
			response = httpclient.execute(request);
			if(response.getStatusLine().getStatusCode()==503){
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					result = EntityUtils.toString(entity,CHARACTER_ENCO);
				}
			}
			
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(response!=null){
				try {
					response.close();
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
		
	}
}
