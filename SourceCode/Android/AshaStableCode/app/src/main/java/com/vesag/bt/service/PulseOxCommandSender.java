package com.vesag.bt.service;


import com.vesag.bt.beans.PulseOximeterCommand;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.CRC8Check;

public class PulseOxCommandSender {

		
	//This method creates the command and returns it back in the form of byte array
	public static PulseOximeterCommand getCommand(String commandType) throws ApplicationException{
		CRC8Check util = new CRC8Check();
		PulseOximeterCommand command = new PulseOximeterCommand();
		command.setHead1((byte)0xaa);
		command.setHead2((byte)0x55);
		command.setToken((byte)0x0f);
		if(commandType.equalsIgnoreCase("Query")){
			command.setLength((byte)0x02);
			command.setCommand(new byte[] {(byte)0x83});
		}else if(commandType.equalsIgnoreCase("Parameter")){
			command.setLength((byte)0x03);
			command.setCommand(new byte[] {(byte)0x84,(byte)0x01});
		}else if(commandType.equalsIgnoreCase("Waveform")){
			command.setLength((byte)0x03);
			command.setCommand(new byte[] {(byte)0x85,(byte)0x01});
		}else if(commandType.equalsIgnoreCase("Heartbeat")){
			command.setLength((byte)0x03);
			command.setCommand(new byte[] {(byte)0x80,(byte)0x05});
		}
		command.setCrc(util.getPulseOXCommandCRC(command));

		return command;
	}
	

}
