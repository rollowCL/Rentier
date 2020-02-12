package pl.coderslab.rentier.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.rentier.entity.User;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;


public interface UserRepository extends JpaRepository<User, Long> {


    boolean existsByEmail(String email);

    Optional<User> findByEmailAndActiveTrue(String email);

    List<User> findByUserRoleId(Long id);

    List<User> findByLastNameContainingIgnoreCase(String searchName);

    @Modifying
    @Transactional
    @Query(value = "UPDATE users u SET u.user_role_id = :userRoleId WHERE u.id = :id", nativeQuery = true)
    void customUpdateUserRole(@Param("id") Long id, @Param("userRoleId") Long userRoleId);

}
