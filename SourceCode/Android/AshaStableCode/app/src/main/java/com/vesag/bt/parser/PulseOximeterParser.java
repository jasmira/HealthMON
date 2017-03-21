package com.vesag.bt.parser;

import com.vesag.bt.parser.beans.PulseOXDataPacket;
import com.vesag.bt.util.ApplicationException;

import org.apache.log4j.Logger;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PulseOximeterParser {

	private static final Logger log = Logger.getLogger(PulseOximeterParser.class);
	public static PulseOXDataPacket getPulseOXParsedWaveformPackets(DataInputStream byteStream)throws ApplicationException{

		try {
			boolean eof = false;

			int length=0;
			int head1=0;
			int head2=0;
			int token=0;
			int crc=0;

			while(!eof) {

				if (byteStream.available()==0) {
					eof = true;
				}else{

					try{
						PulseOXDataPacket pulseOXDataPacket = new PulseOXDataPacket();
						
						head1= byteStream.readUnsignedByte();
						pulseOXDataPacket.setHead1(head1);
						
						head2= byteStream.readUnsignedByte();
						pulseOXDataPacket.setHead2(head2);
						
						token = byteStream.readUnsignedByte();
						pulseOXDataPacket.setToken(token);
						
						length = byteStream.readUnsignedByte();
						pulseOXDataPacket.setLength(length);

						byte[] data = new byte[length-1];
						byteStream.read(data);
						pulseOXDataPacket.setContent(data);

						crc = byteStream.readUnsignedByte();
						pulseOXDataPacket.setCrc(crc);
						
						return pulseOXDataPacket;
					}catch(EOFException ex){
						log.info("EOF exception");
					}

				}

			}

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
		return null; 
	}
	
	public static List<PulseOXDataPacket> getPulseOXParsedParameterPackets(DataInputStream byteStream)throws ApplicationException{

		List<PulseOXDataPacket> parsedPacketsList = new ArrayList<PulseOXDataPacket>();
		try {
			boolean eof = false;

			int length=0;
			int head1=0;
			int head2=0;
			int token=0;
			int crc=0;

			while(!eof) {

				if (byteStream.available()==0) {
					eof = true;
				}else{

					try{
						PulseOXDataPacket pulseOXDataPacket = new PulseOXDataPacket();
						
						head1= byteStream.readUnsignedByte();
						pulseOXDataPacket.setHead1(head1);
						
						head2= byteStream.readUnsignedByte();
						pulseOXDataPacket.setHead2(head2);
						
						token = byteStream.readUnsignedByte();
						pulseOXDataPacket.setToken(token);
						
						length = byteStream.readUnsignedByte();
						pulseOXDataPacket.setLength(length);

						byte[] data = new byte[length-1];
						byteStream.read(data);
						pulseOXDataPacket.setContent(data);

						crc = byteStream.readUnsignedByte();
						pulseOXDataPacket.setCrc(crc);
						parsedPacketsList.add(pulseOXDataPacket);
					}catch(EOFException ex){
						log.info("EOF exception");
					}

				}

			}
			return parsedPacketsList;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}
	private int maxReadings = 0;

}
