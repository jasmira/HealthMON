package com.vesag.bt.service;

import android.content.Context;

import com.persistent.healthmon.app.HealthMonApp;
import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.ECGNonRTSCPDataBean;
import com.vesag.bt.parser.ECGDataParser;
import com.vesag.bt.parser.beans.ECGDataPacket;
import com.vesag.bt.parser.beans.ECGNonRTSCPData;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.CRC16Check;
import com.vesag.bt.util.CRC8Check;
import com.vesag.bt.util.ECGDataProcessing;
import com.vesag.bt.util.bt_util_Constants;

import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
//import java.io.File;

public class ECGNonRealTimeService implements DeviceDataParser{
	
	private static final Logger log = Logger.getLogger(ECGNonRealTimeService.class);
	/*This method parses the data from byteStream into a predefined Data
	Structure ECGDataPacket*/
	public ClinicalMonitorDeviceData parseData(DataInputStream byteStream) throws ApplicationException {

			CRC8Check util = new CRC8Check();
			List<ECGDataPacket> parsedPacketsList = ECGDataParser.getECGParsedPackets(byteStream);
			for(ECGDataPacket packet : parsedPacketsList){
				if(!util.checkECGPacketCRC(packet)){
					throw new ApplicationException("CRC check failed");
				}
			}
			
			List<Byte> contentList = new ArrayList<Byte>();
			for(ECGDataPacket packet : parsedPacketsList){
			 if( String.format("%02X", packet.getToken()).equalsIgnoreCase(bt_util_Constants.ECG_DATA_TOKEN) ){
				 try{
						List<Byte> lList = Arrays.asList(ArrayUtils.toObject(packet.getContent()));
						contentList.addAll(lList.subList(1, lList.size()));
						}catch (Exception e){
							e.printStackTrace();
							e.getMessage();
						}
						
					}
			 
			}
			if(contentList.size() !=0){

				ECGNonRTSCPDataBean ecgBean = generateDataBlockFile(contentList);
			if(ecgBean!=null){
				return ecgBean;
			}else{
				throw new ApplicationException("CRC check for Data block file failed");//show toast
			}
			}
			//return null;
			return null;
	}
	
	//This method generates a file by writing bytes from data block of each packet
	private String mFileName = "ECGFile.dat";
	private Context mContext = HealthMonApp.getContext();
	
	private ECGNonRTSCPDataBean generateDataBlockFile(List<Byte> contentList) throws ApplicationException{
		 
		FileOutputStream outputStream;
		try {
				outputStream = mContext.openFileOutput(mFileName, Context.MODE_PRIVATE);
				DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
                for(byte b : contentList ){
                    dataOutputStream.write(b);
                }
                dataOutputStream.flush();
            } 
            catch (IOException e) {
			e.printStackTrace();
			throw new ApplicationException("Data block file creation failed");
		}
		
		ECGNonRTSCPDataBean ecgBean = parseDataBlock();
		return ecgBean;
	}
	
	/*This method parses the data from byteStream into a predefined Data
	Structure ECGNonRTSCPData*/
	private ECGNonRTSCPDataBean parseDataBlock() throws ApplicationException {

		CRC16Check util = new CRC16Check();
		ECGDataProcessing ecgProcess = new ECGDataProcessing();
		FileInputStream fileInputStream = null;
		try {
			fileInputStream = mContext.openFileInput(mFileName);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ECGNonRTSCPData ecgData = ECGDataParser.getECGNRTSectionPackets(fileInputStream);
			boolean crccheck = util.checkDocCRC(ecgData);
			ECGNonRTSCPDataBean ecgBean = null;
			if(crccheck){
				ecgBean = ecgProcess.processECGSCPData(ecgData);
			}
		return ecgBean;
	}

	
}
