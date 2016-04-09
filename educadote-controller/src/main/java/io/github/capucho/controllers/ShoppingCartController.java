package io.github.capucho.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import io.github.capucho.jpa.dao.ProductDAO;
import io.github.capucho.jpa.model.Product;
import io.github.capucho.jpa.model.ShoppingCart;
import io.github.capucho.jpa.model.ShoppingItem;
import io.github.capucho.jpa.util.enumerators.BookType;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartController
{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ShoppingCart shoppingCart;
	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView add(Integer productId, BookType bookType){
		ShoppingItem item = createItem(productId, bookType);
		
		shoppingCart.add(item);
		
		//Pattern: always redirect after POST.
		return new ModelAndView("redirect:/produtos");
	}
	
	private ShoppingItem createItem(Integer productId, BookType bookType){
		
		Product product = productDAO.find(productId);
		
		ShoppingItem item = new ShoppingItem(product, bookType);
		
		return item;
		
	}
	
}
