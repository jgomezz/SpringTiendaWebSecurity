package pe.edu.tecsup.tienda.webs;

import lombok.extern.java.Log;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pe.edu.tecsup.tienda.entities.Usuario;

@Log
@Controller
@RequestMapping("/profile")
public class ProfileController {

	@GetMapping
	public String profile(@AuthenticationPrincipal Usuario usuario, Model model) {
		log.info("profile("+usuario+")");
		return "profile/index";
	}
}
