package com.example.demo._00_util.util;
public class SnowflakeMini {
	    /**
	     * 開始時間截 (1970-01-01)
	     */
	    private final static long twepoch = 0L;
	    /**
	     * 機器id，範圍是1到15
	     */
	    private final static long workerId =1L;
	    /**
	     * 機器id所佔的位數，佔4位
	     */
	    private final static long workerIdBits = 4L;
	    /**
	     * 支援的最大機器id，結果是15
	     */
	    private final static long maxWorkerId = ~(-1L << workerIdBits);
	    /**
	     * 生成序列佔的位數
	     */
	    private final static long sequenceBits = 15L;
	    /**
	     * 機器ID向左移15位
	     */
	    private final static long workerIdShift = sequenceBits;
	    /**
	     * 生成序列的掩碼，這裡為最大是32767 (1111111111111=32767)
	     */
	    private final static long sequenceMask = ~(-1L << sequenceBits);
	    /**
	     * 時間截向左移19位(4+15)
	     */
	    private final static long timestampLeftShift = 19L;
	    /**
	     * 秒內序列(0~32767)
	     */
	    private static long sequence = 0L;
	    /**
	     * 上次生成ID的時間截
	     */
	    private static long lastTimestamp = -1L;

	    /**
	     * 獲得下一個ID (該方法是執行緒安全的)
	     *
	     * @return SnowflakeId
	     */
	    public static synchronized long nextId() {
	        //返回以秒為單位的當前時間
	        long timestamp = timeGen();
	        //如果當前時間小於上一次ID生成的時間戳，說明系統時鐘回退過這個時候應當丟擲異常
	        if (timestamp < lastTimestamp) {
	            throw new RuntimeException(
	                    String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", lastTimestamp - timestamp));
	        }
	        //藍色程式碼註釋結束
	        //紅色程式碼註釋開始
	        //如果是同一時間生成的，則進行秒內序列
	        if (lastTimestamp == timestamp) {
	            sequence = (sequence + 1) & sequenceMask;
	            //秒內序列溢位
	            if (sequence == 0) {
	                //阻塞到下一個秒,獲得新的秒值
	                timestamp = tilNextMillis(lastTimestamp);
	            }
	            //時間戳改變，秒內序列重置
	        }
	        //紅色程式碼註釋結束
	        //綠色程式碼註釋開始
	        else {
	            sequence = 0L;
	        }
	        //綠色程式碼註釋結束
	        //上次生成ID的時間截
	        lastTimestamp = timestamp;
	        //黃色程式碼註釋開始
	        //移位並通過或運算拼到一起組成53 位的ID
	        return ((timestamp - twepoch) << timestampLeftShift)
	                | (workerId << workerIdShift)
	                | sequence;
	        //黃色程式碼註釋結束
	    }
	    /**
	     * 阻塞到下一個秒，直到獲得新的時間戳
	     *
	     * @param lastTimestamp 上次生成ID的時間截
	     * @return 當前時間戳
	     */
	    protected static long tilNextMillis(long lastTimestamp) {
	        long timestamp = timeGen();
	        while (timestamp <= lastTimestamp) {
	            timestamp = timeGen();
	        }
	        return timestamp;
	    }
	    /**
	     * 返回以秒為單位的當前時間
	     *
	     * @return 當前時間(秒)
	     */
	    protected static long timeGen() {
	        return System.currentTimeMillis()/1000L;
	    }

}
