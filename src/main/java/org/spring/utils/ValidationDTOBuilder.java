package org.spring.utils;

import org.spring.dto.ValidationDTO;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;

public class ValidationDTOBuilder {
	public static ValidationDTO fromBindingErrors(Errors errors) {
        ValidationDTO error = new ValidationDTO("Validation failed. " + errors.getErrorCount() + " error(s)");
        for (ObjectError objectError : errors.getAllErrors()) {
            error.addValidationError(objectError.getDefaultMessage());
        }
        return error;
    }
	
}
