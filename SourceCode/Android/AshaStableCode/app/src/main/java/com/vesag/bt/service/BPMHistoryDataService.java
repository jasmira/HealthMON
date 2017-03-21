package com.vesag.bt.service;

import com.vesag.bt.beans.BPMHistoryData;
import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.parser.BPMDataParser;
import com.vesag.bt.util.ApplicationException;

import org.apache.log4j.Logger;

import java.io.DataInputStream;
import java.util.List;

public class BPMHistoryDataService implements DeviceDataParser{
	
	private static final Logger log = Logger.getLogger(BPMHistoryDataService.class);
	public ClinicalMonitorDeviceData parseData(DataInputStream byteStream) throws ApplicationException{
		List<BPMHistoryData> bpmList = BPMDataParser.getBPMHistoryParsedPackets(byteStream);
		
		for(BPMHistoryData bpmpacket : bpmList) {
			System.out.println("1");
			System.out.println("2");
			System.out.println("78");
			System.out.println("Index :" + bpmpacket.getId());
			System.out.println("89");
			System.out.println("Year :" + bpmpacket.getYear());
			System.out.println("77");
			System.out.println("Month :" + bpmpacket.getMonth());
			System.out.println("68");
			System.out.println("Day :" + bpmpacket.getDay());
			System.out.println("72");
			System.out.println("Hour :" + bpmpacket.getHour());
			System.out.println("77");
			System.out.println("Minute :" + bpmpacket.getMinute());
			System.out.println("83");
			System.out.println("Systolic :" + bpmpacket.getSystolic());
			System.out.println("68");
			System.out.println("Diastolic :" + bpmpacket.getDiastolic());
			System.out.println("80");
			System.out.println("Pulse :" + bpmpacket.getPulse());
			System.out.println("0");
			System.out.println("0");
			System.out.println("0");
			System.out.println("0");
			System.out.println("0");
			System.out.println("0");
			System.out.println("");

		}
		return null;
	}
}

