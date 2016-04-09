package io.github.capucho.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Getter;
import lombok.Setter;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank
	@Getter @Setter private String title;

	@Lob
	@NotBlank
	@Getter @Setter private String description;

	@Min(30)
	@Getter @Setter private int pages;

	@DateTimeFormat(iso=ISO.DATE)
	@Getter @Setter private Calendar releaseDate;
	
	@ElementCollection
	@Getter @Setter private List<Price> prices = new ArrayList<Price>();

}
