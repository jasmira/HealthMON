package com.vesag.bt.beans;

import java.io.Serializable;
import java.util.ArrayList;

public class PulseOxiWaveDataComm implements Serializable {
	private String mUserId;
	private int mDeviceId;
	private int mEntryId;
	private ArrayList<Integer> mPulseOxiWavePoints = null;
	private ArrayList<Integer> mPulseOxiPulseBeats = null;
	public ArrayList<Integer> getmPulseOxiPulseBeats() {
		return mPulseOxiPulseBeats;
	}
	public void setmPulseOxiPulseBeats(ArrayList<Integer> mPulseOxiPulseBeats) {
		this.mPulseOxiPulseBeats = mPulseOxiPulseBeats;
	}
	public ArrayList<Integer> getmPulseOxiWavePoints() {
		return mPulseOxiWavePoints;
	}
	public void setmPulseOxiWavePoints(ArrayList<Integer> mPulseOxiWavePoints) {
		this.mPulseOxiWavePoints = mPulseOxiWavePoints;
	}
	
	public String getmPulseOxiWaveTimeStamp() {
		return mPulseOxiWaveTimeStamp;
	}
	public void setmPulseOxiWaveTimeStamp(String mPulseOxiWaveTimeStamp) {
		this.mPulseOxiWaveTimeStamp = mPulseOxiWaveTimeStamp;
	}
	private String mPulseOxiWaveTimeStamp = null;
	
	public void setPulseOxiWavePointsAndTimeStamp(ArrayList<Integer> mPulseOxiWavePoints,String mPulseOxiWaveTimeStamp){
		this.mPulseOxiWavePoints = mPulseOxiWavePoints;
		this.mPulseOxiWaveTimeStamp = mPulseOxiWaveTimeStamp;
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
