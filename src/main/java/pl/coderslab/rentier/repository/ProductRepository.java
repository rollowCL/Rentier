package pl.coderslab.rentier.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;
import pl.coderslab.rentier.entity.Product;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long>, QuerydslPredicateExecutor<Product> {


    boolean existsByProductName(String productName);
    List<Product> findByProductCategoryId(Long id);
    List<Product>
    findByProductNameContaining(String productNameSearch);

    @Query(value = "SELECT p.image_file_name FROM products p WHERE p.id = :id", nativeQuery = true)
    String selectImageFileNameByProductId(@Param("id") Long id);


    @Query(value = "SELECT DISTINCT p2.* FROM products_shops ps JOIN product_sizes p on ps.product_size_id = p.id JOIN products p2 on ps.product_id = p2.id\n" +
            "            JOIN shops s on ps.shop_id = s.id JOIN brands b on p2.brand_id = b.id\n" +
            "            WHERE p.active = true AND p2.active = true AND p2.available_online = true AND b.active = true;", nativeQuery = true)
    List<Product> customFindDistinctProductsActiveForShop();


    @Query(value = "SELECT DISTINCT p2.* FROM products_shops ps JOIN product_sizes p on ps.product_size_id = p.id JOIN products p2 on ps.product_id = p2.id\n" +
            "            JOIN shops s on ps.shop_id = s.id JOIN brands b on p2.brand_id = b.id\n" +
            "            WHERE p.active = true AND p2.active = true AND p2.available_online = true AND b.active = true\n" +
            "            AND p2.product_category_id =:categoryId", nativeQuery = true)
    List<Product> customFindDistinctProductsActiveForShopByCategoryId(@Param("categoryId") Long id);


}
