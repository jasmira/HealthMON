package com.vesag.bt.parser;

import com.vesag.bt.beans.BPMHistoryData;
import com.vesag.bt.beans.BPMRealTimeData;
import com.vesag.bt.util.ApplicationException;

import org.apache.log4j.Logger;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class BPMDataParser {
	private static final Logger log = Logger.getLogger(BPMDataParser.class);
	public static List<BPMHistoryData> getBPMHistoryParsedPackets(DataInputStream byteStream)throws ApplicationException{

		try {
			boolean eof = false;
			List<BPMHistoryData> bpmList = new ArrayList<BPMHistoryData>();
			while(!eof) {
				if (byteStream.available()==0) {
					eof = true;
				}else{
					try{

						byte[] array = new byte[26];
						byteStream.read(array);
						BPMHistoryData bpmDataPacket = getPrasedPacket(array);

						if(!(bpmDataPacket.getId() == 238 && bpmDataPacket.getYear() == 238 && bpmDataPacket.getMonth()==238)){
							bpmList.add(bpmDataPacket);
						}
					}catch(EOFException ex){
						log.info("EOF exception");
					}

				}

			}

			return bpmList;
		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		} 
	}

	private static BPMHistoryData getPrasedPacket(byte[] array){

		BPMHistoryData bpmDataPacket = new BPMHistoryData();

		bpmDataPacket.setId(array[3] & 0xff);
		bpmDataPacket.setYear(array[5] & 0xff);
		bpmDataPacket.setMonth(array[7]  & 0xff);
		bpmDataPacket.setDay(array[9] & 0xff);
		bpmDataPacket.setHour(array[11] & 0xff);
		bpmDataPacket.setMinute(array[13] & 0xff);
		bpmDataPacket.setSystolic(array[15] & 0xff);
		bpmDataPacket.setDiastolic(array[17] & 0xff);
		bpmDataPacket.setPulse(array[19] & 0xff);

		return bpmDataPacket;

	}


	public static BPMRealTimeData getBPMRealTimeParsedPacket(DataInputStream byteStream)throws ApplicationException{

		byte[] buffer;
		try {

			buffer = toByteArrayUsingJava(byteStream);
			int i=0, count = 0;
			try{
				
				while( i <buffer.length){

					if((buffer[i] == (byte)0x01) && (buffer[i+1] == (byte)0x02) && (buffer[i+2] == (byte) 0xff)){
						break;
					}
					count++;
					i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}

			BPMRealTimeData bpmBean = new BPMRealTimeData();
			bpmBean.setSystolic(buffer[count + 3] & 0xff);
			bpmBean.setDiastolic(buffer[count + 4] & 0xff);
			bpmBean.setPulse(buffer[count + 5] & 0xff);

			return bpmBean;

		} catch (IOException e) {
			e.printStackTrace();
			throw new ApplicationException("Parsing failed");
		}
	}
	public static byte[] toByteArrayUsingJava(InputStream is) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int reads = is.read();
		while(reads != -1)
		{ 	
			if(reads == 255){
				endCount++;
			}else{
				endCount = 0;
			}
			if(endCount>10){
				endCount = 0;
				baos.write(reads);
				break;
			}

			baos.write(reads); 
			reads = is.read(); 

		} 
		return baos.toByteArray(); 
	}
	private static int endCount = 0;
	
}
