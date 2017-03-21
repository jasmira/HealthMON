package com.vesag.bt.util;

import android.util.Log;

import com.persistent.healthmon.util.Constants;
import com.vesag.bt.beans.ECGDataRealtime;
import com.vesag.bt.beans.PulseOXPacketWaveform;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UtilClass {

	//Generates Hexadecimal CRC value from byte array 
	public static String getCRCString(byte[] byteArray){
		String value ="";
		StringBuffer sb = new StringBuffer();
		int data=0;
		for(byte b: byteArray){
			data = b & 0xff;
			sb.append(String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0'));
		}
		value = String.format("%02X", Integer.parseInt(sb.toString(), 2));
		return value;
	}

	//Calculates the LSB value from byte array 
	public static int getLSB(byte[] byteArray){
		int value =0;
		StringBuffer sb = new StringBuffer();
		int data=0;
		for(int i=byteArray.length-1; i>=0; i--){
			data = byteArray[i] & 0xff;
			sb.append(String.format("%8s", Integer.toBinaryString(data)).replace(' ', '0'));
		}
		value = Integer.parseInt(sb.toString(), 2);
		return value;
	}

	public static byte[] convertIntArrayListToByteArray(ArrayList<Integer> integerArrayList){

		if(integerArrayList != null && integerArrayList.size() >0 ){

			byte array[] = new byte[(integerArrayList.size())*2];
			ArrayList<Integer> integerList =new ArrayList<Integer>();

			for(int i=0; i<integerArrayList.size() ; i++){
				String sb= (String.format("%8s", Integer.toBinaryString(integerArrayList.get(i))).replace(' ', '0'));
				while (sb.length() < 16)
					sb = "0" + sb;

				String binaryValue1 = sb.substring(0, 8);
				String binaryValue2 = sb.substring(8);

				integerList.add(Integer.parseInt(binaryValue1, 2));
				integerList.add(Integer.parseInt(binaryValue2, 2));
			}

			for(int j=0; j<integerList.size(); j++){
				array[j] = integerList.get(j).byteValue();
			}
			return array;
		}else
		{
			return null;
		}

	}

	public static List<Integer> convertByteArrayToIntArrayList(byte[] byteArray){
		if(byteArray != null && byteArray.length > 0){
			List<Integer> ecgsignalList = new ArrayList<Integer>();

			for(int i=0; i< byteArray.length; i++){
				int value1 =  byteArray[i] & 0xff;
				int value2 =  byteArray[i+1]  & 0xff;
				i++;
				String s1 = (String.format("%8s", Integer.toBinaryString(value1)).replace(' ', '0'));
				String s2 = (String.format("%8s", Integer.toBinaryString(value2)).replace(' ', '0'));
				int finalValue = Integer.parseInt((s1 + s2), 2);
				ecgsignalList.add(finalValue);
			}
			return ecgsignalList;
		}else{
			return null;
		}

	}

	public static ArrayList<Integer> getWavePointsFromAllPackets(
			ArrayList<ECGDataRealtime> realTimePackets) {
		ArrayList<Integer> wavePointsFromAllPackets = null;
		// TODO Auto-generated method stub
		if(realTimePackets !=null){
			wavePointsFromAllPackets = new ArrayList<Integer>(realTimePackets.size() * Constants.NUMBER_OF_POINTS_IN_A_ECG_PACKET);
			Iterator<ECGDataRealtime> realTimePacketsIterator = realTimePackets.iterator();
			if(realTimePacketsIterator != null){
				while(realTimePacketsIterator.hasNext()){
					ECGDataRealtime ecgPacket = realTimePacketsIterator.next();
					wavePointsFromAllPackets.addAll(ecgPacket.getWavePoints());
				}
				return wavePointsFromAllPackets;
			}
		}
		return null;
	}

	public static ArrayList<Integer> getWavePointsFromAllPacketsForPulseOxi(
			ArrayList<PulseOXPacketWaveform> pulseOxiWvFormPackets) {
		ArrayList<Integer> wavePointsFromAllPackets = null;
		if(pulseOxiWvFormPackets !=null){
			wavePointsFromAllPackets = new ArrayList<Integer>(pulseOxiWvFormPackets.size() * Constants.NUMBER_OF_POINTS_IN_A_PULSE_PACKET);
			Iterator<PulseOXPacketWaveform> pulseOxiWvFormPacketsIterator = pulseOxiWvFormPackets.iterator();
			if(pulseOxiWvFormPacketsIterator != null){
				while(pulseOxiWvFormPacketsIterator.hasNext()){
					PulseOXPacketWaveform pulseOxiPacket = pulseOxiWvFormPacketsIterator.next();
					wavePointsFromAllPackets.add(pulseOxiPacket.getData1WF());
					wavePointsFromAllPackets.add(pulseOxiPacket.getData2WF());
					wavePointsFromAllPackets.add(pulseOxiPacket.getData3WF());
					wavePointsFromAllPackets.add(pulseOxiPacket.getData4WF());
					wavePointsFromAllPackets.add(pulseOxiPacket.getData5WF());
				}
				Log.d("UtilClass ", "getWavePointsFromAllPacketsForPulseOxi returning " + wavePointsFromAllPackets);
				return wavePointsFromAllPackets;
			}
		}
		return null;
	}
	
	public static ArrayList<Integer> getPulseBeatFromAllPacketsForPulseOxi(
			ArrayList<PulseOXPacketWaveform> pulseOxiWvFormPackets) {
		ArrayList<Integer> pulseBeatsFromAllPackets = null;
		if(pulseOxiWvFormPackets !=null){
			pulseBeatsFromAllPackets = new ArrayList<Integer>(pulseOxiWvFormPackets.size() * Constants.NUMBER_OF_POINTS_IN_A_PULSE_PACKET);
			Iterator<PulseOXPacketWaveform> pulseOxiWvFormPacketsIterator = pulseOxiWvFormPackets.iterator();
			if(pulseOxiWvFormPacketsIterator != null){
				while(pulseOxiWvFormPacketsIterator.hasNext()){
					PulseOXPacketWaveform pulseOxiPacket = pulseOxiWvFormPacketsIterator.next();
					pulseBeatsFromAllPackets.add(pulseOxiPacket.getData1PB());
					pulseBeatsFromAllPackets.add(pulseOxiPacket.getData2PB());
					pulseBeatsFromAllPackets.add(pulseOxiPacket.getData3PB());
					pulseBeatsFromAllPackets.add(pulseOxiPacket.getData4PB());
					pulseBeatsFromAllPackets.add(pulseOxiPacket.getData5PB());
				}
				Log.d("UtilClass ", "gePulseBeatFromAllPacketsForPulseOxi returning " + pulseBeatsFromAllPackets);
				return pulseBeatsFromAllPackets;
			}
		}
		return null;
	}

}
