package com.vesag.bt.util;

import com.vesag.bt.beans.ECGNonRTSCPDataBean;
import com.vesag.bt.beans.ECGSCPSec0Bean;
import com.vesag.bt.beans.ECGSCPSec1Bean;
import com.vesag.bt.beans.ECGSCPSec2Bean;
import com.vesag.bt.beans.ECGSCPSec3Bean;
import com.vesag.bt.beans.ECGSCPSec6Bean;
import com.vesag.bt.beans.ECGSCPSec9Bean;
import com.vesag.bt.parser.beans.ECGNonRTSCPData;
import com.vesag.bt.parser.beans.ECGSCPSec0;
import com.vesag.bt.parser.beans.ECGSCPSec1;
import com.vesag.bt.parser.beans.ECGSCPSec2;
import com.vesag.bt.parser.beans.ECGSCPSec3;
import com.vesag.bt.parser.beans.ECGSCPSec6;
import com.vesag.bt.parser.beans.ECGSCPSec9;

import java.util.ArrayList;
import java.util.List;

public class ECGDataProcessing {
	//ECGNRTDataDAO ecgDAO = new ECGNRTDataDAO();
	public ECGNonRTSCPDataBean processECGSCPData(ECGNonRTSCPData ecgData){
		ECGSCPSec0Bean scpSec0_1 = processSec0Data(ecgData.getScpSec0());
		//ecgDAO.insertSecData(scpSec0_1);
		ECGSCPSec1Bean scpSec1_1 = processSec1Data(ecgData.getScpSec1());
		//ecgDAO.insertSecData(scpSec1_1);
		ECGSCPSec2Bean scpSec2_1 = processSec2Data(ecgData.getScpSec2());
		//ecgDAO.insertSecData(scpSec2_1);
		ECGSCPSec3Bean scpSec3_1 = processSec3Data(ecgData.getScpSec3());
		//ecgDAO.insertSecData(scpSec3_1);
		ECGSCPSec6Bean scpSec6_1 = processSec6Data(ecgData.getScpSec6());
		//ecgDAO.insertSecData(scpSec6_1);
		ECGSCPSec9Bean scpSec9_1 = processSec9Data(ecgData.getScpSec9());
		//ecgDAO.insertSecData(scpSec9_1);
		
		ECGNonRTSCPDataBean ecgNRTBean = new ECGNonRTSCPDataBean();
		ecgNRTBean.setScpSec0bean(scpSec0_1);
		ecgNRTBean.setScpSec1bean(scpSec1_1);
		ecgNRTBean.setScpSec2bean(scpSec2_1);
		ecgNRTBean.setScpSec3bean(scpSec3_1);
		ecgNRTBean.setScpSec6bean(scpSec6_1);
		ecgNRTBean.setScpSec9bean(scpSec9_1);
		
		return ecgNRTBean;
	}
	
	public ECGSCPSec0Bean processSec0Data(ECGSCPSec0 scpSec0){
		ECGSCPSec0Bean scpSec0_1 = new ECGSCPSec0Bean();
		scpSec0_1.setCrc(UtilClass.getCRCString(scpSec0.getCrc()));
		scpSec0_1.setSectionId(UtilClass.getLSB(scpSec0.getSectionId()));
		scpSec0_1.setSectionLength(UtilClass.getLSB(scpSec0.getSectionLength()));
		scpSec0_1.setSectionVersion("0x"+ String.format("%02X", scpSec0.getSectionVersion() & 0xff));
		scpSec0_1.setProtocolVersion("0x"+ String.format("%02X", scpSec0.getProtocolVersion() & 0xff));
		int array[] = new int[scpSec0.getReservedBits().length];
		for(int i=0 ; i<scpSec0.getReservedBits().length ; i++){
			array[i]= scpSec0.getReservedBits()[i] & 0xff;
		}
		scpSec0_1.setReservedBits(array);
		
		scpSec0_1.setSectionId1(UtilClass.getLSB(scpSec0.getSectionId1()));
		scpSec0_1.setSectionLength1(UtilClass.getLSB(scpSec0.getSectionLength1()));
		scpSec0_1.setIndexToSection1(UtilClass.getLSB(scpSec0.getIndexToSection1()));
		
		scpSec0_1.setSectionId2(UtilClass.getLSB(scpSec0.getSectionId2()));
		scpSec0_1.setSectionLength2(UtilClass.getLSB(scpSec0.getSectionLength2()));
		scpSec0_1.setIndexToSection2(UtilClass.getLSB(scpSec0.getIndexToSection2()));
		
		scpSec0_1.setSectionId3(UtilClass.getLSB(scpSec0.getSectionId3()));
		scpSec0_1.setSectionLength3(UtilClass.getLSB(scpSec0.getSectionLength3()));
		scpSec0_1.setIndexToSection3(UtilClass.getLSB(scpSec0.getIndexToSection3()));
		
		scpSec0_1.setSectionId4(UtilClass.getLSB(scpSec0.getSectionId4()));
		scpSec0_1.setSectionLength4(UtilClass.getLSB(scpSec0.getSectionLength4()));
		scpSec0_1.setIndexToSection4(UtilClass.getLSB(scpSec0.getIndexToSection4()));
		
		scpSec0_1.setSectionId5(UtilClass.getLSB(scpSec0.getSectionId5()));
		scpSec0_1.setSectionLength5(UtilClass.getLSB(scpSec0.getSectionLength5()));
		scpSec0_1.setIndexToSection5(UtilClass.getLSB(scpSec0.getIndexToSection5()));
		
		scpSec0_1.setSectionId6(UtilClass.getLSB(scpSec0.getSectionId6()));
		scpSec0_1.setSectionLength6(UtilClass.getLSB(scpSec0.getSectionLength6()));
		scpSec0_1.setIndexToSection6(UtilClass.getLSB(scpSec0.getIndexToSection6()));
		
		return scpSec0_1;
	}
	
