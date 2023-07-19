package com.example.eval.model;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimestampEditor extends PropertyEditorSupport {

    public TimestampEditor() {
        super();
    }

    @Override
    public String getAsText() {
        Timestamp timestamp = (Timestamp) getValue();
        return timestamp == null ? null : timestamp.toString();
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime time = LocalDateTime.parse(text,formatter);
        setValue(Timestamp.valueOf(time));
    }
}
