package com.vesag.bt.beans;

import java.io.Serializable;
import java.util.ArrayList;

public class ECGNRTDataComm implements Serializable {
	private String mUserId;
	private int mDeviceId;
	private int mEntryId;
	private ArrayList<Integer> mECGNRTWavePoints = null;
	public ArrayList<Integer> getmECGNRTWavePoints() {
		return mECGNRTWavePoints;
	}
	public void setmECGNRTWavePoints(ArrayList<Integer> mECGNRTWavePoints) {
		this.mECGNRTWavePoints = mECGNRTWavePoints;
	}
	
	public String getmECGNRTTimeStamp() {
		return mECGNRTTimeStamp;
	}
	public void setmECGNRTTimeStamp(String mECGNRTTimeStamp) {
		this.mECGNRTTimeStamp = mECGNRTTimeStamp;
	}
	private String mECGNRTTimeStamp = null;
	
	public void setECGNRTWavePointsAndTimeStamp(ArrayList<Integer> mECGNRTWavePoints,String mECGNRTTimeStamp){
		this.mECGNRTWavePoints = mECGNRTWavePoints;
		this.mECGNRTTimeStamp = mECGNRTTimeStamp;
	}
	public String getmUserId() {
		return mUserId;
	}

	public void setmUserId(String mUserId) {
		this.mUserId = mUserId;
	}

	public int getmDeviceId() {
		return mDeviceId;
	}

	public void setmDeviceId(int mDeviceId) {
		this.mDeviceId = mDeviceId;
	}
	public int getmEntryId() {
		return mEntryId;
	}
	public void setmEntryId(int mEntryId) {
		this.mEntryId = mEntryId;
	}
}
