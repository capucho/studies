package io.github.capucho.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.github.capucho.model.Product;
import io.github.capucho.model.ProductDAO;
import io.github.capucho.util.enumerators.BookType;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController {

	@Autowired
	ProductDAO productDAO;

//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		binder.setValidator(new ProductValidator());
//	}

	@RequestMapping(method = RequestMethod.POST, name="saveProduct")
	public ModelAndView save(@Valid Product product, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {
		// Pattern:
		// Always Redirect After Post!!
		if(bindingResult.hasErrors()){
			return form(product);
		}
		productDAO.save(product);
		//ModelAndView modelAndView = new ModelAndView("redirect:produtos");

		//modelAndView.addObject("sucesso", "Produto cadastrado com sucesso");
		//return modelAndView;
		
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso");
		
		return new ModelAndView("redirect:produtos");
		
	}

	@RequestMapping("/form")
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");

		modelAndView.addObject("types", BookType.values());

		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());

		return modelAndView;
	}

}
