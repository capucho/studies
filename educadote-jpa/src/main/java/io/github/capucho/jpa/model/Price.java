package io.github.capucho.jpa.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import io.github.capucho.jpa.util.enumerators.BookType;
import lombok.Getter;
import lombok.Setter;

@Embeddable
public class Price {

	@Column(scale = 2)
	@Getter @Setter private BigDecimal value;
	@Getter @Setter private BookType bookType;

}