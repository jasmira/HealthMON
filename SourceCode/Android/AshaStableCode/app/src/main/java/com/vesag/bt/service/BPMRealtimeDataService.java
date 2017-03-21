package com.vesag.bt.service;

import com.vesag.bt.beans.BPMRealTimeData;
import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.parser.BPMDataParser;
import com.vesag.bt.util.ApplicationException;

import java.io.DataInputStream;

//import com.persistent.healthmonitor.SearchForDevices;
//import com.vesag.bt.dao.BTDeviceDataDAO;

public class BPMRealtimeDataService implements DeviceDataParser{
	
	public ClinicalMonitorDeviceData parseData(DataInputStream byteStream) throws ApplicationException{
			BPMRealTimeData bpmBean = BPMDataParser.getBPMRealTimeParsedPacket(byteStream);
			return bpmBean;
	}

}
