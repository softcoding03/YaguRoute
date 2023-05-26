package com.baseball.web.product;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl") 
	private ProductService productService;
		
	public ProductController() {
		System.out.println(this.getClass());
	
	}
	
	@Value("${commonProperties.pageUnit}")
	int pageUnit;
	
	@Value("${commonProperties.pageSize}")
	int pageSize;
	
	
	
	@PostMapping(value="addProduct")   
	public String addProduct(@ModelAttribute("product") Product product,
								@RequestParam("files") List<MultipartFile> multipartFile, Model model) throws Exception {
																
		System.out.println("MultipartFile 	::"+product);
		System.out.println("MultipartFile22 ::"+multipartFile);
		System.out.println("/product/addProduct 작동 시작.");
		
		String path = "C:\\mainPJT\\yaguroute\\src\\main\\webapp\\images\\product";
		
		//업로드로 인한 추가
//		List<String> prodImages = new ArrayList<>();

		
	    String prodTemp = "";
	    long listSize = multipartFile.size();
	    int temp = 1;
		
	    for (MultipartFile mf : multipartFile) {
	        String originalFileName = mf.getOriginalFilename();
	        long size = mf.getSize();
	        
	        System.out.println("originalFileName: " + originalFileName);
	        System.out.println("fileSize: " + size);

	        String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
	        prodTemp = prodTemp + uniqueFileName + ((temp < listSize) ? "," : "");
	        temp++;	        
//	        prodImages.add(uniqueFileName);
	        
	        

	        try {
	            mf.transferTo(new File(path + "\\" + uniqueFileName));
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    product.setProdImage(prodTemp);
//	    product.setProdImage(prodImages);
	    System.out.println(product);

	    productService.addProduct(product);
	    
	    String[] fileNames = prodTemp.split(",");
	    model.addAttribute("fileNames", fileNames);

	    return "forward:/product/addProduct.jsp";
	}
	
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("/product/getProduct 작동 시작");
		Product product = productService.getProduct(prodNo);
		
		//model and view 연결
		model.addAttribute("product",product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println(search);
		System.out.println("/product/listProduct 작동 시작");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		//Map B/L 수행
		Map<String, Object> map = productService.getProductList(search);
		
	
		//System.out.println("for문으로 map 안에 있는 list 안에 ProdNo가 있는지 확인.");
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
				
	
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
				
		return "forward:/product/listProduct.jsp";
	}
	
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProductView 작동 시작");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
			
		return "forward:/product/updateProductView.jsp";
	}
	
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product) throws Exception {
		
		
		System.out.println(product);
		System.out.println("/product/updateProduct 작동 시작");	
		
		productService.updateProduct(product);


		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
		
	}

}


