package com.baseball.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3DataSource;


@Component
public class S3Uploader {
	//field
	private final AmazonS3Client amazonS3Client;
	
	@Value("${bucketName}")
	private String bucketName;
	
	@Value("${fileUpload}")
	private String fileUploadPath;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	//amazonS3Client injection
	public S3Uploader(AmazonS3Client amazonS3Client) {
		this.amazonS3Client = amazonS3Client;
	}
	
	
	//methods
	
	// 단일 업로드 시
	public String upload(File uploadFile, String fileName) {
    //String fileName = filePath + "/" + UUID.randomUUID() + uploadFile.getName();   // S3에 저장된 파일 이름
      String uploadImageUrl = putS3(uploadFile, fileName); // s3로 업로드
      System.out.println("uploadImageUrl : "+uploadImageUrl);
      removeNewFile(uploadFile);
      return uploadImageUrl;
	}
	
	
	public String uploadFiles(MultipartFile multipartFile, String dirName) throws IOException {
        File uploadFile = convert(multipartFile)  // 파일 변환할 수 없으면 에러
                .orElseThrow(() -> new IllegalArgumentException("error: MultipartFile -> File convert fail"));
        return upload(uploadFile, dirName);
    }
	
	// S3로 업로드
    private String putS3(File uploadFile, String fileName) {
        amazonS3Client.putObject(new PutObjectRequest(bucketName, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
        return amazonS3Client.getUrl(bucketName, fileName).toString();
    }
    
    
    // 로컬에 파일 업로드
	private Optional<File> convert(MultipartFile file) throws IOException {
		Resource resource = resourceLoader.getResource("classpath:" + fileUploadPath);
		System.out.println("::fileUploadPath ? "+fileUploadPath);
		System.out.println("::resource ? "+resource);
		File uploadDir = resource.getFile();
		System.out.println("::uploadDir ? "+uploadDir);
        File convertFile = new File(uploadDir, file.getOriginalFilename());
        System.out.println("::convertFile ? "+convertFile);
        // Check if the parent directory exists
        File parentDir = convertFile.getParentFile();
        if (!parentDir.exists()) {
            parentDir.mkdirs();  // Create the directory if it does not exist
        }
        
        if (convertFile.createNewFile()) {
            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
                fos.write(file.getBytes());
            }
            return Optional.of(convertFile);
        }
        return Optional.empty();
    }
	
	
	
	// 로컬 파일 삭제
	private void removeNewFile(File targetFile) {
        if (targetFile.delete()) {
            System.out.println("File delete success");
            return;
        }
        System.out.println("File delete fail");
    }
		 
}
