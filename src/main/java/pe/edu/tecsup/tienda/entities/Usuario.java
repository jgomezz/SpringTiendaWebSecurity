package pe.edu.tecsup.tienda.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "usuarios")
public class Usuario implements UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "roles_id")
	private Rol rol;
	private String email;
	private String password;
	private String nombres;
	private String apellidos;
	private String sexo;
	private Date fecnacimiento;
	private String telefono;
	private String direccion;
	private Integer estado;

	// Credentials

	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return this.email;
	}
	
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", rol=" + rol + ", email=" + email + ", password=" + password + ", nombres="
				+ nombres + ", apellidos=" + apellidos + ", sexo=" + sexo + ", fecnacimiento=" + fecnacimiento
				+ ", telefono=" + telefono + ", direccion=" + direccion + ", estado=" + estado + "]";
	}

	// Spring Security

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<Rol> authorities = new ArrayList<>();
		authorities.add(this.rol);
		return authorities;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true; // false: User account has expired
	}
	@Override
	public boolean isAccountNonLocked() {
		return true; // false: User account is locked
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// Change username field
		return true; // false: User credentials have expired
	}
	@Override
	public boolean isEnabled() {
		return this.estado != null && this.estado == 1;
	}
}
