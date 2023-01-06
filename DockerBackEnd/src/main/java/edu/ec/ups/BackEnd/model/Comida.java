package edu.ec.ups.BackEnd.model;

import javax.persistence.*;

@Entity
public class Comida {
	
	@Id
	@GeneratedValue
	private int id;
	private String nombre;
	private String precio;
	private String calorias;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPrecio() {
		return precio;
	}
	public void setPrecio(String precio) {
		this.precio = precio;
	}
	public String getCalorias() {
		return calorias;
	}
	public void setCalorias(String calorias) {
		this.calorias = calorias;
	}
	

}
