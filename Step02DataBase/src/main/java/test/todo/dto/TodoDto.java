package test.todo.dto;

public class TodoDto {
	private int num;
	private String needs;
	
	public TodoDto() {}
	
	public TodoDto(int num, String needs) {
		super();
		this.num = num;
		this.needs = needs;
	}



	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getNeeds() {
		return needs;
	}

	public void setNeeds(String needs) {
		this.needs = needs;
	}
	
	
}

