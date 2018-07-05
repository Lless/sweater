package com.vk.id26639136.sweater.repos;

import com.vk.id26639136.sweater.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message,Long> {

    List<Message> findByTag(String tag);
}
