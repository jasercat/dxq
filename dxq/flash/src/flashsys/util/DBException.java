package flashsys.util;
public class DBException extends BaseException {
	public DBException(java.lang.Throwable ex){
		super("���ݿ��������"+ex.getMessage());
	}
}
