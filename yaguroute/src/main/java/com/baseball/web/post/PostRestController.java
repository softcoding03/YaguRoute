package com.baseball.web.post;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.common.util.S3Uploader;
import com.baseball.service.domain.Post;
import com.baseball.service.domain.User;
import com.baseball.service.post.PostService;
import com.baseball.service.user.UserService;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.apache.commons.io.FileUtils; // 추가
import com.google.gson.JsonObject; // 추가

import com.baseball.service.domain.Product;
import com.baseball.service.importAPI.ImportAPIRestDao;
@RestController
@RequestMapping("/post/rest/*")
public class PostRestController {
	
		///Field
		@Autowired
		@Qualifier("postServiceImpl")
		private PostService postService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
	    private S3Uploader s3Uploader;
	    
	    @Autowired
	    public void setS3Uploader(S3Uploader s3Uploader) {
	        this.s3Uploader = s3Uploader;
	    }
		
		public PostRestController(){
			System.out.println(this.getClass());
		}
		
		//좋아요 싫어요 동작
		@RequestMapping(value="addLike/{postNo}/{type}",method=RequestMethod.GET)
		public Map addLike(@PathVariable int postNo, @PathVariable String type,HttpSession session) throws Exception{
			System.out.println("/post/rest/addLike GET 시작");
			System.out.println("-- Param넘어온 것은??"+postNo+"//"+type);
			Map<String, Object> map = new HashMap<String, Object>();
			User user = (User)session.getAttribute("user");
			Post post = new Post();
			post.setUser(user);
			post.setPostNo(postNo);
			
			if(type.equals("Like")) {
				postService.addLike(post);
			} else if(type.equals("DisLike")) {
				postService.addDislike(post);
			}
			
			int likes = postService.getLikes(postNo);
			int disLikes = postService.getDislikes(postNo);
			
			map.put("likes", likes);
			map.put("disLikes", disLikes);
			return map;
		}
		
		@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json; charset=utf8")
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request ) throws Exception  {
			/*
			 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
			// 내부경로로 저장
			 * String contextRoot = request.getServletContext().getRealPath("/");
			 * System.out.println("contextRoot ?? "+contextRoot); String fileRoot =
			 * contextRoot+"/images/fileupload/";
			 * File targetFile = new File(fileRoot + savedFileName); try { InputStream
			 * fileStream = multipartFile.getInputStream();
			 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
			 * contextroot + resources + 저장할 내부 폴더명 jsonObject.addProperty("responseCode",
			 * "success");
			 * } catch (IOException e) { FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
			 * jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
			 */
			JsonObject jsonObject = new JsonObject();

			System.out.println("uploadSummernoteImageFile 시작 ");
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID().toString() + extension;	//저장될 파일 명
			System.out.println("savedFileName ?"+savedFileName);
			String fileName = savedFileName;
			//String fileName = "postimage/"+savedFileName;
			String resultURL = s3Uploader.uploadFiles(multipartFile, fileName);
			System.out.println("resultURL ? "+resultURL); //오브젝트스토리지 올라간 파일 총 경로
			String imageOptimizer = "?type=f&w=450&h=300";
			//String imageOptimizer = "?type=h&h=200";
	        String result = "http://jmsmoufzcvqi17847679.cdn.ntruss.com/"+fileName+imageOptimizer;
			jsonObject.addProperty("url", result);
			result = jsonObject.toString();
			System.out.println("result ??"+result);
			return result;
		}
		
		//새 창 띄우고 끄기 위해 ajax로 동작
		@PostMapping("addPost")
		public String addPost(@ModelAttribute("post") Post post, Model model, HttpSession session) throws Exception {
				System.out.println("/post/rest/addPost : POST START");	
				System.out.println("-- 넘어온 데이터 ? "+post); //화면에서 userId 히든으로 두고 post에서 같이 뽑을 것
				User user = (User)session.getAttribute("user");
				post.setUser(user);//post에 user정보 모두 저장해주기위함
				postService.addPost(post); //insert 완료
				int postNo = postService.getLastPostNo();
				Post post2 = postService.getPost(postNo);
				System.out.println("-- insert된 post 및 보내지는 post는 ? "+post2);
				model.addAttribute("post", post2);
				return "success";
		}
		
		@PostMapping("updatePost")
		public String updatePost(@ModelAttribute("post") Post post, Model model) throws Exception {
				System.out.println("/post/rest/updatePost : POST START");	
				System.out.println("-- 넘어온 데이터 ? "+post); //화면에서 userId 히든으로 두고 post에서 같이 뽑을 것
				postService.updatePost(post); //update 완료
				System.out.println("update 완료");
				Post post2 = postService.getPost(post.getPostNo());
				System.out.println("수정된 post"+post2);
				model.addAttribute("post", post2);
				return "success";
		}
}