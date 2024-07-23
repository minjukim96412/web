package simplemvc.command;

public class HobbyCommand implements Command{

	@Override
	public Object returnModel(){
		// TODO Auto-generated method stub
		return "축구";
	}

	@Override
	public Object returnView(){
		// TODO Auto-generated method stub
		return "jsp/hobby.jsp";
	}

}
