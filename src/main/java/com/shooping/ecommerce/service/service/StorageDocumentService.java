package com.shooping.ecommerce.service.service;

import com.shooping.ecommerce.service.entity.DocumentoAlmacenado;
import com.shooping.ecommerce.service.entity.StorageDocument;
import com.shooping.ecommerce.service.repository.StorageDocumentRepository;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import com.shooping.ecommerce.service.utlis.Global;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;


@Service
@Transactional
public class StorageDocumentService {
    private StorageDocumentRepository repo;
    private FileStorageService storageService;

    public StorageDocumentService(StorageDocumentRepository repo, FileStorageService storageService) {
        this.repo = repo;
        this.storageService = storageService;
    }

    public GenericResponse<Iterable<StorageDocument>> list() {
        return new GenericResponse<Iterable<StorageDocument>>(Global.TIPO_RESULT, Global.RPTA_OK, Global.OPERACION_CORRECTA, repo.list());
    }


    public GenericResponse<Long> find(Long aLong) {
        return null;
    }


    public  GenericResponse save(StorageDocument obj) {
        String fileName = (repo.findById(obj.getId())).orElse(new StorageDocument()).getFileName();

        String originalFilename = obj.getFile().getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

        fileName = storageService.storeFile(obj.getFile(), fileName);

        obj.setFileName(fileName);
        obj.setExtension(extension);

        return new GenericResponse<>(Global.TIPO_DATA, Global.RPTA_OK, Global.OPERACION_CORRECTA,repo.save(obj));
    }

    public ResponseEntity<Resource> download(String completefileName, HttpServletRequest request) {
        Resource resource = storageService.loadResource(completefileName);
        String contentType = null;

        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    public ResponseEntity<Resource> downloadByFileName(String fileName, HttpServletRequest request) {
        StorageDocument doc = repo.findByFileName(fileName).orElse(new StorageDocument());
        return download(doc.getCompleteFileName(), request);
    }


    public GenericResponse <Long> delete(Long aLong) {
        return null;
    }

    public HashMap<String, Object> validate(StorageDocument obj) {
        return null;
    }
}
