package kr.or.ddit.validate;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import org.hibernate.validator.messageinterpolation.ResourceBundleMessageInterpolator;
import org.hibernate.validator.resourceloading.PlatformResourceBundleLocator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ValidateUtils<T> {
	
	private static Validator validator;
	
	static {
		validator = Validation.byDefaultProvider()
		        .configure()
		        .messageInterpolator(
		                new ResourceBundleMessageInterpolator(
		                        new PlatformResourceBundleLocator( "kr.or.ddit.msgs.message" )
		                )
		        )
		        .buildValidatorFactory()
		        .getValidator();
	}
	
	public Map<String, String> validate(T target, Class...groups) {
		Set<ConstraintViolation<T>> violations = validator.validate(target, groups);
		Map<String, String> errors = new HashMap<>();
		for(ConstraintViolation violation : violations) {
			String propertyName = violation.getPropertyPath().toString();
			String message = violation.getMessage();
			log.info("{} : {}", propertyName, message);
			errors.put(propertyName, message);
		}
		return errors;
	}
}
