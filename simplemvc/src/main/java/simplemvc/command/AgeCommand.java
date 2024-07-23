package simplemvc.command;

public class AgeCommand implements Command{

	@Override
	public Object returnModel(){
		return 19;
	}

	@Override
	public Object returnView(){
		// TODO Auto-generated method stub
		return "jsp/age.jsp";
	}

}
