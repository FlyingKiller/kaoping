package com.kaoping.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.kaoping.entities.Standard;
import com.kaoping.entities.StandardContent;
import com.kaoping.entities.Teacher;
import com.kaoping.service.StandardService;
import com.kaoping.tool.Content;
import com.kaoping.tool.Page;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author ASUS
 *
 */
@Controller("StandardAction")
@Scope("session")
public class StandardAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3854226307990728066L;
	private String academy;
	@Autowired
	private StandardService standardService;
	private int nowPage;
	private String standardName;
	private InputStream inputStream;
	private double excellent;
	private double eligibility;
	private double jeligibility;
	private double beligibility;
	private double sameacademyweight;
	private double sameweight;
	private double schoolweight;
	private String teacherId;
	private int standardId;
	private List<Content> content = new ArrayList<Content>();

	public double getSameacademyweight() {
		return sameacademyweight;
	}

	public void setSameacademyweight(double sameacademyweight) {
		this.sameacademyweight = sameacademyweight;
	}

	public double getSameweight() {
		return sameweight;
	}

	public void setSameweight(double sameweight) {
		this.sameweight = sameweight;
	}

	public double getSchoolweight() {
		return schoolweight;
	}

	public void setSchoolweight(double schoolweight) {
		this.schoolweight = schoolweight;
	}

	public int getStandardId() {
		return standardId;
	}

	public void setStandardId(int standardId) {
		this.standardId = standardId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public double getExcellent() {
		return excellent;
	}

	public void setExcellent(double excellent) {
		this.excellent = excellent;
	}

	public double getEligibility() {
		return eligibility;
	}

	public void setEligibility(double eligibility) {
		this.eligibility = eligibility;
	}

	public double getJeligibility() {
		return jeligibility;
	}

	public void setJeligibility(double jeligibility) {
		this.jeligibility = jeligibility;
	}

	public double getBeligibility() {
		return beligibility;
	}

	public void setBeligibility(double beligibility) {
		this.beligibility = beligibility;
	}

	public List<Content> getContent() {
		return content;
	}

	public void setContent(List<Content> content) {
		this.content = content;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getStandardName() {
		return standardName;
	}

	public void setStandardName(String standardName) {
		this.standardName = standardName;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	private Map session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public void setStandardService(StandardService standardService) {
		this.standardService = standardService;
	}

	public String getStandard() throws UnsupportedEncodingException {
		Teacher currentUser = (Teacher) session.get("currentUser");
		String newacademy = currentUser.getAcademy();
		Page page = new Page(standardService.getStandardRow(newacademy), nowPage);
		List<Standard> standardList = standardService.getStandardByPage(newacademy, page);
		session.put("standardList", standardList);
		session.put("standardPage", page);
		return SUCCESS;
	}

	public String checkStandardName() throws UnsupportedEncodingException {
		if (standardService.checkStandardName(standardName)) {
			inputStream = new ByteArrayInputStream("".getBytes("utf-8"));
		} else {
			inputStream = new ByteArrayInputStream("标准已存在".getBytes("utf-8"));
		}
		return SUCCESS;
	}

	public String addStandard() throws UnsupportedEncodingException {
		System.out.println(sameacademyweight + " " + sameweight + "  " + schoolweight + "ddddddddd");
		Standard standard = new Standard(standardName, teacherId, schoolweight, academy, sameweight, sameacademyweight,
				excellent * 100, eligibility * 100, jeligibility * 100, beligibility * 100);
		standardService.addStandard(standard);
		for (int i = 0; i < content.size(); i++) {
			StandardContent standardContent = new StandardContent(content.get(i).getName(), content.get(i).getPercent(),
					standardName);
			standardService.addStandardContent(standardContent);
			session.put("content", content);
			session.put("standardSuccess", standard);
		}
		return SUCCESS;
	}

	public String deleteStandard() throws UnsupportedEncodingException {
		standardService.deleteStandard(new String(standardName.getBytes("iso_8859_1"), "utf-8"));
		inputStream = new ByteArrayInputStream("标准已删除".getBytes("utf-8"));
		getStandard();
		return SUCCESS;
	}

	public String getStandardDetail() {
		List<StandardContent> standardContentList = standardService.getStandardDetail(standardId);
		List<Standard> standardBList = standardService.getStandardDetailB(standardId);
		session.put("standardContentList", standardContentList);
		session.put("standardBList", standardBList.get(0));
		return SUCCESS;
	}

}
