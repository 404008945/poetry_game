package com.poetry.utils;

import org.apache.http.*;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 *@author 创建人：zxy
 * @version 创建时间：2018年10月29日 上午10:51:10
 * 类说明：java后台HTTP请求方法
 */
public class HttpClientUtil {

    /**
     * get请求
     *
     * @param url
     * @return
     */
    public static String doGet(String url) {
        try {
            HttpClient client = HttpClientBuilder.create().build();
            // 发送get请求
            HttpGet request = new HttpGet(url);
            HttpResponse response = client.execute(request);
            // 请求发送成功，并得到响应
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                // 读取服务器返回过来的json字符串数据
                String strResult = EntityUtils.toString(response.getEntity());
                return strResult;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * post请求(用于key-value格式的参数)
     *
     * @param url
     * @param params
     * @return
     */
    public static String doPost(String url, Map<String, Object> params) {
        BufferedReader in = null;
        try {
            // 定义HttpClient
            HttpClient client = HttpClientBuilder.create().build();
            // 实例化HTTP方法
            HttpPost request = new HttpPost();
            request.setURI(new URI(url));
            // 设置参数
            List<NameValuePair> nvps = new ArrayList<NameValuePair>();
            for (Entry<String, Object> entry : params.entrySet()) {
                nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue() + ""));
            }
            request.setEntity(new UrlEncodedFormEntity(nvps, StandardCharsets.UTF_8));
            HttpResponse response = client.execute(request);
            int code = response.getStatusLine().getStatusCode();
            if (code == 200) { // 请求成功
                in = new BufferedReader(
                        new InputStreamReader(response.getEntity().getContent(), StandardCharsets.UTF_8));
                StringBuffer sb = new StringBuffer("");
                String line = "";
                String NL = System.getProperty("line.separator");
                while ((line = in.readLine()) != null) {
                    sb.append(line + NL);
                }
                in.close();
                return sb.toString();
            } else {

                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    /**
     * post请求（用于请求json格式的参数）
     *
     * @param url
     * @param params
     * @return
     */
    public static String doPost(String url, String params) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);// 创建httpPost
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-Type", "application/json");
        String charSet = "UTF-8";
        StringEntity entity = new StringEntity(params, charSet);
        httpPost.setEntity(entity);
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httpPost);
            StatusLine status = response.getStatusLine();
            int state = status.getStatusCode();
            if (state == HttpStatus.SC_OK) {
                HttpEntity responseEntity = response.getEntity();
                String jsonString = EntityUtils.toString(responseEntity);
                return jsonString;
            } else {
                System.out.println("请求返回:" + state + "(" + url + ")");
            }
        } finally {
            if (response != null) {
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            try {
                httpclient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}