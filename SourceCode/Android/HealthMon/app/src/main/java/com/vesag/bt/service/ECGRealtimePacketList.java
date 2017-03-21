package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.ECGDataRealtime;

import java.io.Serializable;
import java.util.List;

public class ECGRealtimePacketList implements ClinicalMonitorDeviceData, Serializable {
	
	
	List<ECGDataRealtime> ecgRealtimePacketList = null;
	
	

	public ECGRealtimePacketList(List<ECGDataRealtime> ecgRealtimePacketList) {
		super();
		this.ecgRealtimePacketList = ecgRealtimePacketList;
	}

	public final List<ECGDataRealtime> getEcgRealtimePacketList() {
		return ecgRealtimePacketList;
	}

	public final void setEcgRealtimePacketList(List<ECGDataRealtime> ecgRealtimePacketList) {
		this.ecgRealtimePacketList = ecgRealtimePacketList;
	}
	
	public int getECGRealtimePacketListSize(){
		return ecgRealtimePacketList.size();

	}
	

}
