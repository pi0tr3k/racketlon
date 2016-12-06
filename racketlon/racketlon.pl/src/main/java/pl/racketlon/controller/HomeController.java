package pl.racketlon.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pl.racketlon.dao.ProductDao;
import pl.racketlon.model.Product;;

@Controller
public class HomeController {

	private Path path;
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	@RequestMapping("/productList")
	public String getProducts(Model model) {
		//List<Product> productList = productDao.getProductList();
		List<Product> products = productDao.getAllProducts();
		//Product product = productList.get(0); // mamy tylko 1 produkt
		
		model.addAttribute("products",products);
		// do widoku productList zostanie przypiêty model, który
		// wczeœniej powi¹zaliœmy z produktem
		return "productList"; // nazwa pliku jsp
	}
	/*@RequestMapping("/productList/viewProduct")
	public String viewProduct() {
		return "viewProduct";
	}*/
	@RequestMapping("/productList/viewProduct/{productId}")
	public String viewProduct(@PathVariable int productId, Model model) throws IOException {
		Product product = productDao.getProductById(productId);
		model.addAttribute(product);
		return "viewProduct";
	}
	
	@RequestMapping("/admin")
	public String adminPage() {
		return "admin";
	}
	@RequestMapping("/admin/productInventory")
	public String productInventory(Model model) {
		List<Product> products = productDao.getAllProducts();		
		model.addAttribute("products",products);
		return "productInventory"; // nazwa pliku jsp
	}
	// domyœlnie requestMethod = GET
	@RequestMapping("/admin/productInventory/addProduct")
	public String addProduct(Model model) {
		Product product = new Product();
		product.setProductCategory("Tenis ziemny");
		product.setProductCondition("Nowy");
		product.setProductStatus("W magazynie");
		model.addAttribute("product",product);
		return "addProduct"; // nazwa pliku jsp
	}
	@RequestMapping(value = "/admin/productInventory/addProduct", method=RequestMethod.POST)
	// model jest ju¿ gotowy po wciœniêciu submit na formularzu
	public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "addProduct";
		}
		productDao.addProduct(product);
		// zapisanie obrazka dla dodawanego produktu (nazwa zdjecia to productId.png)
		MultipartFile productImage = product.getProductImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");
		System.out.println("\tŒcie¿ka: "+path.toString());
		//String path = "D:\\Private\\Java\\Spring\\racketlon\\src\\main\\webapp\\WEB-INF\\resources\\images\\"+product.getProductId()+".png";
		if(productImage != null && !productImage.isEmpty()) {
			try {
				productImage.transferTo(new File(path.toString()));
				//productImage.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Nie uda³o siê zapisaæ zdjêcia",e);
			}
		}
		
		// nie zwracamy nazwy strony jsp tylko pathName, aby wyœwietliæ wszystkie produkty
		return "redirect:/admin/productInventory";
	}
	@RequestMapping("/admin/productInventory/deleteProduct/{id}")
	public String deleteProduct(@PathVariable int id, Model model, HttpServletRequest request) {
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+id+".png");
		
		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		productDao.deleteProduct(id);
		
		return "redirect:/admin/productInventory";
	}
	
	@RequestMapping("/admin/productInventory/editProduct/{id}")
	public String editProduct(@PathVariable int id, Model model) {
		Product product = productDao.getProductById(id);
		model.addAttribute(product);
		return "editProduct";
	}
	
	@RequestMapping(value = "/admin/productInventory/editProduct", method=RequestMethod.POST)
	public String editProduct(@Valid @ModelAttribute("product") Product product, Model model, 
								BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "editProduct";
		}
		MultipartFile productImage = product.getProductImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");
		
		if(productImage != null && !productImage.isEmpty()) {
			try {
				productImage.transferTo(new File(path.toString()));
			} catch (Exception e) {
				throw new RuntimeException("Nie uda³o siê zapisaæ zdjêcia",e);
			}
		}
		
		productDao.editProduct(product);
		
		return "redirect:/admin/productInventory";
	}
	
	@RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout, Model model){
        if (error != null) {
            model.addAttribute("error", "Nieprawid³owa nawa u¿ytkownika lub has³o.");
        }
        if (logout != null) {
            model.addAttribute("logout", "Zosta³eœ pomyœlnie wylogowany.");
        }
        return "login";
    }
	
}
