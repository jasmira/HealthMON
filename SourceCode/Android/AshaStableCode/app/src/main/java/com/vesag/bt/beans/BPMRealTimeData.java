package com.vesag.bt.beans;

import java.io.Serializable;

public class BPMRealTimeData implements Serializable,ClinicalMonitorDeviceData{

	private int id;
	private int systolic;
	private int diastolic;
	private int pulse;
	private String dateTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSystolic() {
		return systolic;
	}
	public void setSystolic(int systolic) {
		this.systolic = systolic;
	}
	public int getDiastolic() {
		return diastolic;
	}
	public void setDiastolic(int diastolic) {
		this.diastolic = diastolic;
	}
	public int getPulse() {
		return pulse;
	}
	public void setPulse(int pulse) {
		this.pulse = pulse;
	}
	
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BPMRealTimeData [id=" + id + ", systolic=" + systolic
				+ ", diastolic=" + diastolic + ", pulse=" + pulse + ", dateTime=" + dateTime + "]";
	}
	
	
}
