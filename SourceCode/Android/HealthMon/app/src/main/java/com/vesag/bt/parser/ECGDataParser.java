package com.vesag.bt.parser;

import com.vesag.bt.parser.beans.ECGDataPacket;
import com.vesag.bt.parser.beans.ECGNonRTSCPData;
import com.vesag.bt.parser.beans.ECGSCPData;
import com.vesag.bt.parser.beans.ECGSCPSec0;
import com.vesag.bt.parser.beans.ECGSCPSec1;
import com.vesag.bt.parser.beans.ECGSCPSec2;
import com.vesag.bt.parser.beans.ECGSCPSec3;
import com.vesag.bt.parser.beans.ECGSCPSec6;
import com.vesag.bt.parser.beans.ECGSCPSec9;
import com.vesag.bt.util.ApplicationException;

import org.apache.log4j.Logger;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class ECGDataParser {

	private static final Logger log = Logger.getLogger(ECGDataParser.class);
    
	public static List<ECGDataPacket> getECGParsedPackets(DataInputStream byteStream)throws ApplicationException
    {
		try {
			boolean eof = false;

			List<ECGDataPacket> ecgDataPacketList = new ArrayList<ECGDataPacket>();

			int length=0;
			int head=0;
			int token=0;
			int crc=0;

			while(!eof) {

				if (byteStream.available()==0) {
					eof = true;
				} else {
					try {
						ECGDataPacket ecgDataPacket = new ECGDataPacket();

						head= byteStream.readUnsignedByte();
						ecgDataPacket.setHead(head);

						token = byteStream.readUnsignedByte();
						ecgDataPacket.setToken(token);

						length = byteStream.readUnsignedByte();
						ecgDataPacket.setLength(length);

						byte[] data = new byte[length];
						byteStream.read(data);
						ecgDataPacket.setContent(data);

						crc = byteStream.readUnsignedByte();
						ecgDataPacket.setCrc(crc);

						ecgDataPacketList.add(ecgDataPacket);
					} catch(EOFException ex){
						log.info("EOF Exception");
					}
				}
			}
			return ecgDataPacketList;
		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		} 
	}

	public static ECGDataPacket getECGParsedPacket(DataInputStream byteStream)throws ApplicationException
    {
		try {
			boolean eof = false;
			int length=0;
			int head=0;
			int token=0;
			int crc=0;

			while(!eof) {

				if (byteStream.available()==0) {
					eof = true;
				}else{
					try{
						ECGDataPacket ecgDataPacket = new ECGDataPacket();

						head= byteStream.readUnsignedByte();
						ecgDataPacket.setHead(head);

						token = byteStream.readUnsignedByte();
						ecgDataPacket.setToken(token);

						length = byteStream.readUnsignedByte();
						ecgDataPacket.setLength(length);

						byte[] data = new byte[length];
						byteStream.read(data);
						ecgDataPacket.setContent(data);

						crc = byteStream.readUnsignedByte();
						ecgDataPacket.setCrc(crc);

						return ecgDataPacket;
					}catch(EOFException ex){
						log.info("EOF Exception");
					}
				}
			}
			return null;
		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		} 
	}
	
	public static ECGNonRTSCPData getECGNRTSectionPackets(FileInputStream fileInputStream)throws ApplicationException
    {
		boolean eof = false;
        
		ECGNonRTSCPData ecgData = new ECGNonRTSCPData();
        
		try{
			if(fileInputStream !=null){
				DataInputStream byteStream = new DataInputStream(fileInputStream);
				while(!eof) {

					if (byteStream.available()==0) {
						eof = true;
					}else{
						try{
							byte[] docArray = new byte[6];
							byteStream.read(docArray);
							ECGSCPData ecgSCPData = getdocData(docArray);

							//Section 0 Parsing
							byte[] sec0Array = new byte[76];
							byteStream.read(sec0Array);
							ECGSCPSec0 sec0 = getSec0Data(sec0Array);

							//Section 1 Parsing
							byte[] sec1Array = new byte[32];
							byteStream.read(sec1Array);
							ECGSCPSec1 sec1 = getSec1Data(sec1Array);

							//Section 2 Parsing
							byte[] sec2Array = new byte[30];
							byteStream.read(sec2Array);
							ECGSCPSec2 sec2 = getSec2Data(sec2Array);

							//Section 3 Parsing
							byte[] sec3Array = new byte[28];
							byteStream.read(sec3Array);
							ECGSCPSec3 sec3 = getSec3Data(sec3Array);

							//Section 6 Parsing
							byte[] sec6Array = new byte[9024];
							byteStream.read(sec6Array);
							ECGSCPSec6 sec6 = getSec6Data(sec6Array);

							//Section 9 Parsing
							byte[] sec9Array = new byte[600];
							byteStream.read(sec9Array);
							ECGSCPSec9 sec9 = getSec9Data(sec9Array);

							ecgData.setScpData(ecgSCPData);
							ecgData.setScpSec0(sec0);
							ecgData.setScpSec1(sec1);
							ecgData.setScpSec2(sec2);
							ecgData.setScpSec3(sec3);
							ecgData.setScpSec6(sec6);
							ecgData.setScpSec9(sec9);

						}catch(EOFException ex){
							log.info("EOF Exception");
						}
					}
				}
			}
			return ecgData;
		}catch(IOException e){
			throw new ApplicationException("Parsing failed");
		}
	}

	private static ECGSCPData getdocData(byte[] docArray) throws ApplicationException
    {
		ECGSCPData ecgSCPData = new ECGSCPData();

		InputStream is = new ByteArrayInputStream(docArray);

		try {
			byte[] docCRC = new byte[2];
			is.read(docCRC);
			ecgSCPData.setCrc(docCRC);

			byte[] docLength = new byte[4];
			is.read(docLength);
			ecgSCPData.setLength(docLength);
		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}

		return ecgSCPData;
	}

	private static ECGSCPSec0 getSec0Data(byte[] sec0Array) throws ApplicationException
    {
		ECGSCPSec0 sec0 = new ECGSCPSec0();

		ByteArrayInputStream byteStream = new ByteArrayInputStream(sec0Array);

		try {
			byte[] sec0CRC = new byte[2];
			byteStream.read(sec0CRC);
			sec0.setCrc(sec0CRC);

			byte[] sec0SectionId = new byte[2];
			byteStream.read(sec0SectionId);
			sec0.setSectionId(sec0SectionId);

			byte[] sec0SectionLength= new byte[4];
			byteStream.read(sec0SectionLength);
			sec0.setSectionLength(sec0SectionLength);

			byte sec0SectionVersion =(byte) byteStream.read();
			sec0.setSectionVersion(sec0SectionVersion);

			byte sec0ProtocolVersion =(byte) byteStream.read();
			sec0.setProtocolVersion(sec0ProtocolVersion);

			byte[] sec0ReservedBits = new byte[6];
			byteStream.read(sec0ReservedBits);
			sec0.setReservedBits(sec0ReservedBits);

			byte[] sectionId1= new byte[2];
			byteStream.read(sectionId1);
			sec0.setSectionId1(sectionId1);

			byte[] sectionLength1= new byte[4];
			byteStream.read(sectionLength1);
			sec0.setSectionLength1(sectionLength1);

			byte[] indexToSection1=new byte[4];
			byteStream.read(indexToSection1);
			sec0.setIndexToSection1(indexToSection1);

			byte[] sectionId2= new byte[2];
			byteStream.read(sectionId2);
			sec0.setSectionId2(sectionId2);

			byte[] sectionLength2= new byte[4];
			byteStream.read(sectionLength2);
			sec0.setSectionLength2(sectionLength2);

			byte[] indexToSection2=new byte[4];
			byteStream.read(indexToSection2);
			sec0.setIndexToSection2(indexToSection2);

			byte[] sectionId3= new byte[2];
			byteStream.read(sectionId3);
			sec0.setSectionId3(sectionId3);

			byte[] sectionLength3= new byte[4];
			byteStream.read(sectionLength3);
			sec0.setSectionLength3(sectionLength3);

			byte[] indexToSection3=new byte[4];
			byteStream.read(indexToSection3);
			sec0.setIndexToSection3(indexToSection3);

			byte[] sectionId4= new byte[2];
			byteStream.read(sectionId4);
			sec0.setSectionId4(sectionId4);

			byte[] sectionLength4= new byte[4];
			byteStream.read(sectionLength4);
			sec0.setSectionLength4(sectionLength4);

			byte[] indexToSection4=new byte[4];
			byteStream.read(indexToSection4);
			sec0.setIndexToSection4(indexToSection4);

			byte[] sectionId5= new byte[2];
			byteStream.read(sectionId5);
			sec0.setSectionId5(sectionId5);

			byte[] sectionLength5= new byte[4];
			byteStream.read(sectionLength5);
			sec0.setSectionLength5(sectionLength5);

			byte[] indexToSection5=new byte[4];
			byteStream.read(indexToSection5);
			sec0.setIndexToSection5(indexToSection5);

			byte[] sectionId6= new byte[2];
			byteStream.read(sectionId6);
			sec0.setSectionId6(sectionId6);

			byte[] sectionLength6= new byte[4];
			byteStream.read(sectionLength6);
			sec0.setSectionLength6(sectionLength6);

			byte[] indexToSection6=new byte[4];
			byteStream.read(indexToSection6);
			sec0.setIndexToSection6(indexToSection6);

			return sec0;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}

	private static ECGSCPSec1 getSec1Data(byte[] sec1Array) throws ApplicationException
    {
		ECGSCPSec1 sec1 = new ECGSCPSec1();
		ByteArrayInputStream byteStream = new ByteArrayInputStream(sec1Array);

		try {
			byte[] sec1CRC = new byte[2];
			byteStream.read(sec1CRC);
			sec1.setCrc(sec1CRC);

			byte[] sec1SectionId = new byte[2];
			byteStream.read(sec1SectionId);
			sec1.setSectionId(sec1SectionId);

			byte[] sec1SectionLength= new byte[4];
			byteStream.read(sec1SectionLength);
			sec1.setSectionLength(sec1SectionLength);

			byte sec1SectionVersion =(byte) byteStream.read();
			sec1.setSectionVersion(sec1SectionVersion);

			byte sec1ProtocolVersion =(byte) byteStream.read();
			sec1.setProtocolVersion(sec1ProtocolVersion);

			byte[] sec1ReservedBits = new byte[6];
			byteStream.read(sec1ReservedBits);
			sec1.setReservedBits(sec1ReservedBits);

			byte tag1 = (byte) byteStream.read();
			sec1.setTag1(tag1);

			byte[] length1 = new byte[2];
			byteStream.read(length1);
			sec1.setLength1(length1);

			byte[] value1 = new byte[4];
			byteStream.read(value1);
			sec1.setValue1(value1);

			byte tag2 = (byte) byteStream.read();
			sec1.setTag2(tag2);

			byte[] length2 =new byte[2];
			byteStream.read(length2);
			sec1.setLength2(length2);

			byte[] value2 = new byte[3];
			byteStream.read(value2);
			sec1.setValue2(value2);

			byte tag3 = (byte) byteStream.read();
			sec1.setTag3(tag3);

			byte[] length3 =new byte[2];
			byteStream.read(length3);
			sec1.setLength3(length3);
			return sec1;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}

	private static ECGSCPSec2 getSec2Data(byte[] sec2Array) throws ApplicationException{

		ECGSCPSec2 sec2 = new ECGSCPSec2();

		ByteArrayInputStream byteStream = new ByteArrayInputStream(sec2Array);

		try {
			byte[] sec2CRC = new byte[2];
			byteStream.read(sec2CRC);
			sec2.setCrc(sec2CRC);

			byte[] sec2SectionId = new byte[2];
			byteStream.read(sec2SectionId);
			sec2.setSectionId(sec2SectionId);

			byte[] sec2SectionLength= new byte[4];
			byteStream.read(sec2SectionLength);
			sec2.setSectionLength(sec2SectionLength);

			byte sec2SectionVersion =(byte) byteStream.read();
			sec2.setSectionVersion(sec2SectionVersion);

			byte sec2ProtocolVersion =(byte) byteStream.read();
			sec2.setProtocolVersion(sec2ProtocolVersion);

			byte[] sec2ReservedBits = new byte[6];
			byteStream.read(sec2ReservedBits);
			sec2.setReservedBits(sec2ReservedBits);

			byte[] amount = new byte[2];
			byteStream.read(amount);
			sec2.setAmount(amount);

			byte[] amtOfStructures = new byte[2];
			byteStream.read(amtOfStructures);
			sec2.setAmtOfStructures(amtOfStructures);

			byte prefixBits = (byte) byteStream.read();
			sec2.setPrefixBits(prefixBits);

			byte encodingBits= (byte) byteStream.read();
			sec2.setEncodingBits(encodingBits);

			byte tableType= (byte) byteStream.read();
			sec2.setTableType(tableType);

			byte[] baseValue  = new byte[2];
			byteStream.read(baseValue);
			sec2.setBaseValue(baseValue);

			byte[] baseValEncoding = new byte[4];
			byteStream.read(baseValEncoding);
			sec2.setBaseValEncoding(baseValEncoding);

			byte paddingByte =(byte) byteStream.read();
			sec2.setPaddingByte(paddingByte);

			return sec2;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}

	private static ECGSCPSec3 getSec3Data(byte[] sec3Array) throws ApplicationException{

		ECGSCPSec3 sec3 = new ECGSCPSec3();

		ByteArrayInputStream byteStream = new ByteArrayInputStream(sec3Array);

		try {
			byte[] sec3CRC = new byte[2];
			byteStream.read(sec3CRC);
			sec3.setCrc(sec3CRC);

			byte[] sec3SectionId = new byte[2];
			byteStream.read(sec3SectionId);
			sec3.setSectionId(sec3SectionId);

			byte[] sec3SectionLength= new byte[4];
			byteStream.read(sec3SectionLength);
			sec3.setSectionLength(sec3SectionLength);

			byte sec3SectionVersion =(byte) byteStream.read();
			sec3.setSectionVersion(sec3SectionVersion);

			byte sec3ProtocolVersion =(byte) byteStream.read();
			sec3.setProtocolVersion(sec3ProtocolVersion);

			byte[] sec3ReservedBits = new byte[6];
			byteStream.read(sec3ReservedBits);
			sec3.setReservedBits(sec3ReservedBits);

			byte sec3amount = (byte) byteStream.read();
			sec3.setAmount(sec3amount);

			byte leadConfiguration = (byte) byteStream.read();
			sec3.setLeadConfiguration(leadConfiguration);

			byte[] startingSample= new byte[4];
			byteStream.read(startingSample);
			sec3.setStartingSample(startingSample);

			byte[] endingSample=new byte[4];
			byteStream.read(endingSample);
			sec3.setEndingSample(endingSample);

			byte leadId = (byte) byteStream.read();
			sec3.setLeadId(leadId);

			byte sec3paddingByte= (byte) byteStream.read();
			sec3.setPaddingByte(sec3paddingByte);

			return sec3;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}

	private static ECGSCPSec6 getSec6Data(byte[] sec6Array) throws ApplicationException{

		ECGSCPSec6 sec6 = new ECGSCPSec6();

		ByteArrayInputStream byteStream = new ByteArrayInputStream(sec6Array);

		try {
			byte[] sec6CRC = new byte[2];
			byteStream.read(sec6CRC);
			sec6.setCrc(sec6CRC);

			byte[] sec6SectionId = new byte[2];
			byteStream.read(sec6SectionId);
			sec6.setSectionId(sec6SectionId);

			byte[] sec6SectionLength= new byte[4];
			byteStream.read(sec6SectionLength);
			sec6.setSectionLength(sec6SectionLength);

			byte sec6SectionVersion =(byte) byteStream.read();
			sec6.setSectionVersion(sec6SectionVersion);

			byte sec6ProtocolVersion =(byte) byteStream.read();
			sec6.setProtocolVersion(sec6ProtocolVersion);

			byte[] sec6ReservedBits = new byte[6];
			byteStream.read(sec6ReservedBits);
			sec6.setReservedBits(sec6ReservedBits);

			byte[] avm = new byte[2];
			byteStream.read(avm);
			sec6.setAvm(avm);

			byte[] samplingInterval =new byte[2];
			byteStream.read(samplingInterval);
			sec6.setSamplingInterval(samplingInterval);

			byte diffUsed= (byte) byteStream.read();
			sec6.setDiffUsed(diffUsed);

			byte biomodal= (byte) byteStream.read();
			sec6.setBiomodal(biomodal);

			byte[] leadLength = new byte[2];
			byteStream.read(leadLength);
			sec6.setLeadLength(leadLength);

			byte[] dataBlock = new byte[9000];
			byteStream.read(dataBlock);
			sec6.setDataBlock(dataBlock);

			return sec6;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}

	private static ECGSCPSec9 getSec9Data(byte[] sec9Array) throws ApplicationException{

		ECGSCPSec9 sec9 = new ECGSCPSec9();

		ByteArrayInputStream byteStream = new ByteArrayInputStream(sec9Array);

		try {
			byte[] sec9CRC = new byte[2];
			byteStream.read(sec9CRC);
			sec9.setCrc(sec9CRC);

			byte[] sec9SectionId = new byte[2];
			byteStream.read(sec9SectionId);
			sec9.setSectionId(sec9SectionId);

			byte[] sec9SectionLength= new byte[4];
			byteStream.read(sec9SectionLength);
			sec9.setSectionLength(sec9SectionLength);

			byte sec9SectionVersion =(byte) byteStream.read();
			sec9.setSectionVersion(sec9SectionVersion);

			byte sec9ProtocolVersion =(byte) byteStream.read();
			sec9.setProtocolVersion(sec9ProtocolVersion);

			byte[] sec9ReservedBits = new byte[6];
			byteStream.read(sec9ReservedBits);
			sec9.setReservedBits(sec9ReservedBits);

			byte tagNumber1=(byte) byteStream.read();
			sec9.setTagNumber1(tagNumber1);

			byte[] contentLength1 = new byte[2];
			byteStream.read(contentLength1);
			sec9.setContentLength1(contentLength1);

			byte[] content1 = new byte[2];
			byteStream.read(content1);
			sec9.setContent1(content1);

			byte tagNumber2=(byte) byteStream.read();
			sec9.setTagNumber2(tagNumber2);

			byte[] contentLength2 = new byte[2];
			byteStream.read(contentLength2);
			sec9.setContentLength2(contentLength2);

			byte[] content2 = new byte[1];
			byteStream.read(content2);
			sec9.setContent2(content2);

			byte tagNumber3=(byte) byteStream.read();
			sec9.setTagNumber3(tagNumber3);

			byte[] contentLength3 = new byte[2];
			byteStream.read(contentLength3);
			sec9.setContentLength3(contentLength3);

			byte[] content3 = new byte[1];
			byteStream.read(content3);
			sec9.setContent3(content3);

			byte tagNumber4=(byte) byteStream.read();
			sec9.setTagNumber4(tagNumber4);

			byte[] contentLength4 = new byte[2];
			byteStream.read(contentLength4);
			sec9.setContentLength4(contentLength4);

			byte[] content4 = new byte[1];
			byteStream.read(content4);
			sec9.setContent4(content4);

			byte tagNumber5=(byte) byteStream.read();
			sec9.setTagNumber5(tagNumber5);

			byte[] contentLength5 = new byte[2];
			byteStream.read(contentLength5);
			sec9.setContentLength5(contentLength5);

			byte[] content5 = new byte[6];
			byteStream.read(content5);
			sec9.setContent5(content5);

			byte tagNumber6=(byte) byteStream.read();
			sec9.setTagNumber6(tagNumber6);

			byte[] contentLength6 = new byte[2];
			byteStream.read(contentLength6);
			sec9.setContentLength6(contentLength6);

			byte[] content6 = new byte[2];
			byteStream.read(content6);
			sec9.setContent6(content6);

			byte tagNumber7=(byte) byteStream.read();
			sec9.setTagNumber7(tagNumber7);

			byte[] contentLength7 = new byte[2];
			byteStream.read(contentLength7);
			sec9.setContentLength7(contentLength7);

			byte[] content7 = new byte[34];
			byteStream.read(content7);
			sec9.setContent7(content7);

			byte tagNumber8=(byte) byteStream.read();
			sec9.setTagNumber8(tagNumber8);

			byte[] contentLength8 = new byte[2];
			byteStream.read(contentLength8);
			sec9.setContentLength8(contentLength8);

			byte[] content8 = new byte[1];
			byteStream.read(content8);
			sec9.setContent8(content8);

			byte[] analysisDetails=new byte[512];
			byteStream.read(analysisDetails);
			sec9.setAnalysisDetails(analysisDetails);

			return sec9;

		} catch (IOException e) {
			throw new ApplicationException("Parsing failed");
		}
	}

}
