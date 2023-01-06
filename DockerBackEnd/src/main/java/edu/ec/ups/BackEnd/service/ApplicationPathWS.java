package edu.ec.ups.BackEnd.service;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.servers.Server;

@ApplicationPath("/ws")
@OpenAPIDefinition(info = @Info(title = "Menu API", description = "API de servicios Restful para listar un menu de comida ", version = "1.0"), servers = {@Server(description = "Servidor Wildfly", url = "/BackEnd")})
public class ApplicationPathWS extends Application {

}
