package simplemvc.command;

public class GenderCommand implements Command{

	@Override
	public Object returnModel() throws Exception {
		// TODO Auto-generated method stub
		return "남";
	}

	@Override
	public Object returnView() throws Exception {
		// TODO Auto-generated method stub
		return "jsp/gender.jsp";
	}

}