	public ECGSCPSec1Bean processSec1Data(ECGSCPSec1 scpSec1){
		ECGSCPSec1Bean scpSec1_1 = new ECGSCPSec1Bean();
		scpSec1_1.setCrc(UtilClass.getCRCString(scpSec1.getCrc()));
		scpSec1_1.setSectionId(UtilClass.getLSB(scpSec1.getSectionId()));
		scpSec1_1.setSectionLength(UtilClass.getLSB(scpSec1.getSectionLength()));
		scpSec1_1.setSectionVersion("0x"+ String.format("%02X", scpSec1.getSectionVersion() & 0xff));
		scpSec1_1.setProtocolVersion("0x"+ String.format("%02X", scpSec1.getProtocolVersion() & 0xff));
		int array[] = new int[scpSec1.getReservedBits().length];
		for(int i=0 ; i<scpSec1.getReservedBits().length ; i++){
			array[i]= scpSec1.getReservedBits()[i] & 0xff;
		}
		scpSec1_1.setReservedBits(array);
		scpSec1_1.setTag1(scpSec1.getTag1() & 0xff);
		scpSec1_1.setLength1(UtilClass.getLSB(scpSec1.getLength1()));
		
		int array1[] = new int[scpSec1.getValue1().length];
		for(int i=0 ; i<scpSec1.getValue1().length ; i++){
			array1[i]= scpSec1.getValue1()[i] & 0xff;
		}
		scpSec1_1.setValue1(array1);
		scpSec1_1.setTag2(scpSec1.getTag2() & 0xff);
		scpSec1_1.setLength2(UtilClass.getLSB(scpSec1.getLength2()));
		
		int array2[] = new int[scpSec1.getValue2().length];
		for(int i=0 ; i<scpSec1.getValue2().length ; i++){
			array2[i]= scpSec1.getValue2()[i] & 0xff;
		}
		scpSec1_1.setValue2(array2);
		scpSec1_1.setTag3(scpSec1.getTag3() & 0xff);
		scpSec1_1.setLength3(UtilClass.getLSB(scpSec1.getLength3()));
		
		return scpSec1_1;
	}

	public ECGSCPSec2Bean processSec2Data(ECGSCPSec2 scpSec2){
		ECGSCPSec2Bean scpSec2_1 = new ECGSCPSec2Bean();
		scpSec2_1.setCrc(UtilClass.getCRCString(scpSec2.getCrc()));
		scpSec2_1.setSectionId(UtilClass.getLSB(scpSec2.getSectionId()));
		scpSec2_1.setSectionLength(UtilClass.getLSB(scpSec2.getSectionLength()));
		scpSec2_1.setSectionVersion("0x"+ String.format("%02X", scpSec2.getSectionVersion() & 0xff));
		scpSec2_1.setProtocolVersion("0x"+ String.format("%02X", scpSec2.getProtocolVersion() & 0xff));
		int array[] = new int[scpSec2.getReservedBits().length];
		for(int i=0 ; i<scpSec2.getReservedBits().length ; i++){
			array[i]= scpSec2.getReservedBits()[i] & 0xff;
		}
		scpSec2_1.setReservedBits(array);
		scpSec2_1.setAmount(UtilClass.getLSB(scpSec2.getAmount()));
		scpSec2_1.setAmtOfStructures(UtilClass.getLSB(scpSec2.getAmtOfStructures()));
		scpSec2_1.setPrefixBits(scpSec2.getPrefixBits() & 0xff);
		scpSec2_1.setEncodingBits(scpSec2.getEncodingBits() & 0xff);
		scpSec2_1.setTableType(scpSec2.getTableType()& 0xff);
		scpSec2_1.setBaseValue(UtilClass.getLSB(scpSec2.getBaseValue()));
		scpSec2_1.setBaseValEncoding(UtilClass.getLSB(scpSec2.getBaseValEncoding()));
		scpSec2_1.setPaddingByte(scpSec2.getPaddingByte()& 0xff);
		return scpSec2_1;
	}

