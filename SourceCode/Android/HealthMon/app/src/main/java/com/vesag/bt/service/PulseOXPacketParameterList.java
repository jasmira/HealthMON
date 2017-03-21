package com.vesag.bt.service;

import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.beans.PulseOXPacketParameter;

import java.io.Serializable;
import java.util.List;

public class PulseOXPacketParameterList implements ClinicalMonitorDeviceData, Serializable {

	List<PulseOXPacketParameter> pulseOXPacketParametersList = null;

	public PulseOXPacketParameterList(
			List<PulseOXPacketParameter> pulseOXPacketParametersList) {
		this.pulseOXPacketParametersList = pulseOXPacketParametersList;
	}

	/**
	 * @return the pulseOXPacketParametersList
	 */
	public final List<PulseOXPacketParameter> getPulseOXPacketParametersList() {
		return pulseOXPacketParametersList;
	}

	/**
	 * @param pulseOXPacketParametersList the pulseOXPacketParametersList to set
	 */
	public final void setPulseOXPacketParametersList(
			List<PulseOXPacketParameter> pulseOXPacketParametersList) {
		this.pulseOXPacketParametersList = pulseOXPacketParametersList;
	}

	public int getPulseOXPacketParameterSize(){
		return pulseOXPacketParametersList.size();

	}

}
