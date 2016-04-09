package io.github.capucho.model;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@PersistenceContext
	EntityManager entityManager;
	
	public void save(Product product)
	{
		entityManager.persist(product);
	}

	public Collection<Product> list() {
		Collection<Product> products = null;
		
		products = entityManager.createQuery("select distinct p from Product p join fetch p.prices", Product.class).getResultList();
		
		return products;
		
	}
	
	
}