	public ECGSCPSec3Bean processSec3Data(ECGSCPSec3 scpSec3){
		ECGSCPSec3Bean scpSec3_1 = new ECGSCPSec3Bean();
		scpSec3_1.setCrc(UtilClass.getCRCString(scpSec3.getCrc()));
		scpSec3_1.setSectionId(UtilClass.getLSB(scpSec3.getSectionId()));
		scpSec3_1.setSectionLength(UtilClass.getLSB(scpSec3.getSectionLength()));
		scpSec3_1.setSectionVersion("0x"+ String.format("%02X", scpSec3.getSectionVersion() & 0xff));
		scpSec3_1.setProtocolVersion("0x"+ String.format("%02X", scpSec3.getProtocolVersion() & 0xff));
		int array[] = new int[scpSec3.getReservedBits().length];
		for(int i=0 ; i<scpSec3.getReservedBits().length ; i++){
			array[i]= scpSec3.getReservedBits()[i] & 0xff;
		}
		scpSec3_1.setReservedBits(array);
		scpSec3_1.setAmount(scpSec3.getAmount() & 0xff);
		scpSec3_1.setLeadConfiguration(scpSec3.getLeadConfiguration() & 0xff);
		scpSec3_1.setStartingSample(UtilClass.getLSB(scpSec3.getStartingSample()));
		scpSec3_1.setEndingSample(UtilClass.getLSB(scpSec3.getEndingSample()));
		scpSec3_1.setLeadId(scpSec3.getLeadId() & 0xff);
		scpSec3_1.setPaddingByte(scpSec3.getPaddingByte() & 0xff);
		
		return scpSec3_1;
	}

	public ECGSCPSec6Bean processSec6Data(ECGSCPSec6 scpSec6){
		ECGSCPSec6Bean scpSec6_1 = new ECGSCPSec6Bean();
		scpSec6_1.setCrc(UtilClass.getCRCString(scpSec6.getCrc()));
		scpSec6_1.setSectionId(UtilClass.getLSB(scpSec6.getSectionId()));
		scpSec6_1.setSectionLength(UtilClass.getLSB(scpSec6.getSectionLength()));
		scpSec6_1.setSectionVersion("0x"+ String.format("%02X", scpSec6.getSectionVersion() & 0xff));
		scpSec6_1.setProtocolVersion("0x"+ String.format("%02X", scpSec6.getProtocolVersion() & 0xff));
		int array[] = new int[scpSec6.getReservedBits().length];
		for(int i=0 ; i<scpSec6.getReservedBits().length ; i++){
			array[i]= scpSec6.getReservedBits()[i] & 0xff;
		}
		scpSec6_1.setReservedBits(array);
		scpSec6_1.setAvm(UtilClass.getLSB(scpSec6.getAvm()));
		scpSec6_1.setSamplingInterval(UtilClass.getLSB(scpSec6.getSamplingInterval()));
		scpSec6_1.setDiffUsed(scpSec6.getDiffUsed() & 0xff);
		scpSec6_1.setBiomodal(scpSec6.getBiomodal() & 0xff);
		scpSec6_1.setLeadLength(UtilClass.getLSB(scpSec6.getLeadLength()));
		int array1[] = new int[scpSec6.getDataBlock().length];
		for(int i=0 ; i<scpSec6.getDataBlock().length ; i++){
			array1[i]= scpSec6.getDataBlock()[i] & 0xff;
		}
		scpSec6_1.setDataBlock(array1);
		List<Integer> ecgSignal = processSignalData(scpSec6.getDataBlock());
		scpSec6_1.setEcgsignal(ecgSignal);
		return scpSec6_1;
	}
	
