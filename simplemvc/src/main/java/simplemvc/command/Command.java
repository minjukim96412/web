package simplemvc.command;

public interface Command {
	public abstract Object returnModel() throws Exception;
	public abstract Object returnView() throws Exception;
}
