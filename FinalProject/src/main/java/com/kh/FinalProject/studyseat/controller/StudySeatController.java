package com.kh.FinalProject.studyseat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.FinalProject.studyseat.model.exception.SeatException;
import com.kh.FinalProject.studyseat.model.service.SeatService;
import com.kh.FinalProject.studyseat.model.vo.Seat;

@Controller
public class StudySeatController {

		@Autowired
		private SeatService sService ;
		
		@RequestMapping("seatList.ss")
		public ModelAndView selectSeatList(ModelAndView mv) {
			
						
			// A , B , C 열람실의 좌석을 먼저 가져옴
			ArrayList<Integer> countList = sService.countSeat();
			
			System.out.println("countList : " + countList);
			if(countList == null) {
				throw new SeatException("열람실별 좌석갯수 불러오기 실패!");
			}
			
			// default로 A열람실의 좌석을 먼저 보여줌			
			ArrayList<Seat> sList = sService.selectSeatList();
			
			if(sList != null) {
				System.out.println("sList : " + sList);
				
				 mv.addObject("count" , countList)
				   .addObject("list" , sList)
				   .addObject("floor" , "A")
				   .setViewName("studyseatView");
				return mv;
			}
			else {
				throw new SeatException("좌석리스트 가져오기 실패!");
			}
			 
		}
		
		@RequestMapping("myseatList.ss")
		public String mySeatList() {
			
			return "my_studyseatList";
		}
		
		@RequestMapping("studymain.ss")
		public String studyMain() {
			return "studyMain";
		}		
		
		@RequestMapping("popResv.ss")
		public String popResv() {
			return "popReservation";
		}
		
		@RequestMapping("popCancel.ss")
		public String popCancel() {
			return "popCancelResv";
		}
		
		@RequestMapping("slistAjax.ss")
		public void selectSeatList(HttpServletResponse response , String floor) throws IOException {
			
			response.setContentType("application/json; charset=UTF-8");
			
			// A , B , C 열람실의 좌석을 먼저 가져옴
			ArrayList<Integer> countList = sService.countSeat();
			
			JSONArray countArr = new JSONArray();
			
			for(int i : countList) {
				JSONObject jCount = new JSONObject();
				
				jCount.put("count", i);
				countArr.add(jCount);
			}
			
			System.out.println("countList : " + countList);
			if(countList == null) {
				throw new SeatException("열람실별 좌석갯수 불러오기 실패!");
			}
			
			
			//aaassgdsgdag
			
			// 열람실 층수에 맞는 좌석을 가져옴
			ArrayList<Seat> sList = sService.selectSeatList(floor);
			
			JSONArray seatArr = new JSONArray();
			
			for(Seat seat : sList) {
				JSONObject jSeat = new JSONObject();
				
				jSeat.put("no", seat.getSs_no());
				jSeat.put("floor", seat.getSs_floor());
				jSeat.put("use", seat.getSs_use());
				
				seatArr.add(jSeat);
			}
			
			Gson gson = new GsonBuilder().create(); 
						
			if(countList != null && sList != null) {
				JSONObject sendJson = new JSONObject();
				sendJson.put("cList", countArr);
				sendJson.put("sList", seatArr);
				
				PrintWriter out = response.getWriter();
				out.print(sendJson);
				out.flush();
				out.close();
			}
			else {
				throw new SeatException("열람실 층에 맞는 좌석가져오기 실패!");
			}			
			
		}
	
}
