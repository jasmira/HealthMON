package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.PulseOXPacketWaveform;
import com.vesag.bt.parser.PulseOximeterParser;
import com.vesag.bt.parser.beans.PulseOXDataPacket;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.CRC8Check;
import com.vesag.bt.util.bt_util_Constants;

import org.apache.log4j.Logger;

import java.io.DataInputStream;
//import com.vesag.bt.dao.BTDeviceDataDAO;

public class PulseOximeterWaveformService implements DeviceDataParser{
	
	private static final Logger log = Logger.getLogger(PulseOximeterWaveformService.class);
	/*This method parses the data from byteStream into a predefined Data
	Structure pulseOximeterData*/
	public ClinicalMonitorDeviceData parseData(DataInputStream byteStream)throws ApplicationException{
		PulseOXPacketWaveformList pulseOXPacketWaveformList = null;
		CRC8Check util = new CRC8Check();
		//BTDeviceDataDAO btService = new BTDeviceDataDAO();
//		List<PulseOXPacketWaveform> waveFormPacketList = new ArrayList<PulseOXPacketWaveform>();

		PulseOXDataPacket parsedPacket = PulseOximeterParser.getPulseOXParsedWaveformPackets(byteStream);


		if(parsedPacket != null){
			if(util.checkPulseOXPacketCRC(parsedPacket)){

				PulseOXPacketWaveform waveFormPacket = new PulseOXPacketWaveform();
				waveFormPacket.setPacketType(bt_util_Constants.WAVEFORM_TYPE);
				waveFormPacket.setHead1("0x"+ String.format("%02X", parsedPacket.getHead1()));
				waveFormPacket.setHead2("0x"+ String.format("%02X", parsedPacket.getHead2()));
				waveFormPacket.setToken("0x"+ String.format("%02X", parsedPacket.getToken()));
				waveFormPacket.setLength( parsedPacket.getLength());
				waveFormPacket.setType(checkType(parsedPacket.getLength()));
				for(byte byteValue : parsedPacket.getContent()){
					waveFormPacket.getContentList().add(String.format("%02X", byteValue & 0xFF));
				}
				waveFormPacket.setCrc(String.format("%02X", parsedPacket.getCrc()));
				waveFormPacket = addWaveformData(waveFormPacket);
				waveFormPacket.setCrcCheck(1);
				if(waveFormPacket.getType().equalsIgnoreCase(bt_util_Constants.DATA_TYPE))
					return waveFormPacket;
				else
					return null;
			}/*else{
				throw new ApplicationException("Wrong CRC packet");
			}*/


		}
		return null;
	}
	
	//This method checks the type of datapacket (config/data)
	private String checkType(int length){
		String type="";
		if(length==7){
			type=bt_util_Constants.DATA_TYPE;
			
		}else{
			type=bt_util_Constants.CONFIG_TYPE;
		}
		
		return type;
	}
	
	//This method passes the config and data packets for processing
	private PulseOXPacketWaveform addWaveformData(PulseOXPacketWaveform wavePacket){
		PulseOXPacketWaveform wavePacket1= null;
		if(wavePacket.getLength()==7){
			wavePacket1 = addDataPacketData(wavePacket);
			
		}else /*if(wavePacket.getLength()==3)*/{
			wavePacket1 = addConfigPacketData(wavePacket);
		}
		return wavePacket1;
	}
	
	//This method processes the data packets
	private PulseOXPacketWaveform addDataPacketData(PulseOXPacketWaveform wavePacket){
		wavePacket.setDataType("0x"+wavePacket.getContentList().get(0));
		int data = Integer.parseInt(wavePacket.getContentList().get(1), 16);
		String binaryData = null;
		binaryData = String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0');
		wavePacket.setData1PB(Integer.parseInt(binaryData.substring(0, 1)));
		wavePacket.setData1WF(Integer.parseInt(binaryData.substring(1), 2));
		
	    data = Integer.parseInt(wavePacket.getContentList().get(2), 16);
		binaryData = String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0');
		wavePacket.setData2PB(Integer.parseInt(binaryData.substring(0, 1)));
		wavePacket.setData2WF(Integer.parseInt(binaryData.substring(1), 2));
		
		data = Integer.parseInt(wavePacket.getContentList().get(3), 16);
		binaryData = String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0');
		wavePacket.setData3PB(Integer.parseInt(binaryData.substring(0, 1)));
		wavePacket.setData3WF(Integer.parseInt(binaryData.substring(1), 2));
		
		data = Integer.parseInt(wavePacket.getContentList().get(4), 16);
		binaryData = String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0');
		wavePacket.setData4PB(Integer.parseInt(binaryData.substring(0, 1)));
		wavePacket.setData4WF(Integer.parseInt(binaryData.substring(1), 2));
		
		data = Integer.parseInt(wavePacket.getContentList().get(5), 16);
		binaryData = String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0');
		wavePacket.setData5PB(Integer.parseInt(binaryData.substring(0, 1)));
		wavePacket.setData5WF(Integer.parseInt(binaryData.substring(1), 2));
		
		return wavePacket;
	}
	
	//This method processes the config packet
	private PulseOXPacketWaveform addConfigPacketData(PulseOXPacketWaveform wavePacket){
		wavePacket.setDataType("0x"+wavePacket.getContentList().get(0));
		int sendingRate = Integer.parseInt(wavePacket.getContentList().get(1), 16);
		wavePacket.setSendingRate(sendingRate);
		
		return wavePacket;
	}

}
