package edu.ec.ups.BackEnd.service;


import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.metrics.MetricUnits;
import org.eclipse.microprofile.metrics.annotation.Counted;
import org.eclipse.microprofile.metrics.annotation.Timed;
import org.eclipse.microprofile.opentracing.Traced;

import edu.ec.ups.BackEnd.DAO.ComidasDAO;
import edu.ec.ups.BackEnd.model.Comida;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;


@Path("comidas")
public class ComidasWSRestful {
	@Inject
	private ComidasDAO dao;
	
	@POST
	@Path("insertar")
	@Traced(operationName = "comida-json")
	@Counted(description = "Contador insertar platillos ", absolute = true)
	@Timed(name = "nuevoPlatillo-time", description = "Tiempo de procesamiento al ingresar un nuevo platillo", unit = MetricUnits.MILLISECONDS, absolute = true)
	@Operation(summary = "Nuevo platillo", description = "Registra una nuevo platillo.", responses = {
			@ApiResponse(description = "Platillo nuevo registrado", content = @Content(mediaType = "application/json"), responseCode = "200")
	})
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Mensaje registrarPelicula(Comida comida) {
		Mensaje  msj = new Mensaje();
		dao.insert(comida);
		msj.setCodigo("01");
		msj.setMensaje("OK");
		return msj;
	}
	
	
	@GET
	@Path("listar")
	@Traced(operationName = "listar-comida-json")
	@Counted(description = "Contador enlistado platillos ", absolute = true)
	@Timed(name = "listarPlatillo-time", description = "Tiempo de procesamiento al listar los platillos", unit = MetricUnits.MILLISECONDS, absolute = true)
	@Operation(summary = "Listar Platillos", description = "Lista de platillos ingresados",responses = {
			@ApiResponse(description = "Listado Correctamente", content = @Content(mediaType = "application/json"), responseCode = "200")
	})
	@Produces(MediaType.APPLICATION_JSON)
	public List<Comida> listar(){
		return dao.getComidas();
	}
}
