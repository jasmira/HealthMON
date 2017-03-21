package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.PulseOXPacketWaveform;

import java.io.Serializable;
import java.util.List;

public class PulseOXPacketWaveformList implements ClinicalMonitorDeviceData, Serializable {

	List<PulseOXPacketWaveform> pulseOXPacketWaveformList = null;

	public PulseOXPacketWaveformList(
			List<PulseOXPacketWaveform> pulseOXPacketWaveformList) {
		super();
		this.pulseOXPacketWaveformList = pulseOXPacketWaveformList;
	}

	public List<PulseOXPacketWaveform> getPulseOXPacketWaveformList() {
		return pulseOXPacketWaveformList;
	}

	public void setPulseOXPacketWaveformList(
			List<PulseOXPacketWaveform> pulseOXPacketWaveformList) {
		this.pulseOXPacketWaveformList = pulseOXPacketWaveformList;
	}
	
	public int getPulseOXPacketWaveformSize(){
		return pulseOXPacketWaveformList.size();

	}
}
