package josh.cart.model;

import java.sql.SQLException;
import java.util.List;

public interface InterCartDAO {

	List<CartDTO> selectCart(String userid) throws SQLException;

}
