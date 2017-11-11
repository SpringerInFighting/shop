package cn.it.shop.util;

import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.FieldValidatorSupport;

public class ValidationCodeValidator extends FieldValidatorSupport {

	public String getSessionValidationCode() {
		return sessionValidationCode;
	}
	
	public void setSessionValidationCode(String sessionValidationCode) {
		System.out.println("sessionValidationCode:"+sessionValidationCode);
		this.sessionValidationCode = sessionValidationCode;
	}
	
	private String sessionValidationCode;
	private boolean trim = true;
	@Override
	public void validate(Object o) throws ValidationException {
		// TODO Auto-generated method stub

		Object objValidateCode = getFieldValue(sessionValidationCode, o);
		System.out.println("objValidateCode："+objValidateCode);
        String fieldName = getFieldName();
        System.out.println("fieldName："+fieldName);
        String fieldValue = (String) getFieldValue(fieldName, o);//客户端输入的验证码
        System.out.println("fieldValue："+fieldValue);
        if (fieldValue == null)
            return;
        if (trim)
            fieldValue = fieldValue.trim();
        if (fieldValue.length() == 0) {

            return;
        }
        if (!fieldValue.equals(objValidateCode)) {
            addFieldError(fieldName, o);
            
        }
	}

}
