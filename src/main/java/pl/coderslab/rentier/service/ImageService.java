package pl.coderslab.rentier.service;

import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.rentier.exception.InvalidFileException;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Optional;

public interface ImageService {

    String getFileName(Part part);
    void isValidFile(MultipartFile filePart) throws IOException, InvalidFileException;
    String saveImageToPath(MultipartFile filePart, String prefix, String uploadPath) throws IOException;
    String saveImageToPathLocal(MultipartFile filePart, String prefix, String uploadPath, String resourcePath) throws IOException;
    void deleteBlob(String fileName);
    String getBlobName(String fileName);
    void deleteLocalFile(String fileName);
    String generateRandomName(int len);

}
