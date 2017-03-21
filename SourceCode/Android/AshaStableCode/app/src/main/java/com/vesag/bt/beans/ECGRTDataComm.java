package com.vesag.bt.beans;

import java.util.ArrayList;

public class ECGRTDataComm {
	private String mUserId;
	private int mDeviceId;
	private int mEntryId;

	private ArrayList<SingleECGRTReading> mSingleECGRTReadingList = null;
	
	public class SingleECGRTReading{
		private ArrayList<Integer> mWavePoints = null;
		private String mTimeStamp;
		private int mHeartRate;
		
		public ArrayList<Integer> getmWavePoints() {
			return mWavePoints;
		}
		public void setmWavePoints(ArrayList<Integer> mWavePoints) {
			this.mWavePoints = mWavePoints;
		}
		public String getmTimeStamp() {
			return mTimeStamp;
		}
		public void setmTimeStamp(String mTimeStamp) {
			this.mTimeStamp = mTimeStamp;
		}
		public int getmHeartRate() {
			return mHeartRate;
		}
		public void setmHeartRate(int mHeartRate) {
			this.mHeartRate = mHeartRate;
		}
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

	public ArrayList<SingleECGRTReading> getmSingleECGRTReadingList() {
		return mSingleECGRTReadingList;
	}

	public void setmSingleECGRTReadingList(ArrayList<SingleECGRTReading> mSingleECGRTReadingList) {
		this.mSingleECGRTReadingList = mSingleECGRTReadingList;
	}
	
	public int getmEntryId() {
		return mEntryId;
	}
	public void setmEntryId(int mEntryId) {
		this.mEntryId = mEntryId;
	}
}
