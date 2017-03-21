package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.PulseOXPacketParameter;
import com.vesag.bt.parser.PulseOximeterParser;
import com.vesag.bt.parser.beans.PulseOXDataPacket;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.CRC8Check;
import com.vesag.bt.util.bt_util_Constants;

import org.apache.log4j.Logger;

import java.io.DataInputStream;
import java.util.ArrayList;
import java.util.List;

//import com.vesag.bt.dao.BTDeviceDataDAO;

public class PulseOximeterParameterService implements DeviceDataParser{
	/*This method parses the data from byteStream into a predefined Data
	Structure pulseOximeterData*/
	
	private static final Logger log = Logger.getLogger(PulseOximeterParameterService.class);
	public ClinicalMonitorDeviceData parseData(DataInputStream byteStream) throws ApplicationException{
		PulseOXPacketParameterList pulseOXPacketParameterList = null;
		CRC8Check util = new CRC8Check();
		List<PulseOXPacketParameter> parameterPacketList = new ArrayList<PulseOXPacketParameter>();

		List<PulseOXDataPacket> parsedPacketsList = PulseOximeterParser.getPulseOXParsedParameterPackets(byteStream);

		for(PulseOXDataPacket pulseOXDataPacket : parsedPacketsList){
			if(util.checkPulseOXPacketCRC(pulseOXDataPacket)){

				PulseOXPacketParameter parameterPacket = new PulseOXPacketParameter();
				parameterPacket.setPacketType(bt_util_Constants.PARAMETER_TYPE);
				parameterPacket.setHead1("0x"+ String.format("%02X", pulseOXDataPacket.getHead1()));
				parameterPacket.setHead2("0x"+ String.format("%02X", pulseOXDataPacket.getHead2()));
				parameterPacket.setToken("0x"+ String.format("%02X", pulseOXDataPacket.getToken()));
				parameterPacket.setLength( pulseOXDataPacket.getLength());
				parameterPacket.setType(checkType(pulseOXDataPacket.getLength()));
				for(byte byteValue : pulseOXDataPacket.getContent()){
					parameterPacket.getContentList().add(String.format("%02X", byteValue & 0xFF));
				}
				parameterPacket.setCrc(String.format("%02X", pulseOXDataPacket.getCrc()));
				parameterPacket = addParameterData(parameterPacket);
				parameterPacket.setCrcCheck(1);
				parameterPacketList.add(parameterPacket);

			}
		}
		pulseOXPacketParameterList = new PulseOXPacketParameterList(parameterPacketList);
		return pulseOXPacketParameterList;
	}
	//This method checks the type of datapacket (config/data)
	private String checkType(int length){
		String type="";

		if(length==3){
			type=bt_util_Constants.CONFIG_TYPE;
		}else{
			type=bt_util_Constants.DATA_TYPE;
		}
		return type;
	}

	//This method passes the config and data packets for processing
	private PulseOXPacketParameter addParameterData(PulseOXPacketParameter parameterPacket){
		PulseOXPacketParameter parameterPacket1 = null;

		if(parameterPacket.getLength()==3){
			parameterPacket1 = addConfigPacketData(parameterPacket);
		}else{
			parameterPacket1 = addDataPacketData(parameterPacket);
		}
		return parameterPacket1;
	}

	//This method processes the data packets
	private PulseOXPacketParameter addDataPacketData(PulseOXPacketParameter parameterPacket){
		parameterPacket.setDataType("0x"+parameterPacket.getContentList().get(0));
		int data1 = Integer.parseInt(parameterPacket.getContentList().get(1), 16);
		parameterPacket.setSpO2(data1);
		int data2 = Integer.parseInt(parameterPacket.getContentList().get(2), 16);
		int data3 = Integer.parseInt(parameterPacket.getContentList().get(3), 16);
		StringBuffer sb = new StringBuffer();
		sb.append(String.format("%8s", Integer.toBinaryString(data3)).replace(' ', '0'));
		sb.append(String.format("%8s", Integer.toBinaryString(data2)).replace(' ', '0'));
		parameterPacket.setPulseRate(Integer.parseInt(sb.toString(), 2));
		int data4 = Integer.parseInt(parameterPacket.getContentList().get(4), 16);
		parameterPacket.setPerfusionIndex(data4);
		int data5 = Integer.parseInt(parameterPacket.getContentList().get(5), 16);
		parameterPacket.setStatus1(data5);
		int data6 = Integer.parseInt(parameterPacket.getContentList().get(6), 16);
		parameterPacket.setStatus2(data6);

		return parameterPacket;
	}

	//This method processes the config packet
	private PulseOXPacketParameter addConfigPacketData(PulseOXPacketParameter parameterPacket){
		parameterPacket.setDataType("0x"+parameterPacket.getContentList().get(0));
		int sendingRate = Integer.parseInt(parameterPacket.getContentList().get(1), 16);
		parameterPacket.setSendingRate(sendingRate);

		return parameterPacket;
	}



}
