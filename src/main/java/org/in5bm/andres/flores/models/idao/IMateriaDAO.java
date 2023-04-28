package org.in5bm.andres.flores.models.idao;

import java.util.List;
import org.in5bm.andres.flores.models.domain.Materia;

/**
 * @author F 
 */
public interface IMateriaDAO {
    public List<Materia> getAll();
    
    public int add(Materia materia);
    
    public int update(Materia materia);
    
    public int delete(Materia materia);
}
