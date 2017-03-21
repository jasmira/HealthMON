package com.vesag.bt.util;

import com.vesag.bt.parser.beans.ECGNonRTSCPData;
import com.vesag.bt.parser.beans.ECGSCPSec0;
import com.vesag.bt.parser.beans.ECGSCPSec1;
import com.vesag.bt.parser.beans.ECGSCPSec2;
import com.vesag.bt.parser.beans.ECGSCPSec3;
import com.vesag.bt.parser.beans.ECGSCPSec6;
import com.vesag.bt.parser.beans.ECGSCPSec9;

import org.apache.commons.lang.ArrayUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CRC16Check {
	
	//Calculates 16Bit CRC
	public String check16BitCRC(List<Byte> list){
		
		int crc = 0xFFFF;          // initial value
	    int polynomial = 0x1021;   // 0001 0000 0010 0001  (0, 5, 12) 

	    for (byte b : list) {
	        for (int i = 0; i < 8; i++) {
	            boolean bit = ((b   >> (7-i) & 1) == 1);
	            boolean c15 = ((crc >> 15    & 1) == 1);
	            crc <<= 1;
	            if (c15 ^ bit) crc ^= polynomial;
	         }
	    }

	    crc &= 0xffff;

	    return Integer.toHexString(crc);

	}
	
	//Checks SCP Document CRC for Non Real time ECG data
	public boolean checkDocCRC(ECGNonRTSCPData ecgData){
		List<Byte> docList =new ArrayList<Byte>();
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpData().getLength()))));
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpSec0().getCrc()))));
		docList.addAll(getSec0List(ecgData.getScpSec0()));
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpSec1().getCrc()))));
		docList.addAll(getSec1List(ecgData.getScpSec1()));
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpSec2().getCrc()))));
		docList.addAll(getSec2List(ecgData.getScpSec2()));
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpSec3().getCrc()))));
		docList.addAll(getSec3List(ecgData.getScpSec3()));
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpSec6().getCrc()))));
		docList.addAll(getSec6List(ecgData.getScpSec6()));
		docList.addAll((Arrays.asList(ArrayUtils.toObject(ecgData.getScpSec9().getCrc()))));
		docList.addAll(getSec9List(ecgData.getScpSec9()));
		if(!check16BitCRC(docList).equalsIgnoreCase(String.format("%02X", UtilClass.getLSB(ecgData.getScpData().getCrc())))){
			return false;
		}else{
			String sec0CRC= String.format("%02X", UtilClass.getLSB(ecgData.getScpSec0().getCrc()));
			String sec1CRC= String.format("%02X", UtilClass.getLSB(ecgData.getScpSec1().getCrc()));
			String sec2CRC= String.format("%02X", UtilClass.getLSB(ecgData.getScpSec2().getCrc()));
			String sec3CRC= String.format("%02X", UtilClass.getLSB(ecgData.getScpSec3().getCrc()));
			String sec6CRC= String.format("%02X", UtilClass.getLSB(ecgData.getScpSec6().getCrc()));
			String sec9CRC= String.format("%02X", UtilClass.getLSB(ecgData.getScpSec9().getCrc()));
			if(!check16BitCRC(getSec0List(ecgData.getScpSec0())).equalsIgnoreCase(sec0CRC)){
				return false;
			}
			
			if(!check16BitCRC(getSec1List(ecgData.getScpSec1())).equalsIgnoreCase(sec1CRC)){
				return false;
			}
			
			if(!check16BitCRC(getSec2List(ecgData.getScpSec2())).equalsIgnoreCase(sec2CRC)){
				return false;
			}
			
			if(!check16BitCRC(getSec3List(ecgData.getScpSec3())).equalsIgnoreCase(sec3CRC)){
				return false;
			}
			
			if(!check16BitCRC(getSec6List(ecgData.getScpSec6())).equalsIgnoreCase(sec6CRC)){
				return false;
			}
			
			if(!check16BitCRC(getSec9List(ecgData.getScpSec9())).equalsIgnoreCase(sec9CRC)){
				return false;
			}
		}
		
		return true;
	}
	
	//Checks SCP Section 0 CRC for Non Real time ECG data
	public List<Byte> getSec0List(ECGSCPSec0 scpSec0){
		List<Byte> sec0List = new ArrayList<Byte>();
		
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength())));
		sec0List.add(scpSec0.getSectionVersion());
		sec0List.add(scpSec0.getProtocolVersion());
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getReservedBits())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId1())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength1())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getIndexToSection1())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId2())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength2())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getIndexToSection2())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId3())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength3())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getIndexToSection3())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId4())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength4())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getIndexToSection4())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId5())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength5())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getIndexToSection5())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionId6())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getSectionLength6())));
		sec0List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec0.getIndexToSection6())));
		
		return sec0List;
	}
	
	//Checks SCP Section 1 CRC for Non Real time ECG data
	public List<Byte> getSec1List(ECGSCPSec1 scpSec1){
		List<Byte> sec1List = new ArrayList<Byte>();
		
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getSectionId())));
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getSectionLength())));
		sec1List.add( scpSec1.getSectionVersion());
		sec1List.add( scpSec1.getProtocolVersion());
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getReservedBits())));
		sec1List.add( scpSec1.getTag1());
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getLength1())));
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getValue1())));
		sec1List.add( scpSec1.getTag2());
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getLength2())));
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getValue2())));
		sec1List.add( scpSec1.getTag3());
		sec1List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec1.getLength3())));
		
		return sec1List;
	}
	
	//Checks SCP Section 2 CRC for Non Real time ECG data
	public List<Byte> getSec2List(ECGSCPSec2 scpSec2){
		List<Byte> sec2List = new ArrayList<Byte>();
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getSectionId())));
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getSectionLength())));
		sec2List.add( scpSec2.getSectionVersion());
		sec2List.add( scpSec2.getProtocolVersion());
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getReservedBits())));
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getAmount())));
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getAmtOfStructures())));
		sec2List.add( scpSec2.getPrefixBits());
		sec2List.add( scpSec2.getEncodingBits());
		sec2List.add( scpSec2.getTableType());
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getBaseValue())));
		sec2List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec2.getBaseValEncoding())));
		sec2List.add( scpSec2.getPaddingByte());
		
		return sec2List;
	}
	
	//Checks SCP Section 3 CRC for Non Real time ECG data
	public List<Byte> getSec3List(ECGSCPSec3 scpSec3){
		List<Byte> sec3List = new ArrayList<Byte>();
		sec3List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec3.getSectionId())));
		sec3List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec3.getSectionLength())));
		sec3List.add( scpSec3.getSectionVersion());
		sec3List.add( scpSec3.getProtocolVersion());
		sec3List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec3.getReservedBits())));
		sec3List.add( scpSec3.getAmount());
		sec3List.add( scpSec3.getLeadConfiguration());
		sec3List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec3.getStartingSample())));
		sec3List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec3.getEndingSample())));
		sec3List.add( scpSec3.getLeadId());
		sec3List.add( scpSec3.getPaddingByte());
		
		return sec3List;
	}
	
	//Checks SCP Section 6 CRC for Non Real time ECG data
	public List<Byte> getSec6List(ECGSCPSec6 scpSec6){
		List<Byte> sec6List = new ArrayList<Byte>();
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getSectionId())));
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getSectionLength())));
		sec6List.add( scpSec6.getSectionVersion());
		sec6List.add( scpSec6.getProtocolVersion());
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getReservedBits())));
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getAvm())));
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getSamplingInterval())));
		sec6List.add( scpSec6.getDiffUsed());
		sec6List.add( scpSec6.getBiomodal());
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getLeadLength())));
		sec6List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec6.getDataBlock())));
		
		return sec6List;
	}
	
	//Checks SCP Section 9 CRC for Non Real time ECG data
	public List<Byte> getSec9List(ECGSCPSec9 scpSec9){
		List<Byte> sec9List = new ArrayList<Byte>();
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getSectionId())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getSectionLength())));
		sec9List.add( scpSec9.getSectionVersion());
		sec9List.add( scpSec9.getProtocolVersion());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getReservedBits())));
		sec9List.add( scpSec9.getTagNumber1());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength1())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent1())));
		sec9List.add( scpSec9.getTagNumber2());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength2())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent2())));
		sec9List.add( scpSec9.getTagNumber3());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength3())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent3())));
		sec9List.add( scpSec9.getTagNumber4());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength4())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent4())));
		sec9List.add( scpSec9.getTagNumber5());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength5())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent5())));
		sec9List.add( scpSec9.getTagNumber6());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength6())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent6())));
		sec9List.add( scpSec9.getTagNumber7());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength7())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent7())));
		sec9List.add( scpSec9.getTagNumber8());
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContentLength8())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getContent8())));
		sec9List.addAll(Arrays.asList(ArrayUtils.toObject(scpSec9.getAnalysisDetails())));
		
		return sec9List;
	}

}
