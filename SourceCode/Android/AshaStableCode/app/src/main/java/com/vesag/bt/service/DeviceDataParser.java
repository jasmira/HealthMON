package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.util.ApplicationException;

import java.io.DataInputStream;

public interface DeviceDataParser {
	//Provides implementation to services for parsing the data from data stream
	public ClinicalMonitorDeviceData parseData(DataInputStream d) throws ApplicationException;
	

}
