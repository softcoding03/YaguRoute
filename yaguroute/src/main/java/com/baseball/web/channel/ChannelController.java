package com.baseball.web.channel;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;

@Controller
@RequestMapping("/channel/*")
public class ChannelController {
	
	//field
	@Autowired
	@Qualifier("channelServiceImpl")
	private ChannelService channelService;
	
	@Autowired
	@Qualifier("channelRestServiceImpl")
	private ChannelRestService channelRestService;
	
	//Constructor
	public ChannelController() {
		System.out.println(this.getClass());
	}
	
	
	//method
	
	//addChannel : GET (추가 화면)
	@GetMapping("addChannel")
	public String addChannelView() throws Exception{
		System.out.println("/addProductView");
		return "redirect:/channel/addChannelView.jsp";
	}
	
	//addChannel:POST (데이터 수정 후 화면)
	@PostMapping("addChannel")
	public ModelAndView addChannel(@ModelAttribute("channel") Channel channel,
											HttpSession session) throws Exception{
		
		System.out.println("addChannel:POST 시작");
		System.out.println("channel NAME : "+channel.getChannelName());
		
		// 1.channel REST로 Naver Cloud에 생성
		Channel returnData = channelRestService.addChannel(channel);
		
		// 2.channel 로컬 DB에 저장
		channelService.addChannel(returnData);
		
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("channel",returnData);
		modelView.setViewName("forward:/channel/addChannel.jsp");
		
		return modelView;
	}
	
	//getChannelList
	@GetMapping("listChannel")
	public ModelAndView getChannelList() throws Exception{
		System.out.println("getChannelList 시작");
		List<Channel> list = channelService.getChannelList();
		
		for(Channel channel : list) {
			System.out.println(channel);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("forward:/channel/listChannel.jsp");
		
		return modelAndView;
	}
	
	//getChannel
	@GetMapping("getChannel")
	public ModelAndView getChannel(@RequestParam(value="channelID") String channelID) throws Exception{
		System.out.println("getChannel Start...");
		
		Channel channel = channelService.getChannel(channelID);
		System.out.println("Channel Info : "+channel);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("channel", channel);
		modelAndView.setViewName("forward:/channel/getChannel.jsp");
		System.out.println("getChannel End...");
		return modelAndView;
	}
	

}
