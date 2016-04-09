package io.github.capucho.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import io.github.capucho.model.Product;

public class ProductValidator implements Validator {

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "field.required");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.required");

		
		Product product = (Product) target;
		
		if(product.getPages() == 0)
		{
			errors.rejectValue("pages", "field.required");
		}
		

	}

	@Override
	public boolean supports(Class<?> arg0) {
		// Essa classe recebe uma classe como argumento e verifica se esse validator
		// consegue validar os campos da classe recebida
		return Product.class.isAssignableFrom(arg0);
	}

}
