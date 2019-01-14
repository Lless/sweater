package com.vk.id26639136.sweater.domain.util;

import com.vk.id26639136.sweater.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "";
    }
}
