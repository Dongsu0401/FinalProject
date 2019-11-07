package com.kh.FinalProject.studyseat.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.FinalProject.studyseat.model.vo.Seat;

@Service("sService")
public interface SeatService {

	ArrayList<Integer> countSeat();

	ArrayList<Seat> selectSeatList();

	ArrayList<Seat> selectSeatList(String floor);

}
