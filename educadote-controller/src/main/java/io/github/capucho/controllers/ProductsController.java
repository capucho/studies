package io.github.capucho.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.github.capucho.jpa.dao.ProductDAO;
import io.github.capucho.jpa.model.Product;
import io.github.capucho.jpa.util.enumerators.BookType;
import io.github.capucho.util.file.FileSaver;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController
{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileSaver fileSaver;

	// @InitBinder
	// protected void initBinder(WebDataBinder binder) {
	// binder.setValidator(new ProductValidator());
	// }

	@RequestMapping(method = RequestMethod.POST, name = "saveProduct")
	public ModelAndView save(MultipartFile summary, @Valid Product product,
			BindingResult bindingResult, RedirectAttributes redirectAttributes)
	{

		if (bindingResult.hasErrors())
		{
			return form(product);
		}
		
		String webPath = fileSaver.write("uploaded-images", summary);
		product.setSummaryPath(webPath);
				
		productDAO.save(product);
		// ModelAndView modelAndView = new ModelAndView("redirect:produtos");

		// modelAndView.addObject("sucesso", "Produto cadastrado com sucesso");
		// return modelAndView;

		redirectAttributes.addFlashAttribute("sucesso",
				"Produto cadastrado com sucesso");
		// Pattern:
		// Always Redirect After Post!!
		return new ModelAndView("redirect:/produtos");

	}

	@RequestMapping("/form")
	public ModelAndView form(Product product)
	{
		ModelAndView modelAndView = new ModelAndView("products/form");

		modelAndView.addObject("types", BookType.values());

		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list()
	{
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());

		return modelAndView;
	}
	
	
	@RequestMapping("/{id}")
	public ModelAndView show(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView = new ModelAndView("products/show");
		
		Product product = productDAO.find(id);
		
		modelAndView.addObject("product", product);
		
		return modelAndView;
	}

}
