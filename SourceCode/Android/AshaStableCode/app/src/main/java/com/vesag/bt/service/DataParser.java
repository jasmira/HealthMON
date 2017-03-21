package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.util.ApplicationException;

import java.io.DataInputStream;


public class DataParser {
	
	private DeviceDataParser parser ;
	
	public DataParser(DeviceDataParser parser){
		this.parser = parser;
	}
	
	//Depending on the DeviceDataParser object, this method calls the parseData() method of that corresponding object
	public ClinicalMonitorDeviceData getParsingStarted(DataInputStream byteStream) throws ApplicationException{
			return parser.parseData(byteStream);
		
	}
		
}
