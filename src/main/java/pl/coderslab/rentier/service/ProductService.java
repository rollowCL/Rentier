package pl.coderslab.rentier.service;

import pl.coderslab.rentier.entity.Product;
import pl.coderslab.rentier.exception.InvalidFileException;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Optional;

public interface ProductService {

    Optional<File> saveProductImage(Part filePart, Product product, String uploadPath, String uploadPathForView)
            throws IOException, FileNotFoundException, InvalidFileException;

    void deleteProductImage(Optional<File> file);


}
