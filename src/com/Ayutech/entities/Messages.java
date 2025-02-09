package com.Ayutech.entities;

public class Messages {
	
	private String content;
	private String type;
	private String cssFile;
	
	public Messages(String content,String type,String cssFile)
	{
		this.content=content;
		this.type=type;
		this.cssFile=cssFile;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCssFile() {
		return cssFile;
	}

	public void setCssFile(String cssFile) {
		this.cssFile = cssFile;
	}
	
	
}
