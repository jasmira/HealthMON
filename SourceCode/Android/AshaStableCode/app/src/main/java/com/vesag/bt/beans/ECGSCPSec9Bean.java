package com.vesag.bt.beans;

import java.util.Arrays;

//POJO for non real time ECGSCP Section 9 table 
public class ECGSCPSec9Bean extends ECGSCPSecBean{
		
	private int tagNumber1;
	
	private int contentLength1;
	
	private int content1;
	
	private int tagNumber2;
	
	private int contentLength2;
	
	private int content2;
	
	private int tagNumber3;
	
	private int contentLength3;
	
	private int content3;
	
	private int tagNumber4;
	
	private int contentLength4;
	
	private int content4;
	
	private int tagNumber5;
	
	private int contentLength5;
	
	private int content5;
	
	private int tagNumber6;
	
	private int contentLength6;
	
	private int content6;
	
	private int tagNumber7;
	
	private int contentLength7;
	
	private int content7;
	
	private int tagNumber8;
	
	private int contentLength8;
	
	private int content8;
	
	private int[] analysisDetails;

	

	public int getTagNumber1() {
		return tagNumber1;
	}

	public void setTagNumber1(int tagNumber1) {
		this.tagNumber1 = tagNumber1;
	}

	public int getContentLength1() {
		return contentLength1;
	}

	public void setContentLength1(int contentLength1) {
		this.contentLength1 = contentLength1;
	}


	public int getContent1() {
		return content1;
	}

	public void setContent1(int content1) {
		this.content1 = content1;
	}

	public int getTagNumber2() {
		return tagNumber2;
	}

	public void setTagNumber2(int tagNumber2) {
		this.tagNumber2 = tagNumber2;
	}

	public int getContentLength2() {
		return contentLength2;
	}

	public void setContentLength2(int contentLength2) {
		this.contentLength2 = contentLength2;
	}


	public int getContent2() {
		return content2;
	}

	public void setContent2(int content2) {
		this.content2 = content2;
	}

	public int getTagNumber3() {
		return tagNumber3;
	}

	public void setTagNumber3(int tagNumber3) {
		this.tagNumber3 = tagNumber3;
	}

	public int getContentLength3() {
		return contentLength3;
	}

	public void setContentLength3(int contentLength3) {
		this.contentLength3 = contentLength3;
	}


	public int getContent3() {
		return content3;
	}

	public void setContent3(int content3) {
		this.content3 = content3;
	}

	public int getTagNumber4() {
		return tagNumber4;
	}

	public void setTagNumber4(int tagNumber4) {
		this.tagNumber4 = tagNumber4;
	}

	public int getContentLength4() {
		return contentLength4;
	}

	public void setContentLength4(int contentLength4) {
		this.contentLength4 = contentLength4;
	}


	public int getContent4() {
		return content4;
	}

	public void setContent4(int content4) {
		this.content4 = content4;
	}

	public int getTagNumber5() {
		return tagNumber5;
	}

	public void setTagNumber5(int tagNumber5) {
		this.tagNumber5 = tagNumber5;
	}

	public int getContentLength5() {
		return contentLength5;
	}

	public void setContentLength5(int contentLength5) {
		this.contentLength5 = contentLength5;
	}


	public int getContent5() {
		return content5;
	}

	public void setContent5(int content5) {
		this.content5 = content5;
	}

	public int getTagNumber6() {
		return tagNumber6;
	}

	public void setTagNumber6(int tagNumber6) {
		this.tagNumber6 = tagNumber6;
	}

	public int getContentLength6() {
		return contentLength6;
	}

	public void setContentLength6(int contentLength6) {
		this.contentLength6 = contentLength6;
	}
 
	public int getContent6() {
		return content6;
	}

	public void setContent6(int content6) {
		this.content6 = content6;
	}

	public int getTagNumber7() {
		return tagNumber7;
	}

	public void setTagNumber7(int tagNumber7) {
		this.tagNumber7 = tagNumber7;
	}

	public int getContentLength7() {
		return contentLength7;
	}

	public void setContentLength7(int contentLength7) {
		this.contentLength7 = contentLength7;
	}


	public int getContent7() {
		return content7;
	}

	public void setContent7(int content7) {
		this.content7 = content7;
	}

	public int getTagNumber8() {
		return tagNumber8;
	}

	public void setTagNumber8(int tagNumber8) {
		this.tagNumber8 = tagNumber8;
	}

	public int getContentLength8() {
		return contentLength8;
	}

	public void setContentLength8(int contentLength8) {
		this.contentLength8 = contentLength8;
	}


	public int getContent8() {
		return content8;
	}

	public void setContent8(int content8) {
		this.content8 = content8;
	}

	public int[] getAnalysisDetails() {
		return analysisDetails;
	}

	public void setAnalysisDetails(int[] analysisDetails) {
		this.analysisDetails = analysisDetails;
	}
	
	

	@Override
	public String toString() {
		return "ECGSCPSec9 [crc=" + crc + ", sectionId=" + sectionId
				+ ", length=" + sectionLength + ", sectionVersion= 0x" + sectionVersion
				+ ", protocolVersion= 0x" + protocolVersion + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", tagNumber1="
				+ tagNumber1 + ", contentLength1=" + contentLength1
				+ ", content1=" + content1 + ", tagNumber2="
				+ tagNumber2 + ", contentLength2=" + contentLength2
				+ ", content2=" + content2 + ", tagNumber3="
				+ tagNumber3 + ", contentLength3=" + contentLength3
				+ ", content3=" + content3 + ", tagNumber4="
				+ tagNumber4 + ", contentLength4=" + contentLength4
				+ ", content4=" + content4 + ", tagNumber5="
				+ tagNumber5 + ", contentLength5=" + contentLength5
				+ ", content5=" + content5 + ", tagNumber6="
				+ tagNumber6 + ", contentLength6=" + contentLength6
				+ ", content6=" + content6 + ", tagNumber7="
				+ tagNumber7 + ", contentLength7=" + contentLength7
				+ ", content7=" + content7 + ", tagNumber8="
				+ tagNumber8 + ", contentLength8=" + contentLength8
				+ ", content8=" + content8
				+ ", analysisDetails=" + Arrays.toString(analysisDetails) + "]";
	}
	

}
