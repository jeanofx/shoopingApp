package com.shooping.ecommerce.service.controller;

import com.shooping.ecommerce.service.entity.DocumentoAlmacenado;
import com.shooping.ecommerce.service.entity.StorageDocument;
import com.shooping.ecommerce.service.service.StorageDocumentService;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("api/storage-document")
public class StorageDocumentController {
    public StorageDocumentService service;

    public StorageDocumentController(StorageDocumentService service) {
        this.service = service;
    }

    @GetMapping
    public GenericResponse list() {
        return service.list();
    }

    @GetMapping("/{id}")
    public GenericResponse find(@PathVariable Long id) {
        return null;
    }

    @GetMapping("/download/{fileName}")
    public ResponseEntity<Resource> download(@PathVariable String fileName, HttpServletRequest request) {
        return service.downloadByFileName(fileName, request);
    }

    @PostMapping
    public GenericResponse save(@ModelAttribute StorageDocument obj) {
        return service.save(obj);
    }

    public GenericResponse update(Long aLong, DocumentoAlmacenado obj) {
        return null;
    }
    
    public GenericResponse delete(Long aLong) {
        return null;
    }
}
