package f5074.spring.common.domain;

import java.util.Date;

public class SampleVO {

	public String getAthlete() {
		return athlete;
	}
	public Integer getAge() {
		return age;
	}
	public String getCountry() {
		return country;
	}
	public Integer getYear() {
		return year;
	}
	public Date getDate() {
		return date;
	}
	public String getSport() {
		return sport;
	}
	public Integer getGold() {
		return gold;
	}
	public Integer getSilver() {
		return silver;
	}
	public Integer getBronze() {
		return bronze;
	}
	public Integer getTotal() {
		return total;
	}
	public void setAthlete(String athlete) {
		this.athlete = athlete;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setSport(String sport) {
		this.sport = sport;
	}
	public void setGold(Integer gold) {
		this.gold = gold;
	}
	public void setSilver(Integer silver) {
		this.silver = silver;
	}
	public void setBronze(Integer bronze) {
		this.bronze = bronze;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	private String athlete;
	private Integer age;
	private String country;
	private Integer year;
	private Date date;
	private String sport;
	private Integer gold;
	private Integer silver;
	private Integer bronze;
	private Integer total;
}
