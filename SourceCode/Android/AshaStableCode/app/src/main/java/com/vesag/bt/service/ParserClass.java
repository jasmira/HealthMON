package com.vesag.bt.service;


import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.util.ApplicationException;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

//import org.apache.log4j.Logger;

//As of now this is Main Class
//Once the App will call this API, this class will be changed to BTDeviceParser 
public class ParserClass {
	
		//As of now this is a main method
	    //Once the App will call this API, this method we be changed to getDeviceInfo()
	
		//this method will take the deviceName, dataType and inputstream and pass these information to startParsing() method
	
//		private static final Logger log = Logger.getLogger(MainClass.class);
		public static void main(String[] args) {
			//String deviceName = "Pulse Oximeter";
			//String dataType= "Parameter";
			//String file = "PulseOx_data.dat";
			
			//String deviceName = "Pulse Oximeter";
			//String dataType= "Waveform";
			//String file = "PulseOx_data_plethysmogram.dat";
			
			//String deviceName = "ECG";
			//String dataType = "RealTime";
			//String file = "ECG_data_RT.dat";
			
			//String deviceName = "ECG";
			//String dataType= "NonRealTime";
			//String file = "ECGNonRealtime_data.dat";
			
			//String deviceName = "BPM";
			//String dataType= "RealTime";
			//String file = "BPM_data.dat";
			
			String deviceName = "BPM";
			String dataType= "NonRealTime";
			String file = "BPM_data_history.dat";
			DataInputStream byteStream = null;
			try {
				byteStream = new DataInputStream(new FileInputStream("src/com/vesag/bt/devices/files/"+file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			startParsing(deviceName,dataType,byteStream);
		}
		

		public static ClinicalMonitorDeviceData startParsing(String deviceName,String dataType, DataInputStream byteStream) {
			ClinicalMonitorDeviceData data = null;
			DataParser dataParser = null;
			if(deviceName.equalsIgnoreCase("Pulse Oximeter") && dataType.equalsIgnoreCase("Parameter")){
				dataParser = new DataParser(new PulseOximeterParameterService());
			}else if(deviceName.equalsIgnoreCase("Pulse Oximeter")&& dataType.equalsIgnoreCase("Waveform")){
				dataParser = new DataParser(new PulseOximeterWaveformService());
			}else if(deviceName.equalsIgnoreCase("ECG") && dataType.equalsIgnoreCase("RealTime")){
				dataParser = new DataParser(new ECGRealTimeService());
			}else if(deviceName.equalsIgnoreCase("ECG") && dataType.equalsIgnoreCase("NonRealTime")){
				dataParser = new DataParser(new ECGNonRealTimeService());
			}else if(deviceName.equalsIgnoreCase("BPM") && dataType.equalsIgnoreCase("NonRealTime")){
				dataParser = new DataParser(new BPMHistoryDataService());
			}else if(deviceName.equalsIgnoreCase("BPM") && dataType.equalsIgnoreCase("RealTime")){
				dataParser = new DataParser(new BPMRealtimeDataService());
			}
			
			try {
				data = dataParser.getParsingStarted(byteStream);
			} catch (ApplicationException e) {
				//log.info(e.getMessage());
				e.printStackTrace();
			}
			return data;
			
		}
}
