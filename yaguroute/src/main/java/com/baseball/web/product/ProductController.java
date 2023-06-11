package com.baseball.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.common.domain.Team;
import com.baseball.service.domain.Product;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;

	public ProductController() {
		System.out.println(this.getClass());

	}

	@Value("${commonProperties.pageUnit}")
	int pageUnit;

	@Value("${commonProperties.pageSize}")
	int pageSize;

	@PostMapping(value = "addProduct")
	public String addProduct(@ModelAttribute("product") Product product,
			@RequestParam("prodImages") List<MultipartFile> multipartFile, Model model) throws Exception {

		System.out.println("MultipartFile 	::" + product);
		System.out.println("MultipartFile22 ::" + multipartFile);
		System.out.println("/product/addProduct 작동 시작.");

		
		
		
		String path = "C:\\mainPJT\\yaguroute\\src\\main\\webapp\\images\\product";

		// 업로드로 인한 추가
//		List<String> prodImages = new ArrayList<>();

		String prodTemp = "";
		long listSize = multipartFile.size();
		int temp = 1;

		for (MultipartFile mf : multipartFile) {
			String originalFileName = mf.getOriginalFilename();
			long size = mf.getSize();

			System.out.println("originalFileName: " + originalFileName);
			System.out.println("fileSize: " + size);

			//유니크한 이름 생성, 저장
			String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
			
			if(temp == 1 ) { 
				product.setProdImageFirst(uniqueFileName);
			} else if (temp == 2){
				product.setProdImageSecond(uniqueFileName);				
			} else {
				product.setProdImageThird(uniqueFileName);
			}
//			prodTemp = prodTemp + uniqueFileName + ((temp < listSize) ? "," : "");
			temp++;
						
//	        prodImages.add(uniqueFileName);

			try {
				mf.transferTo(new File(path + "\\" + uniqueFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
//	    product.setProdImage(prodImages);
		System.out.println(product);

		productService.addProduct(product);

		//String[] fileNames = prodTemp.split(",");
		//model.addAttribute("fileNames", fileNames);

		return "forward:/product/addProduct.jsp";
	}

	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/product/getProduct 작동 시작");
		Product product = productService.getProduct(prodNo);

		// model and view 연결
		model.addAttribute("product", product);

		return "forward:/product/getProduct.jsp";
	}

	@GetMapping("listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model,
			@RequestParam(value = "prodTeamCode", required = false) String prodTeamCode,
			@RequestParam(value = "teamCode", required = false) String teamCode) throws Exception {

		System.out.println("search" + search);
		System.out.println("prodTeamCode" + prodTeamCode);
		System.out.println("teamCode"+teamCode);
		System.out.println("/product/listProduct 작동 시작");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		System.out.println("데이터가 들어간" + search);

		// Map B/L 수행
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teamCode", teamCode);
		map.put("prodTeamCode", prodTeamCode);
		map.put("search", search);
		map = productService.getProductList(map);

		// Product list 출력
		List<Product> list = (List<Product>) map.get("prodList");
		for (Product prod : list) {
			System.out.println(prod);
		}

		// 페이지 객체 생성 & map에서 product totalCount(총 개수) 출력
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		//팀 정보 조회
		List<Team> allTeam = gameService.getAllTeam();

		// Model 과 View 연결
		model.addAttribute("prodTeamCode", prodTeamCode);
		model.addAttribute("list", map.get("prodList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("allTeam", allTeam);

		return "forward:/product/listProduct.jsp";
	}
	
	@GetMapping("salesProdList")
	public String salesProdList(@ModelAttribute("search") Search search, Model model,
			@RequestParam(value = "prodTeamCode", required = false) String prodTeamCode,
			@RequestParam(value = "teamCode", required = false) String teamCode) throws Exception {

		System.out.println("search" + search);
		System.out.println("teamCode"+teamCode);
		System.out.println("prodTeamCode" + prodTeamCode);
		System.out.println("/product/salesProdList 작동 시작");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(6);
		System.out.println("데이터가 들어간" + search);

		// Map B/L 수행
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teamCode", teamCode);
		map.put("prodTeamCode", prodTeamCode);
		map.put("search", search);
		map = productService.getSalesProdList(map);
		// Product list 출력
		List<Product> list = (List<Product>) map.get("salesList");
		for (Product salesProd : list) {
			System.out.println(salesProd);
		}
		Product product = new Product();
		int prodNo = product.getProdNo();
		System.out.println("prodNo"+prodNo);
		// 페이지 객체 생성 & map에서 product totalCount(총 개수) 출력
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		//팀 정보 조회
		List<Team> allTeam = gameService.getAllTeam();

		
		// Model 과 View 연결
		model.addAttribute("prodTeamCode", prodTeamCode);
		model.addAttribute("list", map.get("salesList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("allTeam", allTeam);
		model.addAttribute("prodNo", prodNo);


		return "forward:/product/salesProdList.jsp";
	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/product/updateProductView 작동 시작");
		// Business Logic
		Product product = productService.getProduct(prodNo);
		System.out.println("prodNo??"+prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product) throws Exception {

		System.out.println(product);
		System.out.println("/product/updateProduct 작동 시작");

		productService.updateProduct(product);

		return "forward:/product/updateProduct.jsp";

	}
	

}
