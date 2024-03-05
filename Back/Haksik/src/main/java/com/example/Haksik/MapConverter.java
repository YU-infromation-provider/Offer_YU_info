package com.example.Haksik;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

import java.util.List;
import java.util.Map;

@Converter
public class MapConverter implements AttributeConverter<Map<String,Double>,String> {
    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    public String convertToDatabaseColumn(Map<String,Double> dataList){
        try{
            return mapper.writeValueAsString(dataList);
        }catch(JsonProcessingException e){
            throw new RuntimeException(e);
        }
    }
    @Override
    public Map<String,Double> convertToEntityAttribute(String data){
        try{
            return mapper.readValue(data,Map.class);
        }catch (JsonProcessingException e){
            throw new RuntimeException(e);
        }
    }
}