	public ECGSCPSec9Bean processSec9Data(ECGSCPSec9 scpSec9){
		ECGSCPSec9Bean scpSec9_1 = new ECGSCPSec9Bean();
		scpSec9_1.setCrc(UtilClass.getCRCString(scpSec9.getCrc()));
		scpSec9_1.setSectionId(UtilClass.getLSB(scpSec9.getSectionId()));
		scpSec9_1.setSectionLength(UtilClass.getLSB(scpSec9.getSectionLength()));
		scpSec9_1.setSectionVersion("0x"+ String.format("%02X", scpSec9.getSectionVersion() & 0xff));
		scpSec9_1.setProtocolVersion("0x"+ String.format("%02X", scpSec9.getProtocolVersion() & 0xff));
		int array[] = new int[scpSec9.getReservedBits().length];
		for(int i=0 ; i<scpSec9.getReservedBits().length ; i++){
			array[i]= scpSec9.getReservedBits()[i] & 0xff;
		}
		scpSec9_1.setReservedBits(array);
		scpSec9_1.setTagNumber1(scpSec9.getTagNumber1() & 0xff);
		scpSec9_1.setContentLength1(UtilClass.getLSB(scpSec9.getContentLength1()));
		scpSec9_1.setContent1(UtilClass.getLSB(scpSec9.getContent1()));
		scpSec9_1.setTagNumber2(scpSec9.getTagNumber2() & 0xff);
		scpSec9_1.setContentLength2(UtilClass.getLSB(scpSec9.getContentLength2()));
		scpSec9_1.setContent2(UtilClass.getLSB(scpSec9.getContent2()));
		scpSec9_1.setTagNumber3(scpSec9.getTagNumber3() & 0xff);
		scpSec9_1.setContentLength3(UtilClass.getLSB(scpSec9.getContentLength3()));
		scpSec9_1.setContent3(UtilClass.getLSB(scpSec9.getContent3()));
		scpSec9_1.setTagNumber4(scpSec9.getTagNumber4() & 0xff);
		scpSec9_1.setContentLength4(UtilClass.getLSB(scpSec9.getContentLength4()));
		scpSec9_1.setContent4(UtilClass.getLSB(scpSec9.getContent4()));
		scpSec9_1.setTagNumber5(scpSec9.getTagNumber5() & 0xff);
		scpSec9_1.setContentLength5(UtilClass.getLSB(scpSec9.getContentLength5()));
		// this needs to be checked since it gives Number format exception for intrger parsing
		// as in some cases the value after parsing is going out of range of integer
		// In this case we might have to use Double.parseDouble();
		//scpSec9_1.setContent5(UtilClass.getLSB(scpSec9.getContent5()));
		scpSec9_1.setContent5(0); // as of now set to 0
		scpSec9_1.setTagNumber6(scpSec9.getTagNumber6() & 0xff);
		scpSec9_1.setContentLength6(UtilClass.getLSB(scpSec9.getContentLength6()));
		scpSec9_1.setContent6(UtilClass.getLSB(scpSec9.getContent6()));
		scpSec9_1.setTagNumber7(scpSec9.getTagNumber7() & 0xff);
		scpSec9_1.setContentLength7(UtilClass.getLSB(scpSec9.getContentLength7()));
		scpSec9_1.setContent7(UtilClass.getLSB(scpSec9.getContent7()));
		scpSec9_1.setTagNumber8(scpSec9.getTagNumber8() & 0xff);
		scpSec9_1.setContentLength8(UtilClass.getLSB(scpSec9.getContentLength8()));
		scpSec9_1.setContent8(UtilClass.getLSB(scpSec9.getContent8()));
		
		int array1[] = new int[scpSec9.getAnalysisDetails().length];
		for(int i=0 ; i<scpSec9.getAnalysisDetails().length ; i++){
			array1[i]= scpSec9.getAnalysisDetails()[i] & 0xff;
		}
		scpSec9_1.setAnalysisDetails(array1);
		return scpSec9_1;
	}
	
    public List<Integer> processSignalData(byte array1[]){
		int j=0;
		ArrayList<Integer> signalDataList = new ArrayList<Integer>();
		ArrayList<Integer> signalData12bitList = new ArrayList<Integer>();
		for(int i=0; i<array1.length; i++){
			byte tempArray[] = new byte[2];
			tempArray[0] = array1[i];
			tempArray[1] = array1[i+1];
			int a = UtilClass.getLSB(tempArray);
			signalDataList.add(a);
			String binary = String.format("%8s", Integer.toBinaryString(a)).replace(' ', '0');
			while (binary.length() < 16) // ensure that length of word is 32
				binary = "0" + binary;
			signalData12bitList.add(Integer.parseInt(binary.substring(4), 2));
			i++;
			j++;
		}
		return signalData12bitList;
	}
}
