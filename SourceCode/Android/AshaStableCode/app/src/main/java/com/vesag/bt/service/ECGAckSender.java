package com.vesag.bt.service;

import com.vesag.bt.beans.ECGAckPacket;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.CRC8Check;

public class ECGAckSender {
	

	public static ECGAckPacket getAckPacket(String packetType) throws ApplicationException{
		CRC8Check util = new CRC8Check();
		ECGAckPacket packet = new ECGAckPacket();
		packet.setHead((byte)0xa5);
		packet.setToken((byte)0x55);
		packet.setLength((byte)0x01);
		if(packetType.equalsIgnoreCase("Acknowledge")){
			packet.setData((byte)0x00);
		}else if(packetType.equalsIgnoreCase("NotAcknowledge")){
			packet.setData((byte)0x01);
		}else if(packetType.equalsIgnoreCase("Reject")){
			packet.setData((byte)0x02);
		}
		packet.setCrc(util.getECGAckPacketCRC(packet));

		return packet;
	}
}
