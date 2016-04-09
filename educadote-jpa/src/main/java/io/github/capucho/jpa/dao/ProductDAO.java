package io.github.capucho.jpa.dao;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import io.github.capucho.jpa.model.Product;

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
		
		products = entityManager.createQuery("select distinct p from Product p join fetch p.prices pri", Product.class).getResultList();
		
		return products;
		
	}

	public Product find(Integer id)
	{
		return (Product) entityManager.createQuery("select distinct(p) from Product p join fetch p.prices where p.id=:id")
				.setParameter("id", id)
				.getSingleResult();
		
		
	}
	
	
}
