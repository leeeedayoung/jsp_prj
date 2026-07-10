package xml0709;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * 조회한 결과를 사용하여 XML을 생성
 */
public class DeptService {
	
	public Document searchAllDept() {
		//1.XML 문서 객체 설정
		Document xmlDoc=new Document();//<? xml version="1.0" ?>
		//2.최상위 부모노드 생성
		Element deptsNode=new Element("depts");//<depts/>
		//3.부모노드를 xml 문서 객체에 추가
		xmlDoc.addContent(deptsNode);
		//4.반복되는 자식 노드 <dept/>를 생성
		Element deptNode=null;//<dept/>
		Element deptnoNode=null;//<deptno/>
		Element dnameNode=null;//<dname/>
		Element locNode=null;//<loc/>
		
		DeptDAO dDAO=DeptDAO.getInstance();
		try {
			//데이터의 부가적인 정보 생성
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Element pubDateNode=new Element("pubDate");
			pubDateNode.setText(sdf.format(new Date()));
			Element resultNode=new Element("result");
			resultNode.setText(String.valueOf(false));
			
			//부가적인 정보들을 최상위 부모노드에 추가
			deptsNode.addContent(pubDateNode);
			
			List<DeptDTO> list=dDAO.selectAllDept();
			resultNode.setText(String.valueOf(true));
			
			deptsNode.addContent(resultNode);
			
			for(DeptDTO dDTO : list) {
				//deptNode 생성
				deptNode=new Element("dept");//<dept/>
				deptnoNode=new Element("deptno");//<deptno/>
				dnameNode=new Element("dname");//<dname/>
				locNode=new Element("loc");//<loc/>
				//자식 노드에 검색 값 설정
				deptnoNode.setText(String.valueOf(dDTO.getDeptno()));
				dnameNode.setText(dDTO.getDname());
				locNode.setText(dDTO.getLoc());
				//자식 노드들을 deptNode 추가
				deptNode.addContent(deptnoNode);
				deptNode.addContent(dnameNode);
				deptNode.addContent(locNode);
				//자식 노드들을 가진 노드를 최상위 부모 노드 (<depts> node)에 추가
				deptsNode.addContent(deptNode);
			}//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		
		return xmlDoc;
	}//searchAllDept
	
	public void consolePrint() throws IOException {
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		xOut.output(searchAllDept(), System.out);
	}//consolePrint
	
	public void createFile(String path) throws IOException {
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		FileOutputStream fos=new FileOutputStream(path);
		xOut.output(searchAllDept(), fos);
		if( fos != null) { fos.close(); }
	}//createFile
	
	public void webBrowerPrint(JspWriter out) throws IOException {
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		xOut.output(searchAllDept(), out);
	}//webBrowerPrint
}
