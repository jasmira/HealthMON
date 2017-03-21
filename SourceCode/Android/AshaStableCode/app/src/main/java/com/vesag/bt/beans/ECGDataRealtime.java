package com.vesag.bt.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

//POJO for Real time ECG packets
public class ECGDataRealtime implements Serializable, ClinicalMonitorDeviceData{
	
	private int packetId;
	private String deviceName;
	private String deviceId;
	private String packetType;
	private String type;
	private String head;
	private String token;
	private int length;
	private String tranmissionType;
	private String deviceModel;
	private int seqNo;
	private List<Integer> wavePoints = new ArrayList<Integer>();
	private int heartRate;
	private int leadStatus;
	private int batteryVolt;
	private String crc;
	private int crcCheck;
	private List<String> contentList = new ArrayList<String>();
	private String timeStamp;
	
	public int getPacketId() {
		return packetId;
	}
	public void setPacketId(int packetId) {
		this.packetId = packetId;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getPacketType() {
		return packetType;
	}
	public void setPacketType(String packetType) {
		this.packetType = packetType;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getTranmissionType() {
		return tranmissionType;
	}
	public void setTranmissionType(String tranmissionType) {
		this.tranmissionType = tranmissionType;
	}
	public String getDeviceModel() {
		return deviceModel;
	}
	public void setDeviceModel(String deviceModel) {
		this.deviceModel = deviceModel;
	}
	public int getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	
	public List<Integer> getWavePoints() {
		return wavePoints;
	}
	public void setWavePoints(List<Integer> wavePoints) {
		this.wavePoints = wavePoints;
	}
	public int getHeartRate() {
		return heartRate;
	}
	public void setHeartRate(int heartRate) {
		this.heartRate = heartRate;
	}
	public int getLeadStatus() {
		return leadStatus;
	}
	public void setLeadStatus(int leadStatus) {
		this.leadStatus = leadStatus;
	}
	public int getBatteryVolt() {
		return batteryVolt;
	}
	public void setBatteryVolt(int batteryVolt) {
		this.batteryVolt = batteryVolt;
	}
	public String getCrc() {
		return crc;
	}
	public void setCrc(String crc) {
		this.crc = crc;
	}
	public int getCrcCheck() {
		return crcCheck;
	}
	public void setCrcCheck(int crcCheck) {
		this.crcCheck = crcCheck;
	}
	public List<String> getContentList() {
		return contentList;
	}
	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	
	

}
