package org.kosta.toma.controller;

import java.io.File;

/*
 * 클라이언트 요청 처리를 담당하는 컨트롤러 객체 생성을 전담 
 * 시스템 상에서 인스턴스를 하나 생성하여 공유해 사용하면 되므로 
 * Singleton Pattern을 적용했음 
 */
public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return instance;
	}

	// ver 6 : Reflection API 를 이용해 런타임시 동적으로 객체 생성 , 제어
	public Controller create(String command)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		// 런타임시에 command 전달받아 컨트롤러 객체 생성해 반환 => 연결자 역할
		/*
		 * String packageInfo=this.getClass().getPackage().getName();
		 * System.out.println("packageInfo:"+packageInfo);
		 * System.out.println("command:"+command);
		 * System.out.println(packageInfo+"."+command+"Controller");
		 */

		String webAppPath="C:\\kosta260\\was\\web-tomcat\\webapps\\TOMAHAWK\\WEB-INF\\classes\\org\\kosta\\toma\\controller";
		File webAppPathDir=new File(webAppPath);
		File fileList[]=webAppPathDir.listFiles();
		String subPackageName=null;
		exit:
		for(int i=0;i<fileList.length;i++) {
			if(fileList[i].isFile()&&fileList[i].getName().equals(command+"Controller.class")) {				
				break;
			}else if(fileList[i].isDirectory()) {			
				File subDirList[]=fileList[i].listFiles();
				for(int j=0;j<subDirList.length;j++) {	
					if(subDirList[j].isFile()&&subDirList[j].getName().equals(command+"Controller.class")) {
						subPackageName=fileList[i].getName();
						break exit;
					}
				}
			}
		}	
		StringBuilder classInfo = new StringBuilder(this.getClass().getPackage().getName());	
		if(subPackageName==null) {			
			classInfo.append(".").append(command).append("Controller");
		}else {
			classInfo.append(".").append(subPackageName).append(".").append(command).append("Controller");
		}
		
		/*
		 * StringBuilder classInfo = new
		 * StringBuilder(this.getClass().getPackage().getName());
		 * classInfo.append(".").append(command).append("Controller");
		 */
		return (Controller) Class.forName(classInfo.toString()).newInstance();
	}

	/*
	 * // ver 5 public Controller create(String command) { Controller controller =
	 * null; if (command.equals("findbyid")) { controller = new
	 * FindCustomerByIdController(); } else if (command.equals("register")) { // 고객
	 * 등록 controller = new RegisterController(); } else if
	 * (command.equals("updateCustomer")) { controller = new
	 * UpdateCustomerController(); } else if (command.equals("deleteCustomer")) {
	 * controller = new DeleteCustomerController(); } return controller; }
	 */
}