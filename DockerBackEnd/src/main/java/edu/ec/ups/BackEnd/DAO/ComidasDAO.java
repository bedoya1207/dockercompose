package edu.ec.ups.BackEnd.DAO;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import edu.ec.ups.BackEnd.model.Comida;


@Stateless
public class ComidasDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public void insert(Comida comida) {
		em.persist(comida);
	}

	public void update(Comida comida) {
		em.merge(comida);
	}
	
	public Comida read(int id) {
		return em.find(Comida.class, id);
	}
	
	public void delete(int id) {
		em.remove(id);
	}
	
	public List<Comida> getComidas(){
		String jpql = " SELECT comida FROM Comida comida ";
		Query query = em.createQuery(jpql, Comida.class);
		List<Comida> comidas = query.getResultList();
		return comidas;
	}
}
