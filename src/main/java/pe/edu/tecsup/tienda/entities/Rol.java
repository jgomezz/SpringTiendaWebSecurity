package pe.edu.tecsup.tienda.entities;


import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;

@Getter
@Setter
@ToString
@Entity
@Table(name = "roles")
public class Rol implements GrantedAuthority {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nombre;

	// Spring Security
	@Override
	public String getAuthority() {
		return this.nombre;
	}
}
