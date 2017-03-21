package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.ECGDataRealtime;
import com.vesag.bt.parser.ECGDataParser;
import com.vesag.bt.parser.beans.ECGDataPacket;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.CRC8Check;
import com.vesag.bt.util.bt_util_Constants;

import java.io.DataInputStream;
import java.util.ArrayList;
import java.util.List;

//import com.vesag.bt.dao.BTDeviceDataDAO;

public class ECGRealTimeService implements DeviceDataParser 
{
	List<ECGDataRealtime> packetList = new ArrayList<ECGDataRealtime>();
	public ClinicalMonitorDeviceData parseData(DataInputStream byteStream) throws ApplicationException {

		CRC8Check util = new CRC8Check();
		ECGRealtimePacketList ecgRealtimePacketList = null;
		
		ECGDataPacket packet = ECGDataParser.getECGParsedPacket(byteStream);
		if(packet != null){
			if(util.checkECGPacketCRC(packet)){
				ECGDataRealtime ecgPacket = new ECGDataRealtime();
				ecgPacket.setHead(String.format("%02X", packet.getHead()));
				ecgPacket.setToken(String.format("%02X", packet.getToken()));
				ecgPacket.setType(checkType(ecgPacket.getToken()));
				ecgPacket.setLength( packet.getLength());
				for(byte b : packet.getContent()){
					ecgPacket.getContentList().add(String.format("%02X", b & 0xFF));
				}
				ecgPacket.setCrc(String.format("%02X", packet.getCrc()));
				ecgPacket = addData(ecgPacket);
				if (ecgPacket.getType().equalsIgnoreCase("config")){
					return ecgPacket;
				}
				if (ecgPacket.getType().equalsIgnoreCase("Data")){
					return ecgPacket;
				}
			}
				return null;
		}
		
		return null;
	}

	//This method checks the type of datapacket(config/data)
	private String checkType(String token){
		String type="";
		if(token.equalsIgnoreCase(bt_util_Constants.ECG_CONFIG_TOKEN)){
			type=bt_util_Constants.CONFIG_TYPE;
		}else{
			type=bt_util_Constants.DATA_TYPE;
		}

		return type;
	}

	//This method processes the config and data packets
	private ECGDataRealtime addData(ECGDataRealtime packet){
		String packetType="";
		if(packet.getType().equalsIgnoreCase("config")){
			packet.setDeviceModel(packet.getContentList().get(0));
			packet.setTranmissionType(packet.getContentList().get(1));
			if(packet.getContentList().get(1).equalsIgnoreCase("00")){
				packetType=bt_util_Constants.REALTIME_TYPE;
			}else{
				packetType=bt_util_Constants.NONREALTIME_TYPE;
			}
			StringBuffer sb = new StringBuffer();
			for(int i = packet.getContentList().size()-1; i>=2; i--){
				sb.append(packet.getContentList().get(i));
			}
			packet.setDeviceId(sb.toString());
		}else{
			if(packet.getLength()== 54){
				packet.setSeqNo(Integer.parseInt(packet.getContentList().get(0), 16));
				ArrayList<Integer> wavePoints = new ArrayList<Integer>();
				for(int i=1 ; i<=50; i++){
					int data1 = Integer.parseInt(packet.getContentList().get(i + 1), 16);
					int data2 = Integer.parseInt(packet.getContentList().get(i), 16);
					i++;
					StringBuffer sb = new StringBuffer();
					sb.append(String.format("%8s", Integer.toBinaryString(data1)).replace(' ', '0'));
					sb.append(String.format("%8s", Integer.toBinaryString(data2)).replace(' ', '0'));
					wavePoints.add(Integer.parseInt(sb.toString(), 2));
				}
				packet.setWavePoints(wavePoints);
				packet.setHeartRate(Integer.parseInt(packet.getContentList().get(51), 16));
				int data1 = Integer.parseInt(packet.getContentList().get(52), 16);
				int data2 = Integer.parseInt(packet.getContentList().get(53), 16);
				StringBuffer sb = new StringBuffer();
				sb.append(String.format("%8s", Integer.toBinaryString(data2)).replace(' ', '0'));
				sb.append(String.format("%8s", Integer.toBinaryString(data1)).replace(' ', '0'));
				packet.setLeadStatus(Integer.parseInt(sb.substring(0, 1), 2));
				packet.setBatteryVolt(Integer.parseInt(sb.substring(1), 2));
			}
		}
		packet.setPacketType(packetType);
		return packet;
	}



}
