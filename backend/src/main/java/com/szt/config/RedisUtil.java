package com.szt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Component
public  class RedisUtil implements Serializable{

    @Autowired
     private RedisTemplate redisTemplate;

    public RedisUtil() {
    }

    public void remove(String... keys) {
        String[] var2 = keys;
        int var3 = keys.length;

        for(int var4 = 0; var4 < var3; ++var4) {
            String key = var2[var4];
            this.remove(key);
        }

    }

    public void removePattern(String pattern) {
        Set<Serializable> keys = this.redisTemplate.keys(pattern);
        if (keys.size() > 0) {
            this.redisTemplate.delete(keys);
        }

    }

    public void remove(String key) {
        if (this.exists(key)) {
            this.redisTemplate.delete(key);
        }

    }

    public boolean exists(String key) {
        return this.redisTemplate.hasKey(key);
    }

    public Object get(String key) {
        Object result = null;
        ValueOperations<Serializable, Object> operations = this.redisTemplate.opsForValue();
        result = operations.get(key);
        return result;
    }

    public boolean set(String key, Object value) {
        boolean result = false;

        try {
            ValueOperations<Serializable, Object> operations = this.redisTemplate.opsForValue();
            operations.set(key, value);
            result = true;
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return result;
    }

    public boolean set(String key, Object value, Long expireTime) {
        boolean result = false;

        try {
            ValueOperations<Serializable, Object> operations = this.redisTemplate.opsForValue();
            operations.set(key, value);
            this.redisTemplate.expire(key, expireTime, TimeUnit.SECONDS);
            result = true;
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return result;
    }

    public boolean setHash(String key1, String key2, Object value) {
        boolean result = false;

        try {
            this.redisTemplate.opsForHash().put(key1, key2, value);
            result = true;
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return result;
    }

    public Object getHash(String key1, String key2) {
        Object result = null;
        result = this.redisTemplate.opsForHash().get(key1, key2);
        return result;
    }

    public Object getHashs(String key) {
        Object result = null;
        result = this.redisTemplate.opsForHash().entries(key);
        return result;
    }

    public void removeHash(String key1, String key2) {
        if (this.exists(key1)) {
            this.redisTemplate.opsForHash().delete(key1, new Object[]{key2});
        }

    }

    public void delete(String key) {
        this.redisTemplate.opsForHash().delete(key);
    }
}
