package Test;

import redis.clients.jedis.Jedis;

public class test {
	
	public static void main(String[] args) {
		Jedis jedis = new Jedis("192.168.111.128");
		jedis.set("foo", "bar");
		String value = jedis.get("foo");
		System.out.println(value);
		
	}
}
